FROM odoo:18.0

USER root

RUN apt-get update && apt-get install -y \
    nano \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo

EXPOSE 8069

USER odoo

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
