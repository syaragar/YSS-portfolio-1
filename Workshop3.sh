#!/bin/bash
proxyport=" "
proxyaddress=" "
echo "Detecting network location"

IP_ADDRESS=$(ifconfig | awk '/inet addr/{print substr($2,6)}' | head -1)
if [[ "$IP_ADDRESS" == "10.0."* ]]
then
echo "You are on an ECU Network"
read -p "Please enter your ECU username: " username
read -p "Please enter your ECU password: " password
echo "Acquire::http::Proxy \"http://$username:$password@$proxyaddress:$proxyport\"" > /etc/apt/apt.conf
echo "Your proxy has been set"
echo "You are \"Online\""
else
echo "You are off campus"
echo "" > /etc/apt/apt.conf
echo "Your proxy settings have been cleared"
echo "You are \"Online\""
fi
