<html>
<head>
<title>PHPMailer - Mail() advanced test</title>
</head>
<body>

<?php
require_once '../class.phpmailer.php';

$mail = new PHPMailer(true); //defaults to using php "mail()"; the true param means it will throw exceptions on errors, which we need to catch

try {
  $mail->AddReplyTo('name@yourdomain.com', 'First Last');
  $mail->AddAddress('svtbjsc@gmail.com', 'svtb gmail');
  $mail->SetFrom('phanvanliem@gmail.com', 'liem gmail');
  $mail->AddReplyTo('name@yourdomain.com', 'First Last');
  $mail->Subject = 'dut';
  $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
  $mail->MsgHTML(file_get_contents('contents.html'));
  $mail->AddAttachment('images/phpmailer.gif');      // attachment
  $mail->AddAttachment('images/phpmailer_mini.gif'); // attachment
  $mail->Send();
  echo "Message Sent OK</p>\n";
} catch (phpmailerException $e) {
  echo $e->errorMessage(); //Pretty error messages from PHPMailer
} catch (Exception $e) {
  echo $e->getMessage(); //Boring error messages from anything else!
}
?>
</body>
</html>
