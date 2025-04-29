import matplotlib.pyplot as plt
import numpy as np

# Datos de ejemplo
datos_x = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
datos_y = np.array([0, 0.8, 0.9, 0.1, -0.8, -1, -0.6, 0.2, 0.9, 0.7, 0])

# Crear la gráfica
plt.figure(figsize=(8, 5))
#plt.plot(datos_x, datos_y, label='Datos de ejemplo', color='b', linewidth=2, marker='o')
plt.bar(datos_x, datos_y, label='Datos de ejemplo', color='b')
# Personalizar la gráfica
plt.title('Gráfica con datos de un arreglo')
plt.xlabel('Eje X')
plt.ylabel('Eje Y')
plt.legend()
plt.grid()

# Guardar la gráfica como imagen
plt.savefig('grafica_datos.png', dpi=300)

# Mostrar la gráfica
plt.show()
