define rvm::install($user) {

    require rvm
    require Rvm:Setup[$user]

    exec { "rvm_install_${name}_for_${user}" :
        command => "sudo -i -u ${user} bash -l -c 'rvm use ${name} --create --install > /home/${user}/.rvm/${name}_install.log'",
        creates => "/home/${user}/.rvm/bin/${name}",
        cwd => "/tmp/",
        require => Rvm::Setup[$user],
    }

}
