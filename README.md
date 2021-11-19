# Setup Wordpress with MySQL at Red Hat OpenShift

At this repository I collected scripts that can help you to touch base with Wordpress deployed at Red Hat OpenShift in form the containers (or really K8S pod's).
Scripts make use of Red Hat OpenShift command line utility 'oc' to create required pods, deployments, services and routes using publically available container images.

Let's get started.

First, login to you desired Red Hat OpenShift cluster, for exmple:

`` oc login --token=sha256~[YOUR_TOKEN] --server=https://[YOUR_API_ROUTE]:6443 ``

Run script from 1-... to 5-... accordingly, you should see the output similar to the above:

```
$ ./1-create-project.sh mywordpress

Creating new Red Hat OpenShift project that will host your Wordpress instance.

Creating project mywordpress
Already on project "mywordpress" on server "https://$[YOUR_K8S_CLUSTER_API]:6443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app rails-postgresql-example

to build a new example application in Ruby. Or use kubectl to deploy a simple Kubernetes application:

    kubectl create deployment hello-node --image=k8s.gcr.io/serve_hostname


Using project "mywordpress" on server "https://$[YOUR_K8S_CLUSTER_API]:6443".

$ ./2-create-mysql-secret.sh

Creating secret for MySQL database ...

secret/mysql created

$ ./3-create-mysql-database.sh

Creating MySQL database for Wordpress ...

--> Found container image 8b43c6a (2 days old) from docker.io for "docker.io/library/mysql:5.7"

    * An image stream tag will be created as "mysql:5.7" that will track this image

--> Creating resources ...
    imagestream.image.openshift.io "mysql" created
    deployment.apps "mysql" created
    service "mysql" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose service/mysql'
    Run 'oc status' to view your app.
deployment.apps/mysql updated
deployment.apps/mysql labeled
deployment.apps/mysql labeled

$ ./4-create-wordpress-secret.sh

Creating ConfigMap and Secret for Wordpress ...

configmap/wordpress created
secret/wordpress-secret created

$ ./5-create-wordpress.sh

Creating Wordpress instance ...

serviceaccount/wordpress-servacc created
clusterrole.rbac.authorization.k8s.io/system:openshift:scc:anyuid added: "wordpress-servacc"
--> Found container image e3a452c (18 hours old) from docker.io for "docker.io/library/wordpress:latest"

    * An image stream tag will be created as "wordpress:latest" that will track this image

--> Creating resources ...
    imagestream.image.openshift.io "wordpress" created
    deployment.apps "wordpress" created
    service "wordpress" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose service/wordpress'
    Run 'oc status' to view your app.
deployment.apps/wordpress serviceaccount updated
deployment.apps/wordpress updated
deployment.apps/wordpress updated
deployment.apps/wordpress labeled
deployment.apps/wordpress labeled
route.route.openshift.io/wordpress exposed

Your Wordpress deployment has finished! Please direct your browser here to finish setup:

   https://[YOUT_ROUTE_RETURNED]
```
now head to the link displayed and finish your Wordpress setup.
To cleanup after your setup attempt simply delete entire namespace you created with script one:
```
oc delete project mywordpress
```
