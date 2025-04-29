import os
from src.wessh import  WeSSH
from src.webot import Webot
from datetime import datetime

# fecha y hora de la creacion del documento
timestamp = datetime.now().strftime('%Y-%m-%d_%H%M%S')
# nombre del doc final
file_bckp = f"punto_venta_{timestamp}.sql"
#ruta del documento

#path_bckp = f"mnt/c/py/backup/{file_bckp}"
path_bckp = f"/mnt/c/py/backup/{file_bckp}"

# Hacer el documento
#cmd =f"/usr/bin/mysqldump -u web -p123456789 PuntoVenta > {path_bckp}"
cmd = f"mysqldump -u web -p123456789 PuntoVenta > {path_bckp}"

Webot().send_msg("Realizando backup.py")
os.system(cmd)

# Subir el arcchivo con la clase WeSSH
WeSSH().upload_file(path_bckp,file_bckp)
Webot().send_msg("Archivo subido.py")







