# Importacion de clases
from src.wefile import WeFile
from src.wesql import WeSQL
from src.webot import Webot
#from src.wessh import  WeSSH

class Test:

    def prueba(self):

        #wefile_instance = WeFile()
        #wefile_instance.create("prueba1")
        #wefile_instance.write("static.txt","\n Hola 10")
        #weSSH_instance = WeSSH()

        #db = WeSQL()


        bot = Webot()
        bot.send_msg("hola desde test.py")

test = Test()
test.prueba()