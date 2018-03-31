ENVDIR=/home/env
alias java="docker-compose -f $ENVDIR/docker-compose-tools.yml run -v $(pwd):$(pwd) -w $(pwd) maven java"
alias javac="docker-compose -f $ENVDIR/docker-compose-tools.yml run -v $(pwd):$(pwd) -w $(pwd) maven javac"
alias mvn="docker-compose -f $ENVDIR/docker-compose-tools.yml run -v $(pwd):$(pwd) -w $(pwd) maven mvn"
alias gradle="docker-compose -f $ENVDIR/docker-compose-tools.yml run -v $(pwd):$(pwd) -w $(pwd) gradle gradle"
touch /var/log/ogham-katacoda-steps.log
tail -f /var/log/ogham-katacoda-steps.log
