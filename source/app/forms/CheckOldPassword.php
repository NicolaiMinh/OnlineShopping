<?php 
namespace MyApp\Forms;
use Phalcon\Validation\Message;
use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;
use MyApp\Model\Users;
class CheckOldPassword extends Validator implements ValidatorInterface
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
		$ssUser = $_SESSION['auth-identity'];
		if ($user -> checkOldpassword($ssUser['id'], $value) == false) {
			$message = $this->getOption('message');
            if (!$message) {
                $message = 'The email is already registered';
            }
            $validator->appendMessage(new Message($message, $attribute, 'OldPassword'));
            return false;
		}
        return true;
    }
}