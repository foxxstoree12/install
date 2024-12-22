#!/bin/bash

apt install rclone
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/foxxstoree12/install/main/install/rclone.conf"
git clone https://github.com/casper9/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
cd /usr/bin
wget -O backup "https://raw.githubusercontent.com/foxxstoree12/install/main/menu/backup.sh"
wget -O restore "https://raw.githubusercontent.com/foxxstoree12/install/main/menu/restore.sh"
wget -O cleaner "https://raw.githubusercontent.com/foxxstoree12/install/main/install/cleaner.sh"
chmod +x /usr/bin/backup
chmod +x /usr/bin/restore
chmod +x /usr/bin/cleaner
cd
if [ ! -f "/etc/cron.d/cleaner" ]; then
cat> /etc/cron.d/cleaner << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/2 * * * * root /usr/bin/cleaner
END
fi



if [ ! -f "/etc/cron.d/xp_otm" ]; then
cat> /etc/cron.d/xp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END
fi
cat > /home/re_otm <<-END
7
END

if [ ! -f "/etc/cron.d/bckp_otm" ]; then
cat> /etc/cron.d/bckp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /usr/bin/bottelegram
END
fi

service cron restart > /dev/null 2>&1

# > Pasang Limit

#wget "https://raw.githubusercontent.com/foxxstoree12/install/main/bin/limit.sh" >/dev/null 2>&1

#chmod +x limit.sh && bash limit.sh >/dev/null 2>&1
    
rm -f /root/set-br.sh
#rm -f /root/limit.sh