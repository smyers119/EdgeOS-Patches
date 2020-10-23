#!/bin/bash                                                                                                                                                    
                                                                                                                                                               
GROUP=$1                                                                                                                                                       
INTF=$2                                                                                                                                                        
STATUS=$3                                                                                                                                                      
                                                                                                                                                               
MYLOG="/var/log/wlb"                                                                                                                                           
TS=$(date +"%Y%m%d-%T")                                                                                                                                        
                                                                                                                                                               
run=/opt/vyatta/bin/vyatta-op-cmd-wrapper                                                                                                                      
INTFDSCR=$($run show interfaces | grep $INTF | awk '{print $4}')                                                                                               
                                                                                                                                                               
/usr/sbin/conntrack -F                                                                                                                                         
#/usr/sbin/ubnt-add-connected.pl                                                                      

case "$STATUS" in
  active)
    msg="$TS: Internet connection $GROUP:$INTF:$INTFDSCR is active."   
    /config/scripts/pushover.sh "Router $(hostname) WAN fail-over event" "$msg" &    ;;
  inactive)
   msg="$TS: Internet connection $GROUP:$INTF:$INTFDSCR is inactive."
  ;;
  failover)
    msg="$TS: Internet connection $GROUP:$INTF:$INTFDSCR is failover."   
  ;;
  *)
   msg="$TS: Oh crap, $GROUP:$INTF:$INTFDSCR going [$STATUS]"
  ;;
esac

echo $msg >> $MYLOG
logger $msg
exit 0
