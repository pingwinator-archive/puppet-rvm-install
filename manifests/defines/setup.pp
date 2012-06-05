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
    
    
    file { "rvm_run_wrapper-${user}" :
        path => "/home/${user}/.rvm/rvm_run",
        mode => 500,
        owner => $user,
        replace => true,
        content => "#!/usr/bin/env bash
            [[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"
            exec \"$@\""
    }
    
    
    
    

}