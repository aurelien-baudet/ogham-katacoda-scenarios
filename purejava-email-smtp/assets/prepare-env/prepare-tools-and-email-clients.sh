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

mark_ready() {
  touch /var/run/$1-ready
}


{
  set -x

  ln -sf $ENVDIR/commands/temp-java.sh /usr/bin/java
  ln -sf $ENVDIR/commands/temp-mvn.sh /usr/bin/mvn
  ln -sf $ENVDIR/commands/temp-gradle.sh /usr/bin/gradle

  step "Preparing environment..."

  step "      Preparing Java, Gradle and Maven..."
  docker-compose -f $ENVDIR/docker-compose-tools.yml pull
  mark_ready "java"
  mark_ready "mvn"
  mark_ready "gradle"
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
  cd $ENVDIR
  docker-compose -f $ENVDIR/docker-compose-email-clients.yml up -d
  step "   Mail clients are ready !"

  separator "   "

  step "You can now try to send your first email by running your code"
} >> $LOGFILE 2>&1
