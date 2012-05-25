define rvm::install($ruby = $name, $user) {
exec { rvm_ruby_install : 
    command => "/bin/bash -l -c /home/${user}/.rvm/bin/rvm install ${ruby}",
    user => $user,
    creates => "/home/${user}/.rvm/bin/${ruby}",
}

}