source common.sh
rm -f /tmp/expense.log
HEADING "Disable Nodes JS Default Version"
dnf module disable nodejs -y
STAT $?
HEADING "Enable Node JS version 20"
dnf module enable nodejs:20 -y
STAT $?
HEADING "Install NodeJS"
dnf install nodejs -y
STAT $?
HEADING "Setup Backed Service"
cp backend.service /etc/systemd/system/backend.service
STAT $?
HEADING "Add user expense"
useradd expense
STAT $?
mkdir /app

HEADING "Download backend service"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
STAT $?
cd /app

HEADING "Extract backend code"
unzip /tmp/backend.zip
STAT $?

HEADING "Download and Install Node js dependencies"
npm install
STAT $?

HEADING "Install mysql client"
dnf install mysql -y
STAT $?

HEADING "Load Schema"
mysql -h 172.31.18.96 -uroot -pExpenseApp@1 < /app/schema/backend.sql
STAT $?

HEADING "Reload Demon"
systemctl daemon-reload
STAT $?

HEADING "Enable backend service"
systemctl enable backend
STAT $?

HEADING "Restart backed service"
systemctl restart backend
STAT $?