import os
from src.weconfig import WeConfig

class WeRestore:
    def __init__(self):
        """
        Inicializa la clase con la configuración de la base de datos.
        """
        config = WeConfig().get("wesql")
        self.host = config["host"]
        self.user = config["username"]
        self.password = config["password"]
        self.port = int(config["port"])

    def restore_database(self, database_name, backup_file):
        """
        Restaura un archivo de respaldo en una base de datos usando el comando `mysql`.

        Args:
            database_name (str): Nombre de la base de datos donde se restaurará el respaldo.
            backup_file (str): Ruta del archivo de respaldo (.sql).
        """
        try:
            # Verificar si el archivo de respaldo existe
            if not os.path.exists(backup_file):
                print(f"El archivo de respaldo '{backup_file}' no existe.")
                return

            # Construir el comando para restaurar la base de datos
            cmd = f"mysql -u {self.user} -p{self.password} -h {self.host} -P {self.port} {database_name} < {backup_file}"

            # Ejecutar el comando
            print(f"Restaurando backup en la base de datos '{database_name}'...")
            os.system(cmd)

            print(f"Backup restaurado exitosamente en la base de datos '{database_name}'.")

        except Exception as e:
            print(f"Ocurrió un error al restaurar el backup: {e}")

    def create_database(self, database_name):
        """
        Crea una nueva base de datos en MySQL.

        Args:
            database_name (str): Nombre de la nueva base de datos.
        """
        try:
            # Construir el comando para crear la base de datos
            cmd = f"mysql -u {self.user} -p{self.password} -h {self.host} -P {self.port} -e 'CREATE DATABASE {database_name};'"

            # Ejecutar el comando
            print(f"Creando la base de datos '{database_name}'...")
            os.system(cmd)

            print(f"Base de datos '{database_name}' creada exitosamente.")

        except Exception as e:
            print(f"Ocurrió un error al crear la base de datos: {e}")