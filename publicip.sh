#!/bin/bash
#script to send my public ip on mail if changed
#author=shravandwarka
#version=0.1.1

IPFILE=<enter a text file path here>

if [ ! -f "$IPFILE" ]; then
	curl -o ip.txt ipinfo.io/ip
fi

CIP=$(cat $IPFILE)
NIP=""

while [ -z "$NIP" ]
do
	NIP=$(curl ipinfo.io/ip)
done

if [ "$NIP" != "$CIP" ]; then
	ipadd=`cat << TEMPLATE
	<html>
		<body style="width:75%;margin-left:auto;margin-right:auto;">
			<table style="width:100%;">
				<tr>
					<td style="text-align: center;font-family: 'Lucida Console';font-size: 15px;">
						Old IP Address:
					</td>
					<td style="background-color: red;text-align: center;font-family: 'Lucida Console', Monaco, monospace;font-size: 20px;width: 65%;">
						$CIP
					</td>
				</tr>
				<tr>
					<td style="text-align: center;font-family: 'Lucida Console';font-size: 15px;">
						New IP Address:
					</td>
					<td style="background-color: #A0A0A0;text-align: center;font-family: 'Lucida Console', Monaco, monospace;font-size: 20px;width: 65%;">
						$NIP
					</td>
				</tr>

			</table>
		</body>
	</html>
TEMPLATE
`	
	/usr/bin/printf "%b" "$ipadd" | /usr/bin/mail -a "Content-Type:text/html;" -a "Mime-Version: 1.0;" -s "Public IP Address" <your e-mail address goes here>
	curl -o ip.txt ipinfo.io/ip
fi
