source common.sh
rm -f /tmp/expense.log
if [ -z "$1" ]; then
  echo "Input MySQL password is missing"
  exit 1
fi

HEADING Installing Mysql server
dnf install mysql-server -y &>> /tmp/expense.log
STAT $?

HEADING Enabling and starting mysqld service
systemctl enable mysqld &>> /tmp/expense.log
systemctl start mysqld &>> /tmp/expense.log
STAT $?

HEADING Updating with password
mysql_secure_installation --set-root-pass $1 &>> /tmp/expense.log
STAT $?
