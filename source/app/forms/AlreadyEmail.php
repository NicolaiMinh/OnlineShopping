<?php 
namespace MyApp\Forms;
use Phalcon\Validation\Message;
use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;
use MyApp\Model\Users;
class AlreadyEmail extends Validator implements ValidatorInterface
{
    /**
     * Executes the validation
     *
     * @param Phalcon\Validation $validator
     * @param string $attribute
     * @return boolean
     */
	public function validate(\Phalcon\Validation $validator, $attribute)
    {
        $value = $validator->getValue($attribute);
		$user = new Users();
		$user ->email = $value;
		if ($user -> validationEmail() == false) {
			$message = $this->getOption('message');
            if (!$message) {
                $message = 'The email is already registered';
            }
            $validator->appendMessage(new Message($message, $attribute, 'Already'));
            return false;
		}
        return true;
    }
}