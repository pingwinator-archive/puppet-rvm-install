define rvm::gemset($gemset = $name, $ruby, $user) {

exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/bin/rvm_gemset_install ${ruby} ${gemset}",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
    require => [File["rvm_ruby_gemset_wrapper-${user}"], Exec["rvm_ruby_install-${ruby}-${user}"]]
}

}