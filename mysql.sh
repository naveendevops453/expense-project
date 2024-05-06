echo -e "\e[36mInstalling Mysql server\e[0m"
dnf install mysql-server -y
echo exit status - $?

echo -e "\e[36Enabling and starting mysqld service\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo exit status - $?

echo -e "\e[36mUpdating with password\e[0m"
mysql_secure_installation --set-root-pass $1
echo exit status - $?
