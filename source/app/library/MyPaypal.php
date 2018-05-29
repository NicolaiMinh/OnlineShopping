<?php
namespace MyApp;

require_once __DIR__ . '/bootstrap.php';
use Phalcon\Mvc\User\Component;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Amount;
use PayPal\Api\CreditCard;
use PayPal\Api\CreditCardToken;
use PayPal\Api\FundingInstrument;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\Transaction;
use PayPal\Api\RedirectUrls;

use MyApp\Model\Payments;
/**
 *
 * Sends e-mails based on pre-defined templates
 */
class MyPaypal extends Component
{
	public function pay($userId, $amount, $description) {
		$payments = new Payments();
		$id = $payments -> addPayment($userId, "", "", $amount, $description);
		$baseUrl = "http://".DOMAIN_NAME."/payment/result?orderId=".$id;
		$payment = $this -> makePaymentUsingPayPal($amount, 'USD', $description, "$baseUrl&success=true", "$baseUrl&success=false");
		//echo $payment->getId().'<br>'.$payment->getState()."<br>";
		//print_r($payment->getLinks());exit;
		$payments -> updatePayment($id, $payment->getState(), $payment->getId());			
		header("Location: " . $this-> getLink($payment->getLinks(), "approval_url") );
			exit;	
	}
	
	public function makePaymentUsingPayPal($total, $currency, $paymentDesc, $returnUrl, $cancelUrl) {
	
		$payer = new Payer();
		$payer->setPaymentMethod("paypal");
		
		// Specify the payment amount.
		$amount = new Amount();
		$amount->setCurrency($currency);
		$amount->setTotal($total);
		
		// ###Transaction
		// A transaction defines the contract of a
		// payment - what is the payment for and who
		// is fulfilling it. Transaction is created with
		// a `Payee` and `Amount` types
		$transaction = new Transaction();
		$transaction->setAmount($amount);
		$transaction->setDescription($paymentDesc);
		
		$redirectUrls = new RedirectUrls();
		$redirectUrls->setReturnUrl($returnUrl);
		$redirectUrls->setCancelUrl($cancelUrl);
		
		$payment = new Payment();
		$payment->setRedirectUrls($redirectUrls);
		$payment->setIntent("sale");
		$payment->setPayer($payer);
		$payment->setTransactions(array($transaction));
		
		$payment->create(getApiContext());
	  return $payment;
	}
		/*
	 * Set of common utility functions
	*/
	
	/**
	 * Returns whether the user signed in
	 * @return boolean
	 */
	public function isSignedIn() {
		return (isset($_SESSION) && isset($_SESSION['userid']));
	}
	
	/**
	 * Updates the user's sign in status
	 * @param string $userId
	 */
	public function signIn($userId) {
		$_SESSION['userid'] = $userId;
	}
	
	/**
	 * Sign out the user and clean up session
	 */
	public function signOut() {
		session_destroy();
	}
	
	/**
	 * Returns the currently signed in user's userId
	 * @return string
	 */
	public function getSignedInUser() {
		return $_SESSION['userid'];
	}
	
	
	/**
	 * Determine the baseurl of the current script.
	 * Used for determining the absolute url of return and
	 * cancel urls.
	 * @return string
	 */
	public function getBaseUrl() {
	
		$protocol = 'http';
		if ($_SERVER['SERVER_PORT'] == 443 || (!empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) == 'on')) {
			$protocol .= 's';
		}
	
		$host = $_SERVER['HTTP_HOST'];
		$request = $_SERVER['PHP_SELF'];
		return dirname($protocol . '://' . $host . $request);
	}
	
	
	/**
	 * Utility method that returns the first url of a certain
	 * type. Returns empty string if no match is found
	 * 
	 * @param array $links
	 * @param string $type 
	 * @return string
	 */
	public function getLink(array $links, $type) {
		foreach($links as $link) {
			if($link->getRel() == $type) {
				return $link->getHref();
			}
		}
		return "";
	}
	
	/**
	 * Utility public function to pretty print API error data
	 * @param string $errorJson
	 * @return string
	 */
	public function parseApiError($errorJson) {
		$msg = '';
		
		$data = json_decode($errorJson, true);
		if(isset($data['name']) && isset($data['message'])) {
			$msg .= $data['name'] . " : " .  $data['message'] . "<br/>";
		}
		if(isset($data['details'])) {
			$msg .= "<ul>";
			foreach($data['details'] as $detail) {
				$msg .= "<li>" . $detail['field'] . " : " . $detail['issue'] . "</li>";	
			}
			$msg .= "</ul>";
		}
		if($msg == '') {
			$msg = $errorJson;
		}	
		return $msg;
	}
	
	/**
	 * Completes the payment once buyer approval has been
	 * obtained. Used only when the payment method is 'paypal'
	 * 
	 * @param string $paymentId id of a previously created
	 * 		payment that has its payment method set to 'paypal'
	 * 		and has been approved by the buyer.
	 * 
	 * @param string $payerId PayerId as returned by PayPal post
	 * 		buyer approval.
	 */
	public function executePayment($paymentId, $payerId) {
	
		$payment = $this -> getPaymentDetails($paymentId);
		$paymentExecution = new PaymentExecution();
		$paymentExecution->setPayerId($payerId);	
		$payment = $payment->execute($paymentExecution, getApiContext());	
	
		return $payment;
	}
	
	/**
	 * Retrieves the payment information based on PaymentID from Paypal APIs
	 *
	 * @param $paymentId
	 *
	 * @return Payment
	 */
	public function getPaymentDetails($paymentId) {
	    $payment = Payment::get($paymentId, getApiContext());
	    return $payment;
	}
}