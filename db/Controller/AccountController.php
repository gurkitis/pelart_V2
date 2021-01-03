<?php
namespace Src\Controller;

use Src\TableGateways\AccountGateway;

class AccountController
{
    private $db;
    private $requestMethod;
    private $userId;

    private $accountGateway;

    public function __construct($db, $requestMethod, $userId)
    {
        $this->db = $db;
        $this->requestMethod = $requestMethod;
        $this->userId = $userId;

        $this->accountGateway = new AccountGateway($db);
    }

    public function processRequest()
    {
        switch ($this->requestMethod)
        {
            case 'GET':
                break;
            case 'POST':
                break;
            case 'PUT':
                break;
            case 'DELETE':
                break;
        }
    }
}