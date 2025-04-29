import csv
import telebot
from src.wefile import WeFile
from src.weconfig import WeConfig
from src.wesql import WeSQL
from src.webackup import DatabaseBackup, LogBackup
from src.werestore import WeRestore
from src.wechart import WeChart
from src.wechart import DatabaseAnalyzer
from src.webitacora import WeBitacora

import os

bitacora = WeBitacora()
wconfig = WeConfig()
bot = telebot.TeleBot(wconfig.get("webot").get("token"),
                      parse_mode=None)  # You can set parse_mode by default. HTML or MARKDOWN

#decorador que define un manejador de mensajes que responde a los comandos
# /start and /help
@bot.message_handler(commands=['ayuda', 'help'])

def send_welcome(message):
    bitacora.registrar(message)
    # Crear un mensaje con la lista de comandos
    comandos = """
    Lista de comandos disponibles:

    ⚙️ /ayuda o /help - Muestra esta lista de comandos.
    📄/create_file nombre_archivo   -Crea un archivo de tipo texto y tu puedes colocar el contenido si asi lo deseas.
    📌/sql_cmd -  Ejecuta una consulta SQL: select * from clientes. Opción a descargar el archivo (.csv).
    💾/backup     PuntoVenta - Realiza un backup y lo envía por SSH.
       /backup_logs - Crea un respaldo de los archivos log (error.log,slow.log,general.log) y los envia al usuario
    📤/restore -  Muestra listados de backups y permite seleccionar uno por número.
    📊/chart -    Muestra gráficas con los pesos de la tabla y el número de registros.
    👤/autor -    Muestra los datos académicos y una foto del autor.
    """

    # Responder con la lista de comandos
    bot.reply_to(message, comandos)

@bot.message_handler(commands=['autor'])

def send_author_information(message):
    bitacora.registrar(message)
    # Enviar una foto (reemplaza 'foto.jpg' con la ruta de tu foto)
    with open('daniel.jpg', 'rb') as photo:
        bot.send_photo(message.chat.id, photo, caption="Este soy yo!")

    # Enviar tu nombre y datos académicos
    datos_academicos = """
        Nombre: Daniel Martinez Hernandez
        Numero de control: 22590336
        """
    bot.send_message(message.chat.id, datos_academicos)

@bot.message_handler(commands=['create_file', ''])

def send_file(message):
    bitacora.registrar(message)
    msg = message.text.split(" ")
    filename = f"{msg[1]}.txt"
    filepath = os.path.join("mnt/c/py/tmp", filename)  # Obtener ruta completa

    sent_msg = bot.send_message(message.chat.id, "Desea Ingresar el contenido del archivo? S para si y N para no")
    bot.register_next_step_handler(sent_msg, process_response, filename, filepath)

def process_response(message, filename, filepath):
    bitacora.registrar(message)
    opcion = message.text.upper()

    if opcion == "S":
        sent_msg = bot.send_message(message.chat.id, "Ingrese todo el texto del archivo txt")
        bot.register_next_step_handler(sent_msg, process_file_content, filename, filepath)
    elif opcion == "N":
        WeFile().write(filename, "")  # Crear archivo vacío
        bot.reply_to(message, "Archivo creado vacío, enviándolo...")
        send_created_file(message.chat.id, filepath)
    else:
        bot.reply_to(message, "Respuesta inválida. Por favor, responda con S o N.")

def process_file_content(message, filename, filepath):
    bitacora.registrar(message)
    content = message.text
    WeFile().write(filename, content)
    bot.reply_to(message, "Archivo creado con el contenido ingresado, enviándolo...")
    send_created_file(message.chat.id, filepath)

def send_created_file(chat_id, filepath):
    try:
        with open(filepath, "rb") as file:
            bot.send_document(chat_id, file)
    except FileNotFoundError:
        bot.send_message(chat_id, "Hubo un error al encontrar el archivo.")


