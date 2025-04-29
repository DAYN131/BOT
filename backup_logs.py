import os
from datetime import datetime

class WeBackUp:
    def __init__(self):
        self.path = "/var/log/mysql/"
        self.backupPath = "/mnt/c/py/folder1/"
        self.content = None

    def read_file(self, filename):
        original_file = os.path.join(self.path, filename)

        if not os.path.exists(original_file):
            print(f"El archivo {filename} no existe en la ruta especificada: {self.path}")
            return False

        with open(original_file, 'r') as f:
            self.content = f.read()

        return True

    def backup_file(self, filename):
        success = self.read_file(filename)

        if not success:
            print(f"No se pudo leer el archivo {filename}.")
            return

        # Fecha y hora de la creación del documento
        timestamp = datetime.now().strftime('%Y-%m-%d_%H%M%S')

        # Nombre del documento
        name, ext = os.path.splitext(filename)
        backup_file_name = f"{name}_{timestamp}{ext}"

        # Asignar ruta y nombre
        new_file = os.path.join(self.backupPath, backup_file_name)

        # Escribir el contenido en el nuevo archivo
        try:
            with open(new_file, 'w') as file:
                file.write(self.content)
            print(f"El archivo {filename} copiado en la ruta de respaldo: {self.backupPath}")
        except IOError as e:
            print(f"No se pudo escribir el archivo de respaldo: {e}")


instancia = WeBackUp()
instancia.backup_file("general.log")
instancia.backup_file("error.log")
instancia.backup_file("slow.log")


