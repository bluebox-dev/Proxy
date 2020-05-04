#!/bin/bash
# Color-txt
Red="\033[1;31m" 
Green="\033[1;32m"
Blue="\033[1;34m"
Nocolor="\033[0m"

read -p "IP-Proxy:" ipa
read -p "Port-Proxy:" pot
read -p "Do you want to have as a username/password proxy ? [Y/n] " varinstall
if [ "$varinstall" = "y" ]
then
    read -p 'Username:' user
    read -p 'Password:' psswd
    read -p "Do you want to username/password correct ? [Y/n] " correct
    if [ "$correct" = "y" ]
    then
        echo "${Green}ProxySet:${Nocolor} "$user:$psswd"&"$ipa:$pot
        echo "Waitting ..."   
    else
        echo  "${Red}Exit Program ,Try agin..${Nocolor}" 
        exit 0    
    fi
else
    user=""
    echo "${Green}ProxySet:${Nocolor} "$ipa:$pot
    echo "Waitting ..."
fi

# Basic Proxy 
echo  "Set ${Blue}Proxy Basic${Nocolor} ALL OS"
read -p 'Do you want to continue? [Y/n] ' varinstall
if [ "$varinstall" = "y" ] ; then
    if [ ! -z  $user ] ; then
cat <<EOF > /etc/profile.d/http-proxy.sh
export http_proxy=http://$user:$psswd@$ipa:$pot/
export https_proxy=http://$user:$psswd@$ipa:$pot/
EOF
source /etc/profile.d/http-proxy.sh
    else
cat <<EOF > /etc/profile.d/http-proxy.sh
export http_proxy=http://$ipa:$pot/
export https_proxy=http://$ipa:$pot/
EOF
source /etc/profile.d/http-proxy.sh
    fi
fi

# Curl Proxy
echo  "Set ${Blue}Proxy Curl${Nocolor} ALL OS"
read -p 'Do you want to continue? [Y/n] ' varinstall
if [ "$varinstall" = "y" ]; then
    if [ ! -z  $user ] ; then
    cat <<EOF > ~/.curlrc
proxy="$ipa:$pot"
proxy-user="$user:$psswd"
EOF
     else
cat <<EOF > ~/.curlrc
proxy="$ipa:$pot"
EOF
    fi
fi

# Docker Proxy
echo  "Set ${Blue}Proxy Docker${Nocolor} ALL OS"
read -p 'Do you want to continue? [Y/n] ' varinstall
if [ "$varinstall" = "y" ] ; then
    if [ ! -z  $user ] ; then
    mkdir -p /etc/systemd/system/docker.service.d
    cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://$user:$psswd@$ipa:$pot/"
EOF
    cat <<EOF > /etc/systemd/system/docker.service.d/https-proxy.conf
[Service]
Environment="HTTPS_PROXY=http://$user:$psswd@$ipa:$pot/"
EOF
    else
    mkdir -p /etc/systemd/system/docker.service.d
    cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://$ipa:$pot/"
EOF
    cat <<EOF > /etc/systemd/system/docker.service.d/https-proxy.conf
[Service]
Environment="HTTPS_PROXY=http://$ipa:$pot/"
EOF
    fi
fi