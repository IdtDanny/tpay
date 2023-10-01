<?php
    # DOCTYPE html file 1
    include 'header/1_header.html';

    # DOCTYPE html file 2 with style document
    echo ' Notification</title>';
    include 'header/2_header.html';

    # NavBar
    include 'header/nav_header_front_1.html';
    echo '
    <li class="nav-item">
        <a href="index.php" class="nav-link d-md-block d-none bi-arrow-clockwise"></a>
    </li>
    ';
    include 'header/nav_header_front_2.html';
?>

    <!-- agent Profile -->
    <section id="dashboard bg-light">
        <div class="container-md">

            <!-- row for admin profile -->
            <div class="row justify-content-center">

                <!-- Displaying user profile -->
                <div class="col-lg-12">
                    <h2 class="text-center">
                        <span class="text-altprimary fw-bold text-uppercase bi-bell-fill">
                            <?php # $agentResults->admin_name ?> notifications <span class="d-lg-inline-block d-none">list</span>
                        </span>
                    </h2>
                </div>

            </div>

            <!-- row for agent table and list for small media -->
            <div class="row my-0 g-3 justify-content-around align-items-center">
                <div class="col-lg-9 col-lg-6">

                    <!-- filter search field -->
                    <form method="post" class="d-inline">
                        <div class="input-group mb-2">

                            <div class="form-floating">
                                <input type="date" name="filter_notify_date" class="form-control form-control-sm" placeholder="Agent Name" id="floatingInputGroup1" required>
                                <label for="floatingInputGroup1"><i class="bi bi-filter-left"></i> Filter Date</label>
                            </div>

                            <!-- tooltips -->
                            <div class="input-group-text">
                                <div class="tt" data-bs-placement="bottom" title="Filter by full name">
                                    <button type="submit" name="notify_filter" class="btn btn-sm"><i class="bi bi-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <?php if($notify_updateErrorMessage || $notify_deleteErrorMessage || $update_errorMessage) { ?>
                    <div class="alert alert-warning alert-dismissible fade show alert-danger" role="alert">
                        <strong class="bi bi-exclamation-triangle"><?php echo $notify_updateErrorMessage; echo $notify_deleteErrorMessage; echo $update_errorMessage; ?></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>

                    <?php } ?>

                    <?php if($notify_updateSuccessMessage || $notify_deleteSuccessMessage || $update_successMessage) { ?>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong class="bi bi-check2-all"><?php echo $notify_updateSuccessMessage; echo $notify_deleteSuccessMessage; echo $update_successMessage ?></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <?php } ?>

                    <!-- For both media -->
                    <div class="list-group">

                        <?php
                        # checking if user filtered agent name

                        if (isset($_POST['notify_filter'])) {
                            $filter_notify_date = $_POST['filter_notify_date'];
                            echo $admin_notifyResults->date_sent;

                            # Fetching filtered agents info ...

                            $filter_FetchQuery = 'SELECT * FROM `notification_all` WHERE `date_sent` = :notify_name ORDER BY `date_sent` AND `time_sent` DESC ';
                            $filter_FetchStatement = $pdo->prepare($filter_FetchQuery);
                            $filter_FetchStatement->execute([
                                'notify_name' => $filter_notify_date
                            ]);
                            $filter_Result = $filter_FetchStatement->fetchAll();

                            if (!$filter_Result) {
                                echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    <strong class="bi bi-check2-all"> Not found'.$errorRefreshMessage.'</strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
                                } 
                                else { 
                                    echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <strong class="bi bi-check2-all"> Match found'.$successRefreshMessage.'</strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
 
                                    foreach ($filter_Result as $notify) {

                                    # getting everything

                                    $business_FetchQuery = 'SELECT * FROM `business` WHERE `business_tin` = :receiver_id OR `business_tin` = :sender_id';
                                    $business_FetchStatement = $pdo->prepare($business_FetchQuery);
                                    $business_FetchStatement->execute([
                                        'receiver_id' => $notify->receiver_id,
                                        'sender_id'   => $notify->sender_id
                                    ]);
                                    $business_Result = $business_FetchStatement->fetch();
        
                                    $business_name = $business_Result->business_name;
        
                                    $agent_FetchQuery = 'SELECT * FROM `agent` WHERE `agent_pin` = :receiver_id OR `agent_pin` = :sender_id';
                                    $agent_FetchStatement = $pdo->prepare($agent_FetchQuery);
                                    $agent_FetchStatement->execute([
                                        'receiver_id' => $notify->receiver_id,
                                        'sender_id'   => $notify->sender_id
                                    ]);
                                    $agent_Result = $agent_FetchStatement->fetch();
        
                                    $agent_name = $agent_Result->agent_name;
                            ?>

                            <div class="list-group-item py-3 bg-light-subtle">
                                <h5 class="mb-1 text-capitalize">
                                    <?php 
                                    if ($notify->status == "read") {
                                        echo "<span class='text-success'><i class='bi-bell-fill'></i>TPS - ". $notify->action . "</span>";
                                ?>
                                    <span class="badge fw-light bg-success float-end"><small><?php echo $notify->status ?></small></span>
                                    <?php 
                                    } else {
                                        echo "<span class='text-danger'><i class='bi-bell-fill'></i>TPS - ". $notify->action . "</span>";
                                ?>
                                    <span class="badge fw-light bg-danger float-end"><small><?php echo $notify->status ?></small></span>
                                    <?php } ?>
                                </h5>

                                <!-- Fetch notify message -->
                                <p class="mb-1 just">
                                    <?php if ($notify->action == 'transfer') { ?>
                                    <small class="fw-light"><?php echo "Tps M-Card: ". number_format($notify->amount)." RWF withdrawn from account ". $agent_name . $business_name . " (" . $notify->receiver_id .") on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small>
                                    <?php } if ($notify->action == 'recharge') { ?>
                                    <small class="fw-light"><?php echo "Tps M-Card: You have recharged ". $agent_name . $business_name ." (". $notify->receiver_id .") with ". number_format($notify->amount)." RWF on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small>
                                    <?php } ?>
                                    <?php # } if ($notify->action == 'recharge') { ?>
                                    <!-- <small class="fw-light"><?php echo "Tps M-Card: You have received ". number_format($notify->amount)." RWF on your account with PIN (****) from ". $notify->sender_id ." on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small> -->
                                    <?php # } if ($notify->action == 'transfer') { ?>
                                    <!-- <small class="fw-light"><?php echo "Tps M-Card: You have transferred ". number_format($notify->amount)." RWF to ". $notify->sender_id ." from your account with PIN (****) on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small> -->
                                    <?php # } ?>
                                </p>

                                <!-- update and delete modal triggers -->
                                <small class="text-body-secondary">
                                    Received at <?php echo date('M d, Y', strtotime($notify->date_sent)) ?>
                                    <span class="btn-group-sm float-end">

                                    <?php if ($notify->status == 'read') { ?>
                                    <?php } else {?>
                                        <a href="notification.php?vnID=<?php echo $notify->nID ?>" class="btn btn-info bi-folder2-open" title="View"><span class="d-md-inline-block d-none">&nbsp;View</span></a>
                                    <?php }?>

                                        <a href="notification.php?dnID=<?php echo $notify->nID ?>" class="btn btn-danger bi-trash3" title="Delete"><span class="d-md-inline-block d-none">&nbsp;Delete</span></a>
                                    </span>
                                </small>
                            </div>

                            <?php # } ?>
                            <?php } } } else { foreach($admin_notifyResults as $key => $notify) {

                            # getting everything

                            $business_FetchQuery = 'SELECT * FROM `business` WHERE `business_tin` = :receiver_id OR `business_tin` = :sender_id';
                            $business_FetchStatement = $pdo->prepare($business_FetchQuery);
                            $business_FetchStatement->execute([
                                'receiver_id' => $notify->receiver_id,
                                'sender_id'   => $notify->sender_id
                            ]);
                            $business_Result = $business_FetchStatement->fetch();

                            if ($business_Result) {
                                $business_name = $business_Result->business_name;
                            }
                            else {
                                $business_name = '';
                            }

                            $agent_FetchQuery = 'SELECT * FROM `agent` WHERE `agent_pin` = :receiver_id OR `agent_pin` = :sender_id';
                            $agent_FetchStatement = $pdo->prepare($agent_FetchQuery);
                            $agent_FetchStatement->execute([
                                'receiver_id' => $notify->receiver_id,
                                'sender_id'   => $notify->sender_id
                            ]);
                            $agent_Result = $agent_FetchStatement->fetch();

                            if ($agent_Result) {
                                $agent_name = $agent_Result->agent_name;
                            }
                            else {
                                $agent_name = '';
                            }


                            # To list few of notify. 
                            if ($key == 15) {
                                break;
                            }
                            else {
                                if ($business_Result || $agent_Result) {
                        ?>

                            <div class="list-group-item py-3 bg-light-subtle">
                                <h5 class="mb-1 text-capitalize">
                                    <?php 
                                    if ($notify->status == "read") {
                                        echo "<span class='text-success'><i class='bi-bell-fill'></i>TPS - ". $notify->action . "</span>";
                                ?>
                                    <span class="badge fw-light bg-success float-end"><small><?php echo $notify->status ?></small></span>
                                    <?php 
                                    } else {
                                        echo "<span class='text-danger'><i class='bi-bell-fill'></i>TPS - ". $notify->action . "</span>";
                                ?>
                                    <span class="badge fw-light bg-danger float-end"><small><?php echo $notify->status ?></small></span>
                                    <?php } ?>
                                </h5>

                                <!-- Fetch notify message -->
                                <p class="mb-1 just">
                                    <?php if ($notify->action == 'transfer') { ?>
                                    <small class="fw-light"><?php echo "Tps M-Card: ". number_format($notify->amount)." RWF withdrawn from account ". $agent_name . $business_name . " (" . $notify->receiver_id .") on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small>
                                    <?php } if ($notify->action == 'recharge') { ?>
                                    <small class="fw-light"><?php echo "Tps M-Card: You have recharged ". $agent_name . $business_name ." (". $notify->receiver_id .") with ". number_format($notify->amount)." RWF on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small>
                                    <?php } ?>
                                    <?php # } if ($notify->action == 'recharge') { ?>
                                    <!-- <small class="fw-light"><?php echo "Tps M-Card: You have received ". number_format($notify->amount)." RWF on your account with PIN (****) from ". $notify->sender_id ." on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small> -->
                                    <?php # } if ($notify->action == 'transfer') { ?>
                                    <!-- <small class="fw-light"><?php echo "Tps M-Card: You have transferred ". number_format($notify->amount)." RWF to ". $notify->sender_id ." from your account with PIN (****) on ". $notify->date_sent ." at ". $notify->time_sent . "." ?></small> -->
                                    <?php # } ?>
                                </p>

                                <!-- update and delete modal triggers -->
                                <small class="text-body-secondary">
                                    Received at <?php echo date('M d, Y', strtotime($notify->date_sent)) ?>
                                    <span class="btn-group-sm float-end">

                                    <?php if ($notify->status == 'read') { ?>
                                    <?php } else {?>
                                        <a href="notification.php?vnID=<?php echo $notify->nID ?>" class="btn btn-info bi-folder2-open" title="View"><span class="d-md-inline-block d-none">&nbsp;View</span></a>
                                    <?php }?>

                                        <a href="notification.php?dnID=<?php echo $notify->nID ?>" class="btn btn-danger bi-trash3" title="Delete"><span class="d-md-inline-block d-none">&nbsp;Delete</span></a>
                                    </span>
                                </small>
                            </div>
                            <?php } } } } ?>

                    </div>

                </div>
            </div>

        </div>
    </section>

    <?php
        include 'include/footer_front.html';
    ?>