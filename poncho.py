import couchdb
server = couchdb.Server('http://admin:1234@localhost:5984')

# 2. Seleccionar o crear una base de datos
db_name = 'botlog'
if db_name in server:
    db = server[db_name]
    print(f"Usando la base de datos existente: {db_name}")
else:
    db = server.create(db_name)
    print(f"Base de datos creada: {db_name}")

# 3. Insertar un documento
doc = {
    'nombre': 'Juan',
    'edad': 30,
    'ciudad': 'Madrid',
    'intereses': ['fútbol', 'viajes', 'música']
}
doc_id, doc_rev = db.save(doc)
print(f"Documento insertado con ID: {doc_id} y revisión: {doc_rev}")

# 4. Insertar múltiples documentos
documentos = [
    {'nombre': 'Ana', 'edad': 25, 'ciudad': 'Barcelona'},
    {'nombre': 'Luis', 'edad': 40, 'ciudad': 'Valencia'},
    {'nombre': 'Marta', 'edad': 35, 'ciudad': 'Sevilla'}
]
for doc in documentos:
    db.save(doc)
    print(f"Documento insertado: {doc}")

# 5. Verificar los datos insertados
print("\nDocumentos en la base de datos:")
for doc_id in db:
    print(db[doc_id])