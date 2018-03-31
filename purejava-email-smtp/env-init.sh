ssh root@host01 'LOGFILE=/var/log/ogham-katacoda-debug.log && echo "" > $LOGFILE 2>&1 && apt update >> $LOGFILE 2>&1 && apt install -y git openjdk-8-jdk maven apache2 roundcube-sqlite3 >> $LOGFILE 2>&1 && service apache2 start'

# #docker-compose up -d
# LOGFILE=/var/log/ogham-katacoda-debug.log

# echo "" > $LOGFILE 2>&1

# # install dependencies
# apt update >> $LOGFILE 2>&1
# apt install -y git openjdk-8-jdk maven apache2 roundcube roundcube-sqlite3 >> $LOGFILE 2>&1
# echo "---------------------------------------------------------" >> $LOGFILE 2>&1

# service apache2 start >> $LOGFILE 2>&1

# cd ~/code

# # # download sample code
# # cd ~
# # git clone -b docs/katacoda https://github.com/groupe-sii/ogham.git >> $LOGFILE 2>&1
# # cd ogham/sample-standard-usage
# # ./mvnw install -DskipTests >> $LOGFILE 2>&1


# # # prepare editor sources
# # cd ~/tutorial
# # ln -s ~/ogham/sample-standard-usage



# #docker run -p 143:143 -p 587:587 -p 80:80 -d roundcube/roundcubemail:1.3.4 > $LOGFILE 2>&1