@bot.message_handler(commands=['sql_cmd'])
def handle_sql_cmd(message):
    bitacora.registrar(message)
    try:
        # Obtener la consulta SQL del mensaje del usuario
        query = message.text.replace('/sql_cmd', '').strip()

        if not query:
            bot.reply_to(message, "Por favor, proporciona una consulta SQL.")
            return

        # Conectar a la base de datos
        db = WeSQL()

        # Ejecutar la consulta
        if query.lower().startswith("select"):
            # Si es una consulta SELECT, obtener los resultados
            resultados = db.execute_query(query, fetch=True)

            if not resultados:
                bot.reply_to(message, "No se encontraron resultados.")
                return

            # Crear un archivo CSV temporal
            csv_filename = "resultados.csv"
            with open(csv_filename, mode="w", newline="", encoding="utf-8") as file:
                writer = csv.DictWriter(file, fieldnames=resultados[0].keys())
                writer.writeheader()
                writer.writerows(resultados)

            # Enviar el archivo CSV al usuario
            with open(csv_filename, "rb") as file:
                bot.send_document(message.chat.id, file, caption="Aquí tienes los resultados de tu consulta en CSV.")

            # Eliminar el archivo CSV temporal
            os.remove(csv_filename)
        else:
            # Si es una consulta INSERT, UPDATE o DELETE, ejecutarla sin retornar resultados
            db.execute_query(query)
            bot.reply_to(message, "Consulta ejecutada correctamente.")

        # Cerrar la conexión a la base de datos
        db.close()

    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error: {str(e)}")



@bot.message_handler(commands=['backup'])
def handle_backup_db(message):
    bitacora.registrar(message)
    """
    Ejecuta el backup de la base de datos y notifica al usuario.
    """
    try:
        # Crear una instancia de DatabaseBackup
        db_backup = DatabaseBackup()

        # Ejecutar el backup
        db_backup.create_backup()

        # Notificar al usuario en Telegram
        bot.reply_to(message, "Backup de la base de datos completado y subido con éxito.")

    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error durante el backup: {str(e)}")

@bot.message_handler(commands=['backup_logs'])
def handle_backup_logs(message):
    bitacora.registrar(message)
    """
    Ejecuta el backup de los archivos logs y los envía al usuario.
    """
    try:

        # Crear una instancia de LogBackup
        log_backup = LogBackup()

        # Realizar el backup de los archivos de logs
        log_files = ["general.log", "error.log", "slow.log"]

        for log_file in log_files:
            #Crear los archivos backup_log
            log_backup.backup_file(log_file)
            #obtener la ruta del archivo creado gracias al
            #atributo backup_file_path
            path_file = log_backup.backup_file_path
            with open(path_file, "rb") as file:
                bot.send_document(message.chat.id, file)

        # Notificar al usuario que el proceso ha terminado
        bot.reply_to(message, "Backup de logs completado y archivos enviados.")

    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error durante el backup: {str(e)}")


@bot.message_handler(commands=['restore'])
def handle_restore(message):
    bitacora.registrar(message)
    """
    Muestra los backups de la carpeta backup y permite restaurar el que el usuario desee.
    Crea una nueva base de datos para restaurar el respaldo seleccionado.
    """
    try:
        # Ruta de la carpeta de backups
        backup_folder = "backup"
        if not os.path.exists(backup_folder):
            bot.reply_to(message, f"La carpeta de backups '{backup_folder}' no existe.")
            return

        # Obtener la lista de archivos de respaldo
        backup_files = [f for f in os.listdir(backup_folder) if f.endswith(".sql")]
        if not backup_files:
            bot.reply_to(message, f"No hay archivos de respaldo en la carpeta '{backup_folder}'.")
            return

        # Mostrar la lista numerada de backups
        backup_list = "\n".join([f"{i+1}. {f}" for i, f in enumerate(backup_files)])
        bot.reply_to(message, f"Backups disponibles:\n{backup_list}\n\nResponde con el número del backup que deseas restaurar.")

        # Registrar el siguiente paso para manejar la selección del usuario
        bot.register_next_step_handler(message, process_backup_selection, backup_files)

    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error: {str(e)}")


