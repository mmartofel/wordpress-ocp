
echo
echo "Creating ConfigMap and Secret for Wordpress ..."
echo

oc create configmap wordpress \
  --from-literal=WORDPRESS_DB_HOST=mysql \
  --from-literal=WORDPRESS_DB_NAME=wordpress

oc create secret generic wordpress-secret \
  --from-literal=WORDPRESS_DB_USER=wordpress \
  --from-literal=WORDPRESS_DB_PASSWORD=wordpress

echo
