from src.weconfig import  WeConfig
import os

class WeFile:
    def __init__(self):

        config = WeConfig()  # Se instancia una sola vez
        c_defile = config.get("wefile")

        self.tmp_path = c_defile["path"]

        # Asegurar que la carpeta tmp existe
        if not os.path.exists(self.tmp_path):
            os.makedirs(self.tmp_path)

    def write(self, filename, content):
        file_path = os.path.join(self.tmp_path, filename)
        with open(file_path, 'a') as file:
            file.write(content)

    def create(self, filename):
        file_path = os.path.join(self.tmp_path, filename)
        with open(file_path, 'w') as file:
            file.write("Hola desde wefile")
        print(f"Archivo creado: {file_path}")
