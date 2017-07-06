#!/bin/sh
sudo echo *.* @10.100.193.10:514;RSYSLOG_SyslogProtocol23Format >> /etc/rsyslog.conf
sudo service rsyslog restart
