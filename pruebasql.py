import mysql.connector

try:
    # Conectar a la base de datos
    mydb = mysql.connector.connect(
        host="localhost",
        user="web",
        password="123456789",
        database="PuntoVenta",
        port=3307,
        auth_plugin='mysql_native_password'
    )

    cursor_conexion = mydb.cursor(dictionary=True)

    # Seleccionar todos los clientes
    sql = "SELECT * FROM clientes;"
    cursor_conexion.execute(sql)
    clientes = cursor_conexion.fetchall()

    # Mostrar resultados
    for c in clientes:
        nombre = c['nombre']
        email = c['email']
        telefono = c['telefono']
        print(f"Nombre: {nombre}, Email: {email}, Teléfono: {telefono}")

    # Insertar nuevos clientes
    clnts = [
        {"nombre": "Mau Sandoval", "email": "mau_sandoval@email.com", "telefono": "5512345678"},
    ]

    for c in clnts:
        sql = "INSERT INTO clientes (nombre, email, telefono) VALUES (%s, %s, %s);"
        values = (c['nombre'], c['email'], c['telefono'])
        cursor_conexion.execute(sql, values)
        mydb.commit()
        print(f"Insertado: {c['nombre']}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if 'cursor_conexion' in locals():
        cursor_conexion.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()