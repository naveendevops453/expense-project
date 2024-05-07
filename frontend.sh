source common.sh
rm -f /tmp/expense.log

HEADING Installing nginx
dnf install nginx -y &>> /tmp/expense.log
STAT $?

HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf  &>> /tmp/expense.log
STAT $?

HEADING Clean old content
rm -rf /usr/share/nginx/html/*  &>> /tmp/expense.log
STAT $?

HEADING Download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>> /tmp/expense.log
cd /usr/share/nginx/html
STAT $?

HEADING Extract the content
unzip /tmp/frontend.zip &>> /tmp/expense.log
STAT $?

HEADING Restart the service
systemctl restart nginx &>> /tmp/expense.log
systemctl enable nginx &>> /tmp/expense.log
STAT $?