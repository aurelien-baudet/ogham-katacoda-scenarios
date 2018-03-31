ENVDIR=/home/env
LOGFILE=/var/log/ogham-katacoda-debug.log
STEP_SEPARATOR="   ---"
STEPSFILE=/var/log/ogham-katacoda-steps.log

touch $LOGFILE
touch $STEPSFILE


step() {
  echo "$1" >> $STEPSFILE
}

separator() {
  echo "" >> $STEPSFILE
  echo $STEP_SEPARATOR >> $STEPSFILE
  echo "" >> $STEPSFILE
}



{
  step "Preparing environment..."

  step "   Preparing tools..."
  step "      Starting nginx..."
  docker-compose -f $ENVDIR/docker-compose-tools.yml up -d web
  step "      nginx ready !"
  step "      Preparing Java, Gradle and Maven..."
  docker-compose -f $ENVDIR/docker-compose-tools.yml pull
  step "      Java, Gradle and Maven are ready !"
  step "   You can now build using Maven"

  separator "   "

  step "   Generating dependencies cache..."
  step "      Downloading Earth for Maven itself ;)"
  docker-compose -f $ENVDIR/docker-compose-tools.yml run -v $(pwd):$(pwd) -w $(pwd) maven mvn clean install test verify package
  step "   Maven dependencies are downloaded and cached"

  separator "    "

  step "   Starting mail clients..."
  # TODO: distinct step for each email client ?
  docker-compose -f $ENVDIR/docker-compose-email-clients.yml up -d roundcubemail
  step "   Mail clients are ready !"

  separator "   "

  step "You can now try to send your first email by running your code"
} >> $LOGFILE 2>&1
