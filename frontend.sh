echo installing nginx
dnf install nginx -y

echo copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf

echo clean old content
rm -rf /usr/share/nginx/html/*

echo download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

echo extract the content
unzip /tmp/frontend.zip

echo restart the service
systemctl restart nginx
systemctl enable nginx
