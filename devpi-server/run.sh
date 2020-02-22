echo -e 'start supervisord'
/usr/local/bin/supervisord -c /root/gen-config/supervisord.conf

echo -e 'start nginx'
nginx -g 'daemon off;'
