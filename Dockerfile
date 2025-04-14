FROM odoo:18

# Copia el archivo de configuración
COPY ./etc/odoo.conf /etc/odoo/

# Copia tus addons ya descomprimidos
COPY ./addons /mnt/extra-addons

# Exponer el puerto de Odoo
EXPOSE 8069

# Comando para iniciar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
