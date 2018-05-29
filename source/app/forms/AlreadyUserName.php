<?php 
namespace MyApp\Forms;
use Phalcon\Validation\Message;
use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;
use MyApp\Model\Users;
class AlreadyUserName extends Validator implements ValidatorInterface
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
		$user ->username = $value;
		if ($user -> validationUserName() == false) {
			$message = $this->getOption('message');
            if (!$message) {
                $message = 'The user name is already registered';
            }
            $validator->appendMessage(new Message($message, $attribute, 'Already'));
            return false;
		}
        return true;
    }
}