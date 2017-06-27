#!/bin/sh
docker run -t -p 9000:9000 -d -p 12201:12201 -p 12201:12201/udp -p 514:514/udp -p 514:514 graylog2/allinone