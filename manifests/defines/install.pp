define rvm::install($ruby = $name, $user) {
exec { "rvm_ruby_install-${ruby}-${user}" : 
    command => "/usr/bin/sudo -i -u ${user} rvm use ${ruby} --install",
    creates => "/home/${user}/.rvm/bin/${ruby}",
}

}