define rvm::gemset($gemset = $name, $ruby, $user) {

    exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" :
        command => "/bin/bash -c '${src_dir}/rvm-installer --version ${version}' > /home/${user}/.rvm_install.log 2>&1",
        require => Exec["rvm_download"],
        creates => "/home/${user}/.rvm",
        provider => "shell",
        user => $user,
        cwd => "/tmp/"
    }

exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" :
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/bin/rvm_gemset_install ${ruby} ${gemset}",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
    require => [File["rvm_ruby_gemset_wrapper-${user}"], Exec["rvm_ruby_install-${ruby}-${user}"]]
}

}