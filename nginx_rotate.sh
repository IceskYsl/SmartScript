#!/bin/sh
cd /localstorage/logs/iceskysl
echo $(date +%Y%m%d) > /root/today
sleep 60
mv music.log access_log.$(</root/today)
kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
sleep 1
echo "rotate done for $(</root/today)"
nice -n 19 gzip -c access_log.$(</root/today) > log-cnc1-$(</root/today).gz
echo "gzip log done for $(</root/today)"

#usage:
#add this line in your crontab
#59 23 * * *  (/home/task/nginx_rotate.sh) >> /localstorage/logs/ice_nginx.log 2>&1