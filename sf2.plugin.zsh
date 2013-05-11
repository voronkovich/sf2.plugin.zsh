sfcp() {
    if [[ -z $1 ]]; then
        project=.
    else
        project=$1
    fi

    composer create-project symfony/framework-standard-edition $project

    cd $project

    sudo setfacl -R -m u:www-data:rwX -m u:`whoami`:rwX app/cache app/logs
    sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
}
