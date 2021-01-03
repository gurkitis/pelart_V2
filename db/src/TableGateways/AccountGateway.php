<?php
namespace Src\TableGateways;

class AccountGateway
{
    private $db = null;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function findAll()
    {
        $statement = "SELECT * FROM Accounts;";
        try
        {
            $statement = $this->db->query($statement);
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        }
        catch (\PDOException $e)
        {
            exit($e->getMessage());
        }
    }

    public function find($id)
    {
        $statement = "SELECT * FROM Accounts WHERE ID = ?";
        try
        {
            $statement = $this->db->prepare($statement);
            $statement->execute(array((int) $id));
            $result = $statement->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
        }
        catch (\PDOException $e)
        {
            exit($e->getMessage());
        }
    }

    public function insert(Array $input)
    {
        $statement = "
                INSERT INTO Accounts (E_mail, Name, Surname, Password, Role_id, CREATED_AT)
                VALUES (:E_mail, :Name, :Surname, :Password, :Role_id, NOW());";
        try
        {
            $statement = $this->db->prepare($statement);
            $statement->execute(array(
                'E_mail' => $input['E_mail'],
                'Name' => $input['Name'],
                'Surname' => $input['Surname'],
                'Role_id' => $input['Role_id']
            ));
            return $statement->rowCount();
        }
        catch (\PDOException $e)
        {
            exit($e->getMessage());
        }
    }

    public function update($id, Array $input)
    {
        $statement = "
                UPDATE Accounts
                SET
                    E_mail = :E_mail,
                    Name = :Name,
                    Surname = :Surname,
                    Password = :Password,
                    Role_id = :Role_id,
                    UPDATED_AT = NOW()
                WHERE ID = :ID;";
        try
        {
            $statement = $this->db->prepare($statement);
            $statement->execute(array(
                'ID' => (int) $id,
                'E_mail' => $input['E_mail'],
                'Name' => $input['Name'],
                'Surname' => $input['Surname'],
                'Password' => $input['Password'],
                'Role_id' => (int) $input['Role_id']
            ));
            return $statement->rowCount();
        }
        catch (\PDOException $e)
        {
            exit($e->getMessage());
        }
    }

    public function delete($id)
    {
        $statement = "DELETE FORM Accounts WHERE ID = ?";
        try
        {
            $statement = $this->db->prepare($statement);
            $statement->execute(array((int) $id));
            return $statement->rowCount();
        }
        catch (\PDOException $e)
        {
            exit($e->getMessage());
        }
    }
}