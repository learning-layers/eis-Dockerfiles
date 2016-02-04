#!/bin/sh

cd EIS
# do necessary replacements by environment variable values
echo "setting config ..."
sed -i "s#EIS_DB_NAME#${EIS_DB_NAME}#g" /etc/system.ers.properties
sed -i "s#EIS_DB_USER#${EIS_DB_USER}#g" /etc/system.ers.properties
sed -i "s#EIS_DB_PASS#${EIS_DB_PASS}#g" /etc/system.ers.properties

echo "conf printout ...."
cat /etc/system.ers.properties

chmod u+x /bin/start_network.sh

bin/start_network.sh
