export THEIA_IMAGE=$1
shift
export THEIA_USER=$1
shift
export THEIA_PWD=$1
shift
export GIT_REPO=$1
mkdir /home/oracle/repos
cd /home/oracle/repos/
git clone ${GIT_REPO}
cd /home/oracle/repos/oci-theia
bin/theia-ide-run.sh $THEIA_IMAGE
touch infra/compute/auth.htpasswd
echo $THEIA_PWD | bin/add-passwd.sh $THEIA_USER
bin/theia-gw-build.sh
bin/theia-gw-run.sh
