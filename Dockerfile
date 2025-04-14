FROM odoo:18.0

COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo

ENV PORT=8069

CMD ["odoo", "--config=/etc/odoo/odoo.conf", "--xmlrpc-port", "$PORT"]
