source common.sh

HEADING Installing Mysql server
dnf install mysql-server -y
echo exit status - $?

HEADING Enabling and starting mysqld service
systemctl enable mysqld
systemctl start mysqld
echo exit status - $?

HEADING Updating with password
mysql_secure_installation --set-root-pass $1
echo exit status - $?
