
echo
echo "Creating Wordpress instance ..."
echo

oc create serviceaccount wordpress-servacc
oc adm policy add-scc-to-user anyuid -z wordpress-servacc

oc new-app --name wordpress --docker-image docker.io/library/wordpress:latest

oc set serviceaccount deployment wordpress wordpress-servacc
oc set env deployment/wordpress --from secret/wordpress-secret
oc set env deployment/wordpress --from configmap/wordpress

oc label deployment/wordpress app.kubernetes.io/part-of=WORDPRESS --overwrite
oc label deployment/wordpress app.openshift.io/runtime=wordpress --overwrite

oc expose service wordpress

echo
echo "Your Wordpress deployment has finished! Please direct your browser here to finish setup:"
echo
echo "   https://"`oc get route wordpress -o template --template='{{ .spec.host }}'` 
echo
