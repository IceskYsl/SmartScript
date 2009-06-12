#!/bin/sh
cd /data/www/iceskysl/log
echo $(date +%Y%m%d) > ./today
sleep 60
cp production.log production_log.$(<./today)
echo -n > production.log
sleep 1
echo "rotate done for $(<./today)"
nice -n 19 gzip  production_log.$(<./today)                                  
echo "gzip log done for $(<./today)":

#usage:
#add this line in your crontab
#59 23 * * *  (/home/task/rails_rotate.sh) >> /localstorage/logs/ice_rails.log 2>&1
