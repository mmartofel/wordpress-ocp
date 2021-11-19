
echo
echo "Creating secret for MySQL database ..."
echo

oc create secret generic mysql \
  --from-literal=MYSQL_ROOT_PASSWORD=openshift \
  --from-literal=MYSQL_DATABASE=wordpress \
  --from-literal=MYSQL_USER=wordpress \
  --from-literal=MYSQL_PASSWORD=wordpress

echo
