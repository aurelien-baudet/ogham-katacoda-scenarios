ssh root@host01 'LOGFILE=/var/log/ogham-katacoda-debug.log && echo "" > $LOGFILE && STEPSFILE=/var/log/ogham-katacoda-steps.log && echo "Preparing Java and Maven..." >> $STEPSFILE && apt update >> $LOGFILE 2>&1 && apt install -y openjdk-8-jdk maven >> $LOGFILE 2>&1 && echo "Java and Maven are ready !" >> $STEPSFILE && echo "You can now build using Maven" >> $STEPSFILE && echo "" >> $STEPSFILE && echo "Starting webmail..." >> $STEPSFILE && docker run -p 143:143 -p 587:587 -p 8000:80 -e ROUNDCUBEMAIL_DEFAULT_HOST=mail -d roundcube/roundcubemail:1.3.4 >> $LOGFILE 2>&1 && echo "Webmail is ready !" >> $STEPSFILE && echo "" >> $STEPSFILE && echo "You can now try to send your first email by running your code" >> $STEPSFILE'

# > env-init.log 2>&1


#ssh root@host01 'LOGFILE=/var/log/ogham-katacoda-debug.log && echo "" > $LOGFILE 2>&1 && apt update >> $LOGFILE 2>&1 && apt install -y git openjdk-8-jdk maven apache2 roundcube-sqlite3 >> $LOGFILE 2>&1 && service apache2 start'



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



