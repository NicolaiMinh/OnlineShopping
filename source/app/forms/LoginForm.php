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

class LoginForm extends Form
{

    public function initialize()
    {
        // Email
        $email = new Text('email', array(
            'placeholder' => 'Email',
            'class' => 'input-full main-input form-control'
        ));

        $email->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter your E-mail. '
            )),
            new Email(array(
                'message' => 'E-mail invalid.'
            ))
        ));

        $this->add($email);

        // Password
        $password = new Password('password', array(
            'placeholder' => 'Your password',
            'class' => 'input-full main-input form-control'
        ));

        $password->addValidator(new PresenceOf(array(
            'message' => 'Please enter your password'
        )));

        $password->clear();

        $this->add($password);

  /*      // Remember
        $remember = new Check('remember', array(
            'value' => 'yes'
        ));

        $remember->setLabel('Remember me');

        $this->add($remember);
*/
        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(new Identical(array(
            'value' => $this->security->getSessionToken(),
            'message' => 'Please try again'
        )));

        $csrf->clear();

        $this->add($csrf);

        /*$this->add(new Submit('go', array(
            'class' => 'btn btn-success'
        )));*/
    }
}
