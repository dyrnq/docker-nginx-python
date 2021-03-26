#!/usr/bin/with-contenv sh


s6action=$1
svcname=$2

case ${s6action} in
	status)
		#echo 'Checking the status of service ${svcname} ... ...'
		exec s6-svstat /var/run/s6/services/${svcname}
	;;
	start | up)
		#echo 'Starting service ${svcname} ... ...'
		exec s6-svc -u /var/run/s6/services/${svcname}
	;;
	stop | down)
		#echo 'Stoping service ${svcname} ... ...'
		exec s6-svc -d /var/run/s6/services/${svcname}
	;;
	reload)
		#echo 'Reloading service ${svcname} configurations... ...'
		exec s6-svc -h /var/run/s6/services/${svcname}
	;;
	restart)
		#echo 'Restarting service ${svcname} ... ...'
		exec s6-svc -t /var/run/s6/services/${svcname}
	;;
    list-units | list)
        for sv in $(ls /var/run/s6/services/);do printf "%-20s" ${sv} ; s6-svstat /var/run/s6/services/${sv}; done;
        exit 0
    ;;
	daemon-reload)
	;;
	*)
        echo $"Usage: $0 {start|stop|status|restart|reload|list-units}"
        exit 1
esac 

unset svcname s6action