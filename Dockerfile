# Usa la imagen oficial de Odoo
FROM odoo:18

# Copia el archivo de configuración odoo.conf al contenedor
COPY ./etc/odoo.conf /etc/odoo/

# Si tienes addons personalizados, copia la carpeta addons al contenedor
COPY ./addons /mnt/extra-addons

# Si tienes algún archivo comprimido con addons adicionales (odoo18-render-ready.zip)
# Descomprimirlo y copiar su contenido dentro de los addons
RUN apt-get update && apt-get install -y unzip && \
    unzip /mnt/extra-addons/odoo18-render-ready.zip -d /mnt/extra-addons/ && \
    rm /mnt/extra-addons/odoo18-render-ready.zip

# Exponer el puerto en el que Odoo se ejecuta
EXPOSE 8069

# Comando para iniciar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
