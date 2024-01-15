# Utiliza la imagen oficial de Python 3.9
FROM python:3.9

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el contenido del directorio actual al directorio /app en el contenedor
COPY . /app

# Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Instala el escáner de SonarQube
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip -O sonar-scanner.zip \
    && unzip sonar-scanner.zip \
    && mv sonar-scanner-4.6.2.2472-linux sonar-scanner \
    && rm sonar-scanner.zip

# Ejecuta el análisis de SonarQube
RUN sonar-scanner/bin/sonar-scanner

# Expone el puerto 3005 para que pueda ser accedido desde fuera del contenedor
EXPOSE 3005

COPY ./testjenkins /app

# Comando para ejecutar la aplicación cuando el contenedor se inicie
CMD ["python", "manage.py", "runserver", "0.0.0.0:3005"]