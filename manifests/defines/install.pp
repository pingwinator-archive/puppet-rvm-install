define rvm::install($user) {

exec { "install-${name}-${user}" :
        command => "/bin/bash -l -c 'rvm use ${name} --create --install' > /home/${user}/.rvm/${name}_install.log 2>&1",
        require => Exec["rvm_install_${user}"],
        #creates => "/home/${user}/.rvm",
        provider => "shell",
        user => $user,
        cwd => "/tmp/"
    }

}