<?php

// Include the composer autoloader

require_once __DIR__ . '/../../vendor/autoload.php';

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;


return getApiContext();

// SDK Configuration
function getApiContext() {


    // Define the location of the sdk_config.ini file
    if (!defined("PP_CONFIG_PATH")) {
        define("PP_CONFIG_PATH", dirname(__DIR__));
    }

	$apiContext = new ApiContext(new OAuthTokenCredential(
		//live
		'Aft5HuNvcjjE1ABZTf00lPI0v3_4amGnihiwHTCeS-PbhblzC7sOquBpevgm1QgDWMjPVipzMCa0JaTf',
		'EA0BVfLdhyk1Rz9J6yinEvZ4s4pU5W-SoquCNf5z7aVwcd9pcq5niHp8FzZFG9q1lAqD3DNInysygPUY'
		//sanbox
		/*'ASmyapkWgZGlEai7I70scgM11pD0aUolkRVn5CYtoXPZ9SuhCJj0gF_n-_HXGkgbdAWUVpyNA-dh0uMV',
        'EOOemcWARLe7QxSMs5D-I-2GcrC-F_dbAJQU9hiR_1GC0G4qyEsXd7-3dneBU4TDLD5YvJgVafSOzL4q'*/
	));
	
	//
	/*
	 *'ASmyapkWgZGlEai7I70scgM11pD0aUolkRVn5CYtoXPZ9SuhCJj0gF_n-_HXGkgbdAWUVpyNA-dh0uMV',
        'EOOemcWARLe7QxSMs5D-I-2GcrC-F_dbAJQU9hiR_1GC0G4qyEsXd7-3dneBU4TDLD5YvJgVafSOzL4q'
	 * 
	 */	
	// Alternatively pass in the configuration via a hashmap.
	// The hashmap can contain any key that is allowed in
	// sdk_config.ini	
	
	$apiContext->setConfig(array(
		'http.ConnectionTimeOut' => 30,
		'http.Retry' => 1,
		'mode' => 'live',
		'log.LogEnabled' => true,
		'log.FileName' => '../PayPal.log',
		'log.LogLevel' => 'INFO'		
	));
	
	return $apiContext;
}
