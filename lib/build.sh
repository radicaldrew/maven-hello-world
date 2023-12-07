#!/bin/bash
DIR="/target/myapp"
if [ -d "$DIR" ]
then
	if [ "$(ls -A $DIR)" ]; then
      cp -R  /target/myapp /usr/src/
      mvn -f /usr/src/myapp/pom.xml clean package
      JAR_FILE=/usr/src/myapp/target/*.jar
      echo $JAR_FILE
      mkdir /target/myapp/target
      cp $JAR_FILE /target/myapp/target/
	else
     echo "target volume empty"
	fi
else
	echo "volume not added"
fi