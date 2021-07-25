git_menu() {
    clear
    echo -e "\n${GREEN}## GIT - CHOOSE A OPTION ##${NC}\n"
    echo -e "1) INSTALL"
    echo -e "2) ADD HOOK"
    echo -e "----------"
    echo -e "0) Return\n"
    read option
    case $option in
        1) git_install && waiting_press && git_menu ;;
        2) git_add_hook && waiting_press && git_menu ;;
        0) return ;;
    esac
}

git_install() {
    clear
    echo -e "\\r${GREEN}## GIT INSTALL ##${NC}"
    apt install -y git
}

git_add_hook() {
    clear
    echo -e "\\r${GREEN}## GIT ADD A NEW HOOK ##${NC}"
    echo -n "SET A PATH OF FILES (/var/www/...): "; read pathfiles
    echo -n "SET A PATH OF REPOS (../repos/ -> files*.git): "; read reposdir
    echo -n "SET A NAME OF REPO (myfile.git): "; read reponame
    current_path=$(pwd)
    mkdir $reposdir
    cd $reposdir
    mkdir $reponame
    cd $reponame
    git init --bare
    cp $current_path/git/post-receive ./hooks/
    sed -i "s/##PATHFILES##/${pathfiles//\//\\/}/g" ./hooks/post-receive
    exit 0
}
