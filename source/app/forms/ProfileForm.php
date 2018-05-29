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
class ProfileForm extends Form
{

    public function initialize()
    {
        // username
        $username = new Text('username', array(
            'placeholder' => 'This is your Membership ID',
            'class' => 'form-control'
        ));

        $username->addValidators(array(

            new PresenceOf(array(
                'message' => 'Please enter your name '
            )),
            new AlreadyUserNameUpdate(array(
                'message' => '- This name is already exsisted'
            ))
        ));

        $this->add($username);

        // fullName
        $display_name = new Text('display_name', array(
            'placeholder' => 'Full name',
            'class' => 'form-control'
        ));
       /*$fullName->addValidator(
            new PresenceOf(array(
                'message' => 'Please enter password'
            ))
        );*/
        $this->add($display_name);

        //phone
        $phone = new Text('phone', array(
            'placeholder' => 'Your phone',
            'class' => 'form-control phone',
            'aria-describedby' => 'basic-addon1',
            //'maxlength' => 8
        ));

        $phone->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter your phone'
            ))
        ));

        $this->add($phone);
        //address
        $address = new Text('address', array(
            'placeholder' => 'Your address',
            'class' => 'form-control'
        ));

        $this->add($address);

        //address
        $facebook = new Text('facebook', array(
            'placeholder' => 'facebook',
            'class' => 'form-control'
        ));

        $this->add($facebook);

        $googleplus = new Text('googleplus', array(
            'placeholder' => 'googleplus',
            'class' => 'form-control'
        ));

        $this->add($googleplus);


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

