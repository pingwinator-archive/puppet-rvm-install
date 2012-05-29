define rvm::gemset($gemset = $name, $ruby, $user) {
exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" : 
    command => "/usr/bin/sudo -i -u ${user} rvm use ${ruby}@${gemset} --create",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
}

}