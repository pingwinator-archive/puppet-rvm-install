define rvm::install($ruby = $name, $user) {

exec { "rvm_ruby_install-${ruby}-${user}" : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/bin/rvm_ruby_install ${ruby}",
    creates => "/home/${user}/.rvm/bin/${ruby}",
    require => File["rvm_ruby_install_wrapper-${user}"]
}

}