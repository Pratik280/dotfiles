#! /bin/sh 

# free -h | while read What TTL Used _; do
# 	if [ "$What" = 'Mem:' ]; then
# 		printf '%s/%s \n' "$Used" "$TTL"
# 		break
# 	fi


echo "CPU `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% RAM `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'`"
