define rvm::setup(
    $user = $name,
    $version = '1.14.1',
    $src_dir = "/usr/local/src"
) {

    exec { rvm_download :
        command =>"wget get.rvm.io -O ${src_dir}/rvm-installer",
        creates => "${src_dir}/rvm-installer",
        notify => File["rvm-installer"]
    }

    file { 'rvm-installer' : 
        path => "${src_dir}/rvm-installer",
        mode => 755,
    }

    exec { rvm_install:
        command => "/usr/bin/sudo -i -u ${user} ${src_dir}/rvm-installer --version ${version} > /home/${user}/.rvm_install.log 2>&1",
        require => Exec["rvm_download"],
        creates => "/home/${user}/.rvm",
        provider => "shell",
        cwd => "/tmp/"
    }
    
    file { "rvm_ruby_install_wrapper-${user}" :
        path => "/home/${user}/.rvm/bin/rvm_ruby_install",
        mode => 500,
        owner => $user,
        replace => true,
        content => "#!/usr/bin/env bash
            source /home/${user}/.rvm/bin/rvm
            rvm install \$1"
    }
    
    file { "rvm_ruby_gemset_wrapper-${user}" :
        path => "/home/${user}/.rvm/bin/rvm_gemset_install",
        mode => 500,
        owner => $user,
        replace => true,
        content => "#!/usr/bin/env bash
    source /home/${user}/.rvm/bin/rvm
    rvm use \$1@\$2 --create --install"
    }
    
    
    

}