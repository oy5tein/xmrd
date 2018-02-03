#!/bin/bash

TARGET = `/usr/local/xmrd`

create folder
mkdir $TARGET
copy scripts 
cp * $TARGET/.

chmod 744 $TARGET/start.sh

mv $TARGET/xmrd.service /etc/systemd/system/



#update install folder in service
match='[Service]'
insert='WorkingDirectory=$TARGET/'
file='/etc/systemd/system/xmrd.service'
sed -i "s/$match/$match\n$insert/" $file

#set premission for service
chmod 644 /etc/systemd/system/xmr-stak.service

#install
systemctl daemon-reload

#enable
systemctl enable xmrd.service

#start
systemctl start xmrd.service


#echo remember to update config.txt with your xmr wallet.




