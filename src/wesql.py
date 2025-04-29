import mysql.connector
from src.weconfig import WeConfig

class WeSQL:
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

    def execute_query(self, query, params=None, fetch=False):
        """
        Ejecuta una consulta SQL genérica.

        Args:
            query (str): La consulta SQL a ejecutar.
            params (tuple, optional): Parámetros para la consulta (usados en consultas parametrizadas).
            fetch (bool, optional): Si es True, retorna los resultados de la consulta (para SELECT).
                                     Si es False, no retorna nada (para INSERT, UPDATE, DELETE).

        Returns:
            list or None: Los resultados de la consulta si fetch=True, de lo contrario None.
        """
        try:
            if params:
                self.cursor.execute(query, params)
            else:
                self.cursor.execute(query)

            if fetch:
                return self.cursor.fetchall()  # Retorna los resultados para SELECT
            else:
                self.mydb.commit()  # Confirma los cambios para INSERT, UPDATE, DELETE
                return None

        except mysql.connector.Error as err:
            print(f"Error al ejecutar la consulta: {err}")
            raise

    def close(self):
        """
        Cierra la conexión a la base de datos.
        """
        self.cursor.close()
        self.mydb.close()
        print("Conexión cerrada.")







"""
# Uso de la clase
if __name__ == "__main__":
    db = WeSQL()

    # Obtener y mostrar un solo cliente
    cliente = db.fetch_one("SELECT * FROM clientes LIMIT 1;")
    print("Primer cliente:", cliente)

"""
