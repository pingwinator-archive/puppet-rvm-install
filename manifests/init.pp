import "defines/*.pp"

class rvm {
	
	file { rvm_ruby_install_wrapper:
	    path => "/root/.kerlrc",
	    replace => true,
	    content => "KERL_DOWNLOAD_DIR=${srcpath}/source
	KERL_BUILD_DIR=${srcpath}/builds
	KERL_DEFAULT_INSTALL_DIR=${binpath}"
	}
    
}