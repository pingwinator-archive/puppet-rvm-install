define rvm::gemset($gemset = $name, $ruby, $user) {
exec { rvm_gemset_create : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/bin/rvm-shell gemset create ${gemset}",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
}

}