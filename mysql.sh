source common.sh
if [ -z "$1" ]; then
  echo "Input MySQL password is missing"
  exit 1
fi

HEADING Installing Mysql server
dnf install mysql-server -y
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi

HEADING Enabling and starting mysqld service
systemctl enable mysqld
systemctl start mysqld
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi

HEADING Updating with password
mysql_secure_installation --set-root-pass $1
if [ $? -eq 0 ]; then
  echo SUCCESS
else
  echo FAILURE
  exit 2
fi
