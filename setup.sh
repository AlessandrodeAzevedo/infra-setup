#!/bin/bash

. ./utils/color.sh
. ./utils/utils.sh
. ./nginx/nginx.sh
. ./mysql/mysql.sh
. ./linux/linux.sh
. ./php/php.sh
. ./git/git.sh

main() {
    user=`whoami`
    if [ $user != "root" ]
    then
        echo -e "\\r${RED}## IS NEEDED RUN THIS SCRIPT WITH ROOT USER ##${NC}\n"
        exit 0
    fi
    while [  true ]; do
        menu
    done
}

menu(){
    clear
    echo -e "\\r${GREEN}## CHOOSE A OPTION ##${NC}\n"
    echo -e "1) LINUX"
    echo -e "2) NGINX"
    echo -e "3) MYSQL"
    echo -e "4) PHP"
    echo -e "5) GIT"
    echo -e "----------"
    echo -e "0) Exit\n"
    read option
    case $option in
        1) linux_menu ;;
        2) nginx_menu ;;
        3) mysql_menu ;;
        4) php_menu ;;
        5) git_menu ;;
        0) clear && exit 0 ;;
        *) echo -e "Invalid!";;
    esac
}

main
exit 0