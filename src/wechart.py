import os
import mysql.connector
import matplotlib.pyplot as plt
from  src.weconfig import WeConfig



class WeChart:
    """
    Clase para crear gráficas de pesos de tablas en una base de datos.
    Permite visualizar el número de registros por tabla y el peso de las tablas.
    """

    def __init__(self, ruta_guardado='/mnt/c/py/graficas'):
        """
        Inicializa la clase WeChart.

        Args:
            ruta_guardado (str): Directorio donde se guardarán las gráficas generadas.
        """
        self.ruta_guardado = ruta_guardado

        # Crear directorio si no existe
        if not os.path.exists(self.ruta_guardado):
            os.makedirs(self.ruta_guardado)

    def graficar_barras(self, nombres_tablas, valores, titulo='Registros por Tabla',
                        nombre_archivo='grafica_barras.png', color='b'):
        """
        Genera una gráfica de barras con los nombres de las tablas y sus valores.

        Args:
            nombres_tablas (list): Lista con los nombres de las tablas.
            valores (list): Lista con los valores de cada tabla (registros o pesos).
            titulo (str): Título de la gráfica.
            nombre_archivo (str): Nombre del archivo para guardar la gráfica.
            color (str): Color de las barras.
            mostrar (bool): Si es True, muestra la gráfica después de guardarla.
        """
        plt.figure(figsize=(12, 6))
        plt.bar(nombres_tablas, valores, label=titulo, color=color)

        # Personalizar la gráfica
        plt.title(titulo)
        plt.xlabel('Tablas')
        plt.ylabel('Valor')
        plt.xticks(rotation=45, ha='right')
        plt.tight_layout()
        plt.legend()
        plt.grid(axis='y')

        # Guardar la gráfica como imagen
        ruta_completa = os.path.join(self.ruta_guardado, nombre_archivo)
        plt.savefig(ruta_completa, dpi=300)



        return ruta_completa


class DatabaseAnalyzer:
    """
    Clase para analizar una base de datos MySQL, obtener tablas y calcular sus pesos.
    """

    def __init__(self):
        config = WeConfig().get("wesql")  # Obtiene la configuración de la base de datos desde config.json

        # Conectar con la base de datos usando los valores del archivo de configuración
        self.connection = mysql.connector.connect(
            host=config.get("host"),
            user=config.get("username"),
            password=config.get("password"),
            database=config.get("db"),
            port=int(config.get("port")),
            auth_plugin='mysql_native_password'
        )

    def get_all_tables(self):
        """
        Obtiene todas las tablas disponibles en la base de datos.

        Returns:
            list: Lista con los nombres de todas las tablas en la base de datos.
        """
        "table[0]  es para obtener los nombres de las tablas "
        
        cursor = self.connection.cursor()
        cursor.execute("SHOW TABLES")
        #usando lista de compresion para obtener las tablas en un arreglo

        tables = [table[0] for table in cursor]
        cursor.close()
        return tables

    def get_table_count(self, table_name):
        """
        Obtiene el número de registros en una tabla específica.

        Args:
            table_name (str): Nombre de la tabla.

        Returns:
            int: Número de registros en la tabla.
        """
        cursor = self.connection.cursor()
        cursor.execute(f"SELECT COUNT(*) FROM `{table_name}`")
        count = cursor.fetchone()[0]
        cursor.close()
        return count

    def get_table_size_mb(self, table_name):
        """
        Obtiene el tamaño en MB de una tabla específica.

        Args:
            table_name (str): Nombre de la tabla.

        Returns:
            float: Tamaño de la tabla en MB.
        """
        cursor = self.connection.cursor()
        query = """
        SELECT 
            ROUND(((data_length + index_length) / 1024 / 1024), 2) AS size_mb
        FROM 
            information_schema.TABLES 
        WHERE 
            table_schema = %s AND table_name = %s
        """
        cursor.execute(query, (self.connection.database, table_name))
        result = cursor.fetchone()
        cursor.close()
        return result[0] if result else 0.0

    def analyze_all_tables(self):
        """
        Analiza todas las tablas de la base de datos obteniendo sus nombres,
        número de registros y tamaño en MB.

        Returns:
            tuple: Tres listas (nombres_tablas, num_registros, pesos_mb)
        """
        tables = self.get_all_tables()
        nombres_tablas = []
        num_registros = []
        pesos_mb = []

        for table in tables:
            nombres_tablas.append(table)
            num_registros.append(self.get_table_count(table))
            pesos_mb.append(self.get_table_size_mb(table))

        return nombres_tablas, num_registros, pesos_mb



