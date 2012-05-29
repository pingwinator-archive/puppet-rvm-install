define rvm::install($ruby = $name, $user) {
exec { rvm_ruby_install : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/bin/rvm-shell install ${ruby}",
    creates => "/home/${user}/.rvm/bin/${ruby}",
}

}