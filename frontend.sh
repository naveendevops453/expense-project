echo -e "\e[32mInstalling nginx\e[0m"
dnf install nginx -y
echo exit status - $?

echo -e "\e[32mCopy expense config file\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf
echo exit status - $?

echo -e "\e[32mClean old content\e[0m"
rm -rf /usr/share/nginx/html/*
echo exit status - $?

echo -e "\e[32mDownload frontend content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
echo exit status - $?

echo -e "\e[32mExtract the content\e[0m"
unzip /tmp/frontend.zip
echo exit status - $?

echo -e "\e[32mRestart the service\e[0m"
systemctl restart nginx
systemctl enable nginx
echo exit status - $?