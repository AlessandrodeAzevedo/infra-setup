mysql_menu() {
    clear
    echo -e "\n${GREEN}## MYSQL - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) INSTALL"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) mysql_install && waiting_press && mysql_password &&  waiting_press && mysql_menu;;
        2) mysql_password && waiting_press && mysql_menu ;;
        0) return ;;
    esac
}

mysql_install(){
    clear
    echo -e "\\r${GREEN}## MYSQL INSTALL ##${NC}"
    apt install -y mariadb-server mariadb-client
    service mysql restart
}

mysql_password(){
    clear
    echo -e "\n${GREEN}## ENTER A ROOT PASSWORD ##${NC}\n"
    echo -n "PASSWORD: "; stty -echo; read pass; stty echo; echo
    mysqladmin -u root password $pass
    sudo service mysql restart
}