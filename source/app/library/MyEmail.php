<?php
namespace MyApp;
use Phalcon\Mvc\User\Component,
	Phalcon\Mvc\View, Phalcon\Config;

require_once __DIR__ . '/../../vendor/autoload.php';
/**
 *
 * Sends e-mails based on pre-defined templates
 */
class MyEmail extends Component
{
	protected $_transport;

	public function getTemplateForgotPassWord($email, $code)
	{
		$view = clone $this->view;
		$view->start();
		//$code = Link::incrementalHash(10);
		//save code
		$view->setVar("linkForgotpass", DOMAIN_NAME. "/forgotpassword/checkchangepassword/?email=". $email ."&code=".md5($email.$code));

		$view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		$view->render('mail', 'forgotpassword');
		$view->finish();
		return $view->getContent();
	}

	public function getTemplateAgentListing($contact, $listingName) {
		$view = clone $this->view;
		$view->start();
		$view->setVar("email", $contact -> email);
		$view->setVar("name", $contact -> name);
		$view->setVar("phone", $contact -> phone);
		$view->setVar("subject", $listingName);
		$view->setVar("message", $contact -> message);
		$view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		$view->render('mail', 'agentListing');
		$view->finish();
		return $view->getContent();
	}

    public function getTemplateRegisterEvent($eventName, $registerEvent){
        $view = clone $this->view;
        $view->start();
        $view->setVar("event_name", $eventName);
        $view->setVar("full_name", $registerEvent -> full_name);
        $view->setVar("email", $registerEvent -> email);
        $view->setVar("phone", $registerEvent -> phone);
        $view->setVar("company", $registerEvent -> company);
        $view->setVar("number_attending", $registerEvent -> number_attending);
        $view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $view->render('mail', 'registerevent');
        $view->finish();
        return $view->getContent();
    }
	/**
	 * Sends e-mails via gmail based on predefined templates
	 *
	 * @param array $to
	 * @param string $subject
	 * @param string $name
	 * @param array $params
	 */
	public function send($to, $name, $subject, $contact, $listingName) {
		$mailer = new \Phalcon\Ext\Mailer\Manager((array)$this->config->mail);

		$message = $mailer->createMessage()
				->to($to, $name)
				->subject($subject)
				->contentType('text/html')
				->content($this -> getTemplateAgentListing($contact, $listingName), 'text/html');
		$message->send();
	}

    public function sendRegisterEvent($subject, $eventName, $registerEvent){
        $mailer = new \Phalcon\Ext\Mailer\Manager((array)$this->config->mail);

        $message = $mailer->createMessage()
                ->to($registerEvent -> email, $registerEvent -> full_name)
                ->subject($subject)
                ->contentType('text/html')
                ->content($this -> getTemplateRegisterEvent($eventName, $registerEvent), 'text/html');
        $message->send();
    }
	public function sendContactPage($to, $name, $subject, $contact) {
		$mailer = new \Phalcon\Ext\Mailer\Manager((array)$this->config->mail);

		$message = $mailer->createMessage()
				->to($to, $name)
				->subject($subject)
				->contentType('text/html')
				->content($this -> getTemplateAgentListing($contact, "Contact"), 'text/html');
		$message->send();
	}


	public function sendForProject($to, $name, $subject, $contact, $projectName) {
		$mailer = new \Phalcon\Ext\Mailer\Manager((array)$this->config->mail);

		$message = $mailer->createMessage()
				->to($to, $name)
				->subject($subject)
				->contentType('text/html')
				->content($this -> getTemplateAgentListing($contact, $projectName), 'text/html');
		$message->send();
	}


	public function sendForgotPassword($to, $subject, $code)
	{

		$mailer = new \Phalcon\Ext\Mailer\Manager((array)$this->config->mail);

		$message = $mailer->createMessage()
				->to($to, 'Member BviClub')
				->subject($subject)
				->contentType('text/html')
				->content($this -> getTemplateForgotPassWord($to, $code), 'text/html');
		$message->send();
	}
}