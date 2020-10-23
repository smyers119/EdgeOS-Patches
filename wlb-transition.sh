#!/bin/bash
#/config/scripts# cat wlb-transition.sh                                                                                                                                                    
# Copyright @Branob from community.ui.com                                                                                                                                                           GROUP=$1                                                                                                                                                       
INTF=$2                                                                                                                                                        
STATUS=$3                                                                                                                                                      
                                                                                                                                                               
TS=$(date +"%Y%m%d-%T")                                                                                                                                        
                                                                                                                                                               
                                                                                                                                         
msg="Subject: ALERT: Internet Connection on $INTF status $STATUS
From: nobody@host.example.com
Date: `date -R`


Interface: $INTF, Group: $GROUP, Status: $STATUS"


echo "$msg" |curl -s 'smtps://host.example.com' --ssl-reqd  \
--mail-from 'somebody@example.com'  \
--mail-rcpt 'somebody@example.com'  \
--user 'somebody:password' --insecure                                                                    


case "$STATUS" in
  active)
  msg="$TS: Internet connection $GROUP:$INTF is active."   
  ;;
  inactive)
   msg="$TS: Internet connection $GROUP:$INTF is inactive."
  ;;
  failover)
    msg="$TS: Internet connection $GROUP:$INTF is failover."   
  ;;
  *)
   msg="$TS: Oh crap, $GROUP:$INTF going [$STATUS]"
  ;;
esac


logger $msg
exit 0
