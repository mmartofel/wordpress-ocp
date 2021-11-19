
echo
echo "Creating MySQL database for Wordpress ..."
echo

oc new-app --name mysql --docker-image docker.io/library/mysql:5.7
oc set env deployment/mysql --from secret/mysql

oc label deployment/mysql app.kubernetes.io/part-of=WORDPRESS --overwrite
oc label deployment/mysql app.openshift.io/runtime=mysql-database --overwrite

echo
