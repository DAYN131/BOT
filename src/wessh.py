import paramiko
from  src.weconfig import WeConfig
class WeSSH:


    def __init__(self):
        config = WeConfig()  # Instancia única de configuración
        c_ssh = config.get("ssh")

        self.hostname = c_ssh.get("host")
        self.port = int(c_ssh.get("port") )
        self.username = c_ssh.get("user")
        self.password = c_ssh.get("password")

        # Instancia de SSHClient
        self.ssh = None
        self.sftp = None


    def connect(self):
        """Conectar al servidor SSH"""
        try:
            self.ssh.connect(self.hostname, self.port, self.username, self.password)
            print(f"Conectado a {self.hostname}")

        except Exception as e:
            print(f"Error al conectar: {e}")


    def upload_file(self, local_path, remote_path):

        # Crear la instancia SSH
        self.ssh = paramiko.SSHClient()
        self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        # Conectarse con el servivor
        self.connect()
        # Usar SFTP para subir el archivo
        self.sftp = self.ssh.open_sftp()
        self.sftp.put(local_path, remote_path)
        # Cerrar la conexion SFTP Y SSH
        self.close()

    def close(self):

        self.sftp.close()
        self.ssh.close()
        print("Conexiones cerradas")


