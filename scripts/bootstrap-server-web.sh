# this is a placeholder to put the scripts required to bootstrap the compute
useradd oracle
yum install -y docker
yum install -y git
yum install -y python3-pip
yum install -y httpd-tools
firewall-cmd --permanent --add-port=8080/tcp --zone=public
firewall-cmd --permanent --add-port=8081/tcp --zone=public
firewall-cmd --reload
service docker start
docker network create theia_network
usermod -a -G docker oracle
