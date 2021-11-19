
echo
echo "Creating new Red Hat OpenShift project that will host your Wordpress instance."
echo

if [ "$1" ]; then
  echo "Creating project" $1
    oc new-project $1 --description='Wordpress instance'
  echo
    oc project
  echo
else
  echo "ERROR:"
  echo "  Script parameter missing. Please provide a valid project name to create."
  echo 
  echo "   example:"
  echo 
  echo "    ./1-create-project.sh wordpress"
  echo
fi

