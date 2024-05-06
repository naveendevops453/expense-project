echo -e "\e[36mInstalling nginx\e[0m"
dnf install nginx -y &> /tmp/expense.log
echo exit status - $?

echo -e "\e[36mCopy expense config file\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf  &> /tmp/expense.log
echo exit status - $?

echo -e "\e[36mClean old content\e[0m"
rm -rf /usr/share/nginx/html/*  &> /tmp/expense.log
echo exit status - $?

echo -e "\e[36mDownload frontend content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &> /tmp/expense.log
cd /usr/share/nginx/html
echo exit status - $?

echo -e "\e[36mExtract the content\e[0m"
unzip /tmp/frontend.zip &> /tmp/expense.log
echo exit status - $?

echo -e "\e[36mRestart the service\e[0m"
systemctl restart nginx &> /tmp/expense.log
systemctl enable nginx &> /tmp/expense.log
echo exit status - $?