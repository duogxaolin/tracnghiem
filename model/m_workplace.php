<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('m_db.php');
include('classes/m_message.php');


function retrieve()
{

    $sql = "SELECT 
        w.id,w.name
    FROM workplaces w   
    ORDER BY w.name ";

  
    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }

        $msg->icon = 'success';
        $msg->title = "Load danh sách đơn vị công tác thành công!";
        $msg->content = $result;
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Load danh sách đơn vị công tác thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }


    return $msg;
}

