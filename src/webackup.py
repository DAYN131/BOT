import os
from datetime import datetime
from src.wessh import WeSSH
from src.webot import Webot
from src.weconfig import WeConfig


class BackupManager:

    def __init__(self):
        #obtener fecha
        self.timestamp = datetime.now().strftime('%Y-%m-%d_%H%M%S')
        self.bot = Webot()

    def generate_filename(self, prefix, extension):
        """Genera un nombre de archivo con timestamp."""
        return f"{prefix}_{self.timestamp}.{extension}"

    def notify(self, message):
        """Envía una notificación usando Webot."""
        self.bot.send_msg(message)


class DatabaseBackup(BackupManager):
    def __init__(self):
        super().__init__()

    def create_backup(self):
        try:
            config = WeConfig()

            # Obtener configuraciones
            c = config.get("wesql")
            if not c or "username" not in c or "password" not in c or "db" not in c:
                self.notify("Error: Configuración de la base de datos incompleta.")
                return

            d = config.get("backup")
            if not d or "path" not in d:
                self.notify("Error: Ruta de backup no configurada.")
                return

            db_user = c["username"]
            db_password = c["password"]
            db_name = c["db"]
            backup_path = d["path"]

            # Generar nombre del archivo
            filename = self.generate_filename("punto_venta", "sql")
            full_path = os.path.join(backup_path, filename)

            # Crear el backup usando mysqldump
            cmd = f"mysqldump -u {db_user} -p{db_password} {db_name} > {full_path}"
            self.notify("Realizando backup de la base de datos...")
            os.system(cmd)

            # Subir el archivo usando WeSSH
            self.notify("Subiendo archivo de backup...")
            WeSSH().upload_file(full_path, filename)
            self.notify("Backup completado y subido con éxito.")

        except Exception as e:
            self.notify(f"Error durante el backup: {str(e)}")

class LogBackup(BackupManager):

    def __init__(self):
        super().__init__()
        config = WeConfig()
        c = config.get("backup")
        self.log_path = c["log_path"]
        self.backup_path = c["backup_log_path"]
        self.backup_file_path = None


    def backup_file(self, filename):
        original_file = os.path.join(self.log_path, filename)

        if not os.path.exists(original_file):
            self.notify(f"El archivo {filename} no existe en la ruta especificada: {self.log_path}")
            return

        # Leer el contenido del archivo
        with open(original_file, 'r') as f:
            content = f.read()

        # Crear el archivo de backup
        backup_filename = self.generate_filename(os.path.splitext(filename)[0], "log")
        self.backup_file_path = os.path.join(self.backup_path, backup_filename)

        try:
            with open(self.backup_file_path, 'w') as file:
                file.write(content)
        except IOError as e:
            self.notify(f"No se pudo escribir el archivo de respaldo: {e}")