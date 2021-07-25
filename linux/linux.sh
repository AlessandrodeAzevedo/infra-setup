linux_menu() {
    clear
    echo -e "\\r${GREEN}## LINUX - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) UPDATE"
    echo -e "2) INSTALL ESSENTIALS TOOLS"
    echo -e "3) ADD A NEW USER"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) linux_update && waiting_press && linux_menu ;;
        2) linux_tools && waiting_press && linux_menu ;;
        3) linux_new_user && waiting_press && linux_menu ;;
        0) return ;;
        *) linux_menu ;;
    esac
}

linux_update() {
    clear
    echo -e "\\r${GREEN}## UPDATE LINUX ##${NC}"
    apt update -y
}

linux_tools() {
    clear
    echo -e "\\r${GREEN}## INSTALL ESSENCIAL TOOLS ##${NC}"
    apt -y install build-essential binutils-doc git unzip
}

linux_new_user() {
    clear
    echo -e "\\r${GREEN}## CREATE A NEW USER ##${NC}"
    echo -n "SET USERNAME: "; read user
    echo -n "SET PASSWORD: "; stty -echo; read pass; stty echo; echo
    adduser --disabled-password --gecos "" "$user"
    passwd ${user} << EOD
${pass}
${pass}
EOD
}