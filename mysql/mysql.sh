mysql_menu() {
    clear
    echo -e "\n${GREEN}## MYSQL - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) INSTALL"
    echo -e "2) ADD DATABASE"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) mysql_install && waiting_press && mysql_password &&  waiting_press && mysql_menu;;
        2) mysql_create_db && waiting_press && mysql_menu ;;
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

mysql_create_db(){
    clear
    echo -e "\n${GREEN}## CREATE A NEW DATABASE ##${NC}\n"
    echo -n "DATABASE NAME: "; read database;
    echo -n "DATABASE USER: "; read user;
    echo -n "DATABASE PASSWORD: "; stty -echo; read pass; stty echo; echo
    echo -n "ROOT PASSWORD: "; stty -echo; read rootpass; stty echo; echo
    echo "CREATE DATABASE $database" | mysql -uroot -p$rootpass
    echo "CREATE USER '$user'@'localhost' IDENTIFIED BY '$pass';" | mysql -uroot -p$rootpass
    echo "GRANT ALL PRIVILEGES ON $database.* to '$user'@'localhost';" | mysql -uroot -p$rootpass
    echo "FLUSH PRIVILEGES;" | mysql -uroot -p$rootpass
}