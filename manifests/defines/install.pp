define rvm::install($ruby = $name, $user) {

file { "rvm_ruby_install_wrapper-${user}" :
    path => "/home/${user}/.rvm/rvm_ruby_install_wrapper",
    mode => 500,
    replace => true,
    content => "#!/usr/bin/env bash
source /home/${user}/.rvm/bin/rvm
rvm install $1"
}

exec { "rvm_ruby_install-${ruby}-${user}" : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/rvm_ruby_install_wrapper ${ruby}",
    creates => "/home/${user}/.rvm/bin/${ruby}",
    require => File["rvm_ruby_install_wrapper-${user}"]
}

}