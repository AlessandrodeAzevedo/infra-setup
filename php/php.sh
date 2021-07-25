php_menu() {
    clear
    echo -e "\\r${GREEN}## PHP - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) INSTALL"
    echo -e "2) LIBRARIES"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) php_install && waiting_press && php_menu ;;
        2) php_lib && waiting_press && php_menu ;;
        0) return ;;
        *) php_menu ;;
    esac
}

php_install() {
    clear
    echo -e "\\r${GREEN}## PHP INSTALL ##${NC}"
    apt -y install php-fpm
}

php_lib(){
    clear
    echo -e "\\r${GREEN}## PHP - INSTALL LIBRARIES ##${NC}\n"
    echo -e "Write which libraries you want to install (use space to separate)"
    echo -e "----------\n"
    read -ra libs
    for lib in "${libs[@]}"; 
    do 
        echo -e "=========="
        echo -e "\\r${YELLOW}Installing $lib ${NC}"
        echo -e "==========\n"
        apt install -y "php-$lib";
    done
}
