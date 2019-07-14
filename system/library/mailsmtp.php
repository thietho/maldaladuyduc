<?php
include(DIR_COMPONENT."smtpmail/class.phpmailer.php");
include(DIR_COMPONENT."smtpmail/class.smtp.php");
final class MailSMTP {
	public function sendMail($data)
	{
		$mail = new PHPMailer();
		$mail->IsSMTP(); // set mailer to use SMTP
		$mail->Host = "smtp.gmail.com"; // specify main and backup server
		$mail->Port = 587; // set the port to use
		$mail->SMTPAuth = true; // turn on SMTP authentication
		$mail->SMTPSecure = 'tls';
		$mail->Username = "infomaldaladuyduc@gmail.com"; // your SMTP username or your gmail username
		$mail->Password = "mE27UdHX"; // your SMTP password or your gmail password
		
		/*$mail->Host = "mail.mylanbeauty.net"; // specify main and backup server
		$mail->Port = 587; // set the port to use
		$mail->SMTPAuth = true; // turn on SMTP authentication
		$mail->SMTPSecure = '';
		$mail->Username = "info@mylanbeauty.net"; // your SMTP username or your gmail username
		$mail->Password = "MyLanBeauty164";*/
		
		$from = "thietho1982@gmail.com"; // Reply to this email
		@$arremail = split(',',$data['to']);
		$to=$arremail[0]; // Recipients email ID
		$name= $data['name']; // Recipient's name
		$mail->From = $from;
		$mail->FromName = $data['FromName']; // Name to indicate where the email came from when the recepient received
		$mail->AddAddress($to,$name);
		$mail->AddReplyTo($from,$data['FromName']);
		//Add CC
		for($i=1;$i<count($arremail);$i++)
		{
			$mail->AddCC($arremail[$i]);
		}
		$mail->WordWrap = 50; // set word wrap
		$mail->IsHTML(true); // send as HTML
		$mail->Subject = $data['subject'];
		$mail->Body = $data['body']; //HTML Body
		$mail->AltBody = $data['altbody']; //Text Body
		//print_r($mail);
		//$mail->SMTPDebug = 2;
		if(!$mail->Send())
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}
?>