FROM odoo:18.0

USER root

# Instalar herramientas útiles
RUN apt-get update && apt-get install -y \
    nano \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivo de configuración y addons al contenedor
COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

# Configurar permisos para Odoo
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo

# Exponer el puerto 8069 para la conexión HTTP de Odoo
EXPOSE 8069

# Establecer el usuario odoo para ejecutar el contenedor
USER odoo

# Comando por defecto para iniciar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]

