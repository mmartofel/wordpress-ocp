
oc delete all -l app=mysql

sleep 5

oc new-app --name mysql --docker-image docker.io/library/mysql:5.7 -n wordpress
oc set env deployment/mysql --from secret/mysql -n wordpress

oc label deployment/mysql app.kubernetes.io/part-of=WORDPRESS --overwrite -n wordpress
oc label deployment/mysql app.openshift.io/runtime=mysql-database --overwrite -n wordpress

