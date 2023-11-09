# Utiliza la imagen oficial de PHP con Apache
FROM php:7.4-apache

# Copia tus archivos PHP al directorio /var/www/html del contenedor
COPY ./tus_archivos_php/ /var/www/html/

# Opcional: Si necesitas instalar extensiones de PHP adicionales, puedes hacerlo aquí
# Ejemplo: RUN docker-php-ext-install mysqli

# Opcional: Si necesitas configurar algún archivo de Apache, puedes copiarlo al contenedor
# Ejemplo: COPY ./mi_configuracion_apache.conf /etc/apache2/sites-available/

# Habilita los módulos de Apache si es necesario
# Ejemplo: RUN a2enmod rewrite

# Expon el puerto 80 para que el servidor web sea accesible desde el host
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2-foreground"]
