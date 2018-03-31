alias java="docker run -v $(pwd):$(pwd) -w $(pwd) maven:3.5.3-jdk-8-slim java"
alias javac="docker run -v $(pwd):$(pwd) -w $(pwd) maven:3.5.3-jdk-8-slim javac"
alias mvn="docker run -v $(pwd):$(pwd) -w $(pwd) maven:3.5.3-jdk-8-slim mvn"
touch /var/log/ogham-katacoda-steps.log
tail -f /var/log/ogham-katacoda-steps.log
