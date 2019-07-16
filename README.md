# Read me: Public IP Notifier

This script was created for my personal use. I had an external hard disk connected to my raspberry pi at home and wanted to access my data anywhere I was. I did not want to spend on a VPS to set up a VPN server.

Feel free to create any issue / feature request.

## Instructions

1.	Edit the publicip.sh file and set your e-mail address in the EMAIL variable.
2.	Install mailutils and postfix packages.
	> Normally postfix gets installed when installing mailutils.
3.	Configure postfix:
	1.	> sudo vi /etc/postfix/main.cf
	2.	Set inet_interface from all to either loopback-only or localhost.
		> inet_interfaces = localhost
	3.	Write and quit.
	4.	Restart the postfix service.
		> systemctl restart postfix

##### Regards!