def process_backup_selection(message, backup_files):
    bitacora.registrar(message)
    """
    Procesa la selección del usuario y restaura el backup seleccionado.
    """
    try:
        # Obtener el número seleccionado por el usuario
        selected_number = int(message.text.strip())
        if selected_number < 1 or selected_number > len(backup_files):
            bot.reply_to(message, "Número inválido. Por favor, elige un número de la lista.")
            return

        # Obtener el archivo de respaldo seleccionado
        selected_backup = backup_files[selected_number - 1]
        backup_path = os.path.join("backup", selected_backup)

        # Crear una nueva base de datos para restaurar el respaldo
        #new_database_name = f"restored_db_{selected_number}"
        restore = WeRestore()
        #restore.create_database(new_database_name)
        #restore.create_database("PuntoVenta")
        # Restaurar el respaldo en la nueva base de datos
        restore.restore_database("PuntoVenta", backup_path)

        #bot.reply_to(message, f"Backup '{selected_backup}' restaurado exitosamente en la base de datos '{new_database_name}'.")
        bot.reply_to(message,f"Backup '{selected_backup}' restaurado exitosamente en la base de datos .")
        
    except ValueError:
        bot.reply_to(message, "Por favor, ingresa un número válido.")
    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error al restaurar el backup: {str(e)}")

@bot.message_handler(commands=['chart'])
def handle_chart(message):
    bitacora.registrar(message)
    """
    Función principal que utiliza DatabaseAnalyzer y WeChart para analizar
    y graficar información sobre las tablas de una base de datos.
    """
    try:
        # Crear instancia del analizador de base de datos
        db_analyzer = DatabaseAnalyzer()

        # Analizar todas las tablas
        nombres_tablas, num_registros, pesos_mb = db_analyzer.analyze_all_tables()

        # Verificar si se obtuvieron datos
        if not nombres_tablas:
            bot.reply_to(message, "No se encontraron tablas para analizar.")
            return

        # Crear instancia de WeChart
        wechart = WeChart()

        # Ordenar los datos por peso (de mayor a menor) para mejor visualización
        datos_ordenados = sorted(zip(nombres_tablas, num_registros, pesos_mb),
                               key=lambda x: x[2], reverse=True)
        nombres_ordenados, registros_ordenados, pesos_ordenados = zip(*datos_ordenados)

        # Generar gráfica de barras para el número de registros
        ruta_registros = wechart.graficar_barras(
            nombres_ordenados,
            registros_ordenados,
            titulo='Número de Registros por Tabla',
            nombre_archivo='registros_por_tabla.png'
        )

        # Generar gráfica de barras para el peso de las tablas
        ruta_pesos = wechart.graficar_barras(
            nombres_ordenados,
            pesos_ordenados,
            titulo='Peso de Tablas en MB',
            nombre_archivo='peso_por_tabla.png',
            color='g'
        )

        # Enviar la gráfica de registros al usuario
        with open(ruta_registros, "rb") as file:
            bot.send_photo(message.chat.id, file, caption="Gráfica de registros por tabla")

        # Enviar la gráfica de pesos al usuario
        with open(ruta_pesos, "rb") as file:
            bot.send_photo(message.chat.id, file, caption="Gráfica de peso de las tablas (MB)")

        # Mensaje de confirmación
        bot.reply_to(message, "Gráficas generadas y enviadas correctamente.")

        # Información adicional en la consola
        print("\nAnálisis completado. Las gráficas han sido guardadas en la carpeta 'graficas_db'.")
        print(f"Se analizaron {len(nombres_tablas)} tablas.")
        print(f"Tabla más pesada: {nombres_ordenados[0]} con {pesos_ordenados[0]:.2f} MB")
        print(f"Tabla con más registros: {nombres_ordenados[0]} con {registros_ordenados[0]} registros")
        print(f"Peso total de la base de datos: {sum(pesos_ordenados):.2f} MB")
        print(f"Total de registros en todas las tablas: {sum(registros_ordenados)}")

    except Exception as e:
        bot.reply_to(message, f"Ocurrió un error al generar las gráficas: {str(e)}")
        print(f"Error: {str(e)}")

@bot.message_handler(func=lambda m: True)
def echo_all(message):
    bot.reply_to(message, message.text)


bot.infinity_polling()