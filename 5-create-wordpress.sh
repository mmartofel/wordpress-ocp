oc delete serviceaccount wordpress-servacc
oc delete all -l app=wordpress

oc create serviceaccount wordpress-servacc -n wordpress
oc adm policy add-scc-to-user anyuid -z wordpress-servacc -n wordpress

oc new-app --name wordpress --docker-image docker.io/library/wordpress:latest -n wordpress

oc set serviceaccount deployment wordpress wordpress-servacc -n wordpress
oc set env deployment/wordpress --from secret/wordpress-secret -n wordpress
oc set env deployment/wordpress --from configmap/wordpress -n wordpress

oc label deployment/wordpress app.kubernetes.io/part-of=WORDPRESS --overwrite -n wordpress
oc label deployment/wordpress app.openshift.io/runtime=wordpress --overwrite -n wordpress


oc expose service wordpress
oc get route 

