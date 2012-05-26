define rvm::gemset($gemset = $name, $ruby, $user) {
exec { rvm_gemset_create : 
    command => "/home/${user}/.rvm/bin/rvm-shell gemset create ${gemset}",
    user => $user,
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
}

}