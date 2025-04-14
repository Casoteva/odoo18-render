FROM odoo:18.0

USER root

# Instalar herramientas útiles
RUN apt-get update && apt-get install -y \
    nano \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios en caso de que no existan
RUN mkdir -p /mnt/extra-addons /etc/odoo

# Copiar configuración y módulos personalizados
COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

# Asignar permisos correctos
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo

# Exponer puerto de Odoo
EXPOSE 8069

# Cambiar a usuario odoo
USER odoo

# Comando de arranque
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
