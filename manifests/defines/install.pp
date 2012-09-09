define rvm::install($user) {

    exec { "rvm_install_${name}_for_${user}" :
        command => "sudo -i -u ${user} bash -l -c 'rvm use ${name} --create --install > /home/${user}/.rvm/${name}_install.log'",
        require => Exec["rvm_setup_${user}"],
        creates => "/home/${user}/.rvm/bin/${name}",
        cwd => "/tmp/"
    }

}