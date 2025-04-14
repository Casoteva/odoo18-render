# Usa la imagen oficial de Odoo
FROM odoo:18

# Copia el archivo de configuración odoo.conf al contenedor
COPY ./etc/odoo.conf /etc/odoo/

# Si tienes addons personalizados, copia la carpeta addons al contenedor
COPY ./addons /mnt/extra-addons

# Cambia a usuario root para instalar y descomprimir
USER root

# Descomprimir archivo zip y limpiar
RUN apt-get update && apt-get install -y unzip && \
    unzip /mnt/extra-addons/odoo18-render-ready.zip -d /mnt/extra-addons/ && \
    rm /mnt/extra-addons/odoo18-render-ready.zip

# Regresa al usuario odoo para correr el servicio
USER odoo

# Exponer el puerto en el que Odoo se ejecuta
EXPOSE 8069

# Comando para iniciar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
