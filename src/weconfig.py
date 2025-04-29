import json
import os

class WeConfig:
    def __init__(self):

        # Obtener la ruta del archivo config.json
        path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        with open(path + "/config.json", 'r') as file:
            self.config = json.load(file)

    def get(self, key):
        """ Retorna la configuración asociada a la clave dada """
        return self.config.get(key, {})
