define rvm::setup(
    $user = $name,
    $version = '1.14.1'
    $src_dir = "/usr/local/src"
) {

exec { rvm_download :
    command =>"curl -L get.rvm.io | bash -s #{version}",
    user => $user,
    creates => "${src_dir}/rvm-installer",
    notify => File["rvm-installer"]
}

file { 'rvm-installer' : 
    path => "${src_dir}/rvm-installer",
    mode => 755,
}


}