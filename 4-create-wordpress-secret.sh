
oc delete configmap wordpress -n wordpress

oc create configmap wordpress -n wordpress \
  --from-literal=WORDPRESS_DB_HOST=mysql \
  --from-literal=WORDPRESS_DB_NAME=wordpress

oc delete secret wordpress-secret -n wordpress

oc create secret generic wordpress-secret -n wordpress \
  --from-literal=WORDPRESS_DB_USER=wordpress \
  --from-literal=WORDPRESS_DB_PASSWORD=wordpress


