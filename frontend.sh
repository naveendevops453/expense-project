source common.sh
rm -f /tmp/expense.log

HEADING Installing nginx
dnf install nginx -y &>> /tmp/expense.log
echo exit status - $?

HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf  &>> /tmp/expense.log
echo exit status - $?

HEADING Clean old content
rm -rf /usr/share/nginx/html/*  &>> /tmp/expense.log
echo exit status - $?

HEADING Download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>> /tmp/expense.log
cd /usr/share/nginx/html
echo exit status - $?

HEADING Extract the content
unzip /tmp/frontend.zip &>> /tmp/expense.log
echo exit status - $?

HEADING Restart the service
systemctl restart nginx &>> /tmp/expense.log
systemctl enable nginx &>> /tmp/expense.log
echo exit status - $?