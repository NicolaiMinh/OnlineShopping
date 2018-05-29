<?php
namespace MyApp\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\Identical;

class ChangePasswordForm extends Form
{

    public function initialize()
    {
    	 // old Password
        $old_password = new Password('old_password', array(
            'placeholder' => 'your old password',
			'class' => 'form-control'
        ));
		$old_password->addValidators(array(
            new PresenceOf(array(
                'message' => 'Old Password is required'
            )),
			new CheckOldPassword(array(
				'message' => 'Old Password doesn\'t match'
			))
        ));
		
		$this->add($old_password);
		
        // Password
        $password = new Password('password', array(
            'placeholder' => 'your password',
			'class' => 'form-control'
        ));

        $password->addValidators(array(
            new PresenceOf(array(
                'message' => 'Password is required'
            )),
            new StringLength(array(
                'min' => 6,
                'messageMinimum' => 'Password is too short. Minimum 6 characters'
            )),
            new Confirmation(array(
                'message' => 'Password doesn\'t match confirmation',
                'with' => 'confirmPassword'
            ))
        ));

        $this->add($password);

        // Confirm Password
        $confirmPassword = new Password('confirmPassword', array(
            'placeholder' => 'confirm password',
			'class' => 'form-control'
        ));

        $confirmPassword->addValidators(array(
            new PresenceOf(array(
                'message' => 'The confirmation password is required'
            ))
        ));

        $this->add($confirmPassword);
		
		$csrf = new Hidden('csrf');

        $csrf->addValidator(new Identical(array(
            'value' => $this->security->getSessionToken(),
            'message' => 'Please try again'
        )));

        $csrf->clear();

        $this->add($csrf);
    }
}
