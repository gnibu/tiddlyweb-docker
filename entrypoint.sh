#!/bin/bash

if [ "m$INSTANCE" == "m" ]; then
   echo Please set the environement variable INSTANCE to the name of the instance you want to run 
   exit 1
fi
   
if [ ! -d $INSTANCE ]; then
    echo "Instance $INSTANCE not found, create it"
    twinstance $INSTANCE
fi

cd $INSTANCE
echo Exucute instance named $INSTANCE
twanager server $SERVER_NAME $SERVER_PORT

