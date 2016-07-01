#!/bin/bash
OPTIONS="LTS Weekly_Build"
select opt in $OPTIONS; do
        if [ "$opt" = "LTS" ]; then
           echo "You have chosen Jenkins LTS"
           sleep 3
           apt-get update
           wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
           echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list
           apt-get update
           apt-get install jenkins
           echo "Successfully Installed Jenkins LTS"
           exit
        elif [ "$opt" = "Weekly_Build" ]; then
           echo "You have chosen Jenkins Weekly Build"
           sleep 3
           apt-get update
           wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
           echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
           apt-get update
           apt-get install jenkins
           echo "Successfully Installed Jenkins Weekly Build"
           exit
        else
           clear
           echo Bad Option choose only LTS or Weekly_Build. Please run it again.
           exit
        fi
done

exit
