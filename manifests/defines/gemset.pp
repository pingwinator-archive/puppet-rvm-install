define rvm::gemset($gemset = $name, $ruby, $user) {

file { "rvm_ruby_gemset_wrapper-${user}" :
    path => "/home/${user}/.rvm/rvm_ruby_gemset_wrapper",
    mode => 500,
    replace => true,
    content => "#!/usr/bin/env bash
source /home/${user}/.rvm/bin/rvm
rvm use $1@$2 --create"
}

exec { "rvm_gemset_create-${ruby}-${user}-${gemset}" : 
    command => "/usr/bin/sudo -i -u ${user} /home/${user}/.rvm/rvm_ruby_gemset_wrapper ${ruby} ${gemset}",
    creates => "/home/${user}/.rvm/bin/${ruby}@${gemset}",
}

}