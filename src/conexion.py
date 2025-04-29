from src.weconfig import WeConfig
import mysql.connector


class BaseDB:
    def __init__(self):
        """
        Inicializa la conexión a la base de datos usando la configuración proporcionada.
        """

        config = WeConfig().get("wesql")  # Obtiene la configuración de la base de datos desde config.json

        # Conectar con la base de datos usando los valores del archivo de configuración
        self.mydb = mysql.connector.connect(
            host=config.get("host"),
            user=config.get("username"),
            password=config.get("password"),
            database=config.get("db"),
            port=int(config.get("port")),
            auth_plugin='mysql_native_password'
        )
        self.cursor = self.mydb.cursor(dictionary=True)

    def close(self):
        """
        Cierra la conexión a la base de datos.
        """
        if self.mydb.is_connected():
            self.cursor.close()
            self.mydb.close()
            print("Conexión cerrada.")