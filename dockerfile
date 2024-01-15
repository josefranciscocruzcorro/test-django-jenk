# Utiliza la imagen oficial de Python 3.9
FROM python:3.9

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el contenido del directorio actual al directorio /app en el contenedor
COPY . /app

# Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto 8000 para que pueda ser accedido desde fuera del contenedor
EXPOSE 3005

# Comando para ejecutar la aplicación cuando el contenedor se inicie
CMD ["python", "manage.py", "runserver", "0.0.0.0:3005"]