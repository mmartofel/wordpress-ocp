
oc delete secret mysql -n wordpress

oc create secret generic mysql -n wordpress \
  --from-literal=MYSQL_ROOT_PASSWORD=openshift \
  --from-literal=MYSQL_DATABASE=wordpress \
  --from-literal=MYSQL_USER=wordpress \
  --from-literal=MYSQL_PASSWORD=wordpress

