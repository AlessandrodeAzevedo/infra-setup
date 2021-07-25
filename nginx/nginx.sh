nginx_menu() {
    clear
    echo -e "\\r${GREEN}## NGINX - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) INSTALL"
    echo -e "2) CREATE A NEW ENTRY"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) nginx_install && waiting_press && nginx_menu ;;
        2) nginx_new_entry && waiting_press && nginx_menu ;;
        0) return ;;
        *) nginx_menu ;;
    esac
}

nginx_install() {
    clear
    echo -e "\\r${GREEN}## NGINX INSTALL ##${NC}"
    apt -y install nginx
    chown -R www-data.www-data /var/www
    chmod -R 775 /var/www
}

nginx_new_entry() {
    clear
    echo -e "\\r${GREEN}## NGINX - CREATE A NEW ENTRY ##${NC}"
    echo -e "\nEnter a port"
    read port
    echo -e "\nEnter a domain"
    read domain
    echo -e "\nEnter a root"
    read root
    rm /etc/nginx/sites-available/$domain
    cp ./nginx/default.conf /etc/nginx/sites-available/$domain
    sed -i "s/##domain##/${domain//\//\\/}/g" /etc/nginx/sites-available/$domain
    sed -i "s/##port##/$port/g" /etc/nginx/sites-available/$domain
    sed -i "s/##root##/${root//\//\\/}/g" /etc/nginx/sites-available/$domain
    ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/$domain
    service nginx reload
}
