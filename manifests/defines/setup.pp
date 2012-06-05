define rvm::setup(
    $user = $name,
    $version = '1.14.1',
) {

exec { rvm_download :
    command =>"/usr/bin/sudo -i -u ${user} curl -L get.rvm.io | bash -s ${version}",
    unless => "grep ${version} /home/${user}/.rvm/VERSION"
}


}