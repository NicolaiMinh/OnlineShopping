<?php
namespace MyApp\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Identical;
class RegisterForm extends Form
{

    public function initialize()
    {
        // Email
        $email = new Text('email', array(
            'placeholder' => 'your email address',
			'class' => 'input-full main-input'
        ));

        $email->addValidators(array(

            new PresenceOf(array(
                'message' => 'Please enter your E-mail. '
            )),
            new AlreadyEmail(array(
                'message' => '-The email is already registered'
            )),
            new Email(array(
                'message' => '- The e-mail is not valid.'
            ))
        ));

        $this->add($email);

        // Password
        $password = new Password('password', array(
            'placeholder' => 'Password',
			'class' => 'input-full main-input'
        ));

        $password->addValidator(
        	new PresenceOf(array(
            	'message' => 'Please enter password'
        	))
		);

        $this->add($password);

		// $email_reference = new Text('email_reference', array(
            // 'placeholder' => 'referrer email address',
			// 'class' => 'form-control'
        // ));
//
		// $this->add($email_reference);

        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(new Identical(array(
            'value' => $this->security->getSessionToken(),
            'message' => 'Please try again'
        )));

        $csrf->clear();

        $this->add($csrf);
    }
}

