import couchdb
from datetime import datetime


class WeBitacora:
    def __init__(self, couchdb_url='http://admin:1234@localhost:5984', db_name='botlog'):
        """
        Inicializa la conexión con CouchDB y prepara la base de datos de bitácora.
        """
        try:
            self.server = couchdb.Server(couchdb_url)

            if db_name in self.server:
                self.db = self.server[db_name]
                print(f"Usando la base de datos existente: {db_name}")
            else:
                self.db = self.server.create(db_name)
                print(f"Base de datos creada: {db_name}")

        except Exception as e:
            print(f"Error al conectar con CouchDB: {str(e)}")
            self.db = None

    def _convert_timestamp(self, ts):
        """Convierte timestamp (int/float) a string ISO formatado o None"""
        if ts is None:
            return None
        try:
            if isinstance(ts, (int, float)):
                return datetime.fromtimestamp(ts).isoformat()
            elif isinstance(ts, datetime):
                return ts.isoformat()
        except Exception as e:
            print(f"Error convirtiendo timestamp: {str(e)}")
        return None

    def registrar(self, message):
        """
        Registra un mensaje del bot en la base de datos CouchDB.
        """
        if not self.db:
            print("No hay conexión a la base de datos. No se puede registrar.")
            return

        try:
            doc = {
                'type': 'message_log',
                'message_id': str(message.id),
                'chat_id': str(message.chat.id),
                'chat_type': message.chat.type,
                'user_first_name': getattr(message.from_user, 'first_name', None),
                'user_username': getattr(message.from_user, 'username', None),
                'text': message.text,
                'message_date': self._convert_timestamp(getattr(message, 'date', None)),
                'is_bot': getattr(getattr(message, 'from_user', None), 'is_bot', False),
                'log_timestamp': datetime.now().isoformat(),
                'raw_date': getattr(message, 'date', None)  # Conservamos el valor original
            }

            # Limpieza de valores None
            doc = {k: v for k, v in doc.items() if v is not None}

            doc_id, doc_rev = self.db.save(doc)
            print(f"Mensaje registrado con ID: {doc_id}")
            return True

        except Exception as e:
            print(f"Error al registrar mensaje: {str(e)}")
            return False