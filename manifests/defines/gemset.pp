define rvm::gemset($gemset = $name, $ruby, $user) {

exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/rvm_ruby_gemset_wrapper ${ruby} ${gemset}",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
    require => File["rvm_ruby_gemset_wrapper-${user}"]
}

}