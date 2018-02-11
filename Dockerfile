FROM airdock/oracle-jdk:1.8

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git 

RUN git clone -b develop https://github.com/kairosdb/kairosdb.git && \
    cd kairosdb  && \
    export CLASSPATH=tools/tablesaw-1.2.6.jar && \
    java make package 

