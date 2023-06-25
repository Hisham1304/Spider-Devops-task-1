chmod +x monitor.sh

(crontab -l 2>/dev/null; echo "0 18 * * * $(pwd)/monitor.sh") > temp_cron
crontab temp_cron
rm temp_cron


