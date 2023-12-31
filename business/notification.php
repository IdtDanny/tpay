<?php
    session_start();

    # Checkin if The user logged in...

    if (!isset($_SESSION['sessionToken'])) {
        header("location:../index.php");
    }

    # Includes...
    require_once '../public/config/connection.php';

    # Getting Information of Signed in User
    $bID = $_SESSION['sessionToken']->bID;
    $business_name = $_SESSION['sessionToken']->business_name;
    $business_tin = $_SESSION['sessionToken']->business_tin;
    $photo = $_SESSION['sessionToken']->photo;

    $notify_updateErrorMessage = '';
    $notify_deleteErrorMessage = '';
    $update_errorMessage = '';
    $notify_updateSuccessMessage = '';
    $notify_deleteSuccessMessage = '';
    $update_successMessage = '';

    # Getting business Info. for update form...

    $businessFetchQuery = 'SELECT * FROM `business` WHERE `bID` = :bID';
    $businessFetchStatement = $pdo->prepare($businessFetchQuery);
    $businessFetchStatement->execute([
        'bID' => $bID
    ]);
    $businessResults = $businessFetchStatement->fetch();

    # Calculating Each Number of Users, Cards, business, agents and so on...
    
    $sql_agent = 'SELECT * FROM agent';
    $sql_client = 'SELECT * FROM client';
    $sql_business = 'SELECT * FROM business';
    $sql_business_gas = 'SELECT * FROM `business` WHERE `business_type` = :btype';
    $sql_business_others = 'SELECT * FROM `business` WHERE `business_type` = :otype';
    // $usedCardsSql = 'SELECT * FROM `client` WHERE `Approve` = :approve';

    $statement = $pdo->prepare($sql_agent);
    $statement->execute();

    $statement_client = $pdo->prepare($sql_client);
    $statement_client -> execute();

    $statement_business = $pdo->prepare($sql_business);
    $statement_business -> execute();

    $statement_business_gas = $pdo->prepare($sql_business_gas);
    $statement_business_gas -> execute([
        'btype' => 'gas'
    ]);

    $statement_business_others = $pdo->prepare($sql_business_others);
    $statement_business_others -> execute([
        'otype' => 'others'
    ]);

    # Getting The number of Agents, Cards, Business...
    $agentsCount = $statement->rowCount();
    $registered_client = $statement_client->rowCount();
    $registered_business = $statement_business -> rowCount();
    $gas_business = $statement_business_gas -> rowCount();
    $others_business = $statement_business_others -> rowCount();

    # Fetching business info ...

    $business_FetchQuery = 'SELECT * FROM `business` ORDER BY `Date` DESC';
    $business_FetchStatement = $pdo->prepare($business_FetchQuery);
    $business_FetchStatement->execute();
    $business_Result = $business_FetchStatement->fetchAll();

    # Getting user notifications

    $business_notifyFetchQuery = 'SELECT * FROM `notification_all` WHERE `receiver_id` = :business_tin OR `sender_id` = :nbusiness_tin ORDER BY `date_sent` AND `time_sent` DESC';
    $business_notifyFetchStatement = $pdo->prepare($business_notifyFetchQuery);
    $business_notifyFetchStatement->execute([
        'business_tin'  => $business_tin,
        'nbusiness_tin' => $business_tin
    ]);
    $business_notifyResults = $business_notifyFetchStatement->fetchAll();

    # refreshing message
    $errorRefreshMessage = "<span class='d-md-inline-block d-none'>&nbsp; Refresh to continue </span><a href='notification.php' class='float-end fw-bold text-danger'><i class='bi bi-arrow-clockwise me-3'></i></a>";

    $successRefreshMessage = "<span class='d-md-inline-block d-none'>&nbsp; Refresh to see the change </span><a href='notification.php' class='float-end fw-bold text-success'><i class='bi bi-arrow-clockwise me-3'></i></a>";

    # getting business delete response
    if (isset($_GET['vnID'])) {
        $dnID = $_GET['vnID'];
        $sql_nupdate = 'UPDATE `notification_all` SET `status` =:nread WHERE `nID` = :nid';

        # PDO Prep & Exec..
        $update_notify = $pdo->prepare($sql_nupdate);
        $update_notify->execute([
            'nread'    => 'read',
            'nid'       =>  $dnID
        ]);

        if ($sql_nupdate) {
            $notify_updateSuccessMessage = " Viewed" . $successRefreshMessage;
        }
        else {
            $notify_updateErrorMessage = " Could not update, check business id" . $errorRefreshMessage;
        }

    }

    # getting business delete response
    if (isset($_GET['dnID'])) {
        $dnID = $_GET['dnID'];
        $sql_ndelete = 'DELETE FROM `notification_all` WHERE nID = :nid';

        # PDO Prep & Exec..
        $delete_notify = $pdo->prepare($sql_ndelete);
        $delete_notify->execute([
            'nid'  =>  $dnID
        ]);

        if ($sql_ndelete) {
            $notify_deleteSuccessMessage = " Deleted Successful" . $successRefreshMessage;
        }
        else {
            $notify_deleteErrorMessage = " Could not delete, check business id" . $errorRefreshMessage;
        }

    }
    
?>

<?php 
    include 'include/notification_front.html';
?>