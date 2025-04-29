import requests
from src.weconfig import WeConfig

class Webot:

    def __init__(self):

        c_webot = WeConfig().get("webot")

        # Acceder a los valores dentro de "webot"
        token = c_webot['token']
        chat_id = c_webot['chat_id']

        url_api = "https://api.telegram.org/bot" + token  + "/sendMessage?chat_id="
        self.url = url_api + chat_id + "&text="

    def send_msg(self,msg):
        link = self.url + msg
        response = requests.get(link)

