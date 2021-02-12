<?php
require 'flight/Flight.php';

Flight::register('db', 'PDO', array('mysql:host=localhost;dbname=restaurant', 'root', ''), function ($db) {
    //$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
});

Flight::route('/', function(){
    echo 'hello world!';
});

Flight::route('/contactInfo', function () {
	$conn = Flight::db();
	$data = $conn->query("SELECT * FROM contact");
	$count = $data->rowCount();

	echo ("data: [");
	$i = 0;
	foreach ($data as $row) {
		$object = json_encode($row);
		print_r($object);
		if ($i < $count - 1) {
			echo (",");
		}
		$i++;
	}

	echo ("]");
});
Flight::route('GET|POST /register', function () {
    $conn = Flight::db();

    $firstName = Flight::request()->query->firstName;
    $lastName = Flight::request()->query->lastName;
    $email = Flight::request()->query->emailReg;
    $password = Flight::request()->query->passReg;


    $hashedPass = password_hash($password, PASSWORD_DEFAULT);

    $query = "Select email from register where email = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$email]);

    $results = $stmt->rowCount();

    if ($results > 0) {
        echo 'email';
    }else{
        $sql = "INSERT INTO `register` (`firstName`,`lastName`, `email`, `password`, `type` ) values (?, ?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$firstName, $lastName, $email, $hashedPass, 0]);
        if ($stmt) {
            echo ('registered');
        } else {
            echo ('failed');
        }
    }
    
});

Flight::route('/login', function () {
    $conn = Flight::db();

    $logEmail = Flight::request()->query->emailLog;
    $passLog = Flight::request()->query->passLog;



    $sql = "SELECT `email`, `password` FROM `register` WHERE `email` = ?";

    $stmt = $conn->prepare($sql);
    $stmt->execute([$logEmail]);

    $results = $stmt->rowCount();

    if ($results > 0) {
        while ($row = $stmt->fetchAll(PDO::FETCH_ASSOC)) {
            if ($row[0]['email'] == $logEmail) {
                if (password_verify($passLog, $row[0]['password'])) {
                    $query = "INSERT INTO `login` (`email`,`password`) VALUES (?, ?)";
                    $stmt = $conn->prepare($query);
                    $stmt->execute([$logEmail, $passLog]);
                    if($stmt){
                        session_start();
                        $_SESSION["email"] = $row[0]['email'];
                        echo ('logged');
                    }else{
                        echo ('error');
                    }
                   
                } else {
                    echo ('password');
                }
            } else {
                echo ('email');
            }
        }
    } else {
        echo ('mail');
    }
});


Flight::route('GET|POST /feedbackSend', function () {
    $conn = Flight::db();

    $feedback = Flight::request()->query->feedback;
    $email = "nedzad.grbo@gmail.com";
    $sql = "INSERT INTO `feedback` (`user`, `opinion`) values (?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->execute([$email, $feedback]);

    if ($stmt) {
        echo ('feedback');
    } else {
        echo ('failed');
    }
});



Flight::route('GET|POST /orders', function () {
    $conn = Flight::db();

    $dateVisit = Flight::request()->query->dateVisit;
    $timeVisit = Flight::request()->query->timeVisit;
    $foodNum = Flight::request()->query->foodNum;
    $foodQuantity = Flight::request()->query->foodQuantity;
    $foodPrice = Flight::request()->query->foodPrice;
    $drinkNum = Flight::request()->query->drinkNum;
    $drinkQuantity = Flight::request()->query->drinkQuantity;
    $drinkPrice = Flight::request()->query->drinkPrice;
    $sql = "INSERT INTO `orders` (`dateVisit`, `timeVisit`,`foodNum`, `foodQuantity`, `foodPrice`, `drinkNum`, `drinkQuantity`,`drinkPrice`, `fullName`) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $name = "Nedzad Grbo";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$dateVisit, $timeVisit, $foodNum, $foodQuantity, $foodPrice, $drinkNum, $drinkQuantity, $drinkPrice, $name]);
    

    if ($stmt) {
        echo ('orders');
    } else {
        echo ('failed');
    }
});

Flight::start();
