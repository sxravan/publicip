#!/usr/bin/env bash
#script to send my public ip on mail if changed
#author=shravandwarka
#version=0.3

IPFILE=<Enter file path>

if [ ! -f "$IPFILE" ]; then
	curl -o "$IPFILE" ipinfo.io/ip
fi

CIP=$(cat "$IPFILE")
NIP=""
REG=""
COU=""

while [ -z "$NIP" ]
do
	NIP="$(curl ipinfo.io/ip)"
done

if [ "$NIP" != "$CIP" ]; then
	REG="$(curl ipinfo.io/region)"
	COU="$(curl ipinfo.io/country)"
	ipadd=$(cat << TEMPLATE
	<html>
		<header>
			<h1 style="font-family: Impact; font-size: 20px; font-weight: bold; text-align: center;">
				Location: $REG, $COU
			</h1>
		</header>
		<body style="background-color: beige; width:75%;margin-left:auto;margin-right:auto;">
			<table style="width:100%;margin-top:auto;margin-botton:auto;padding-top:50px;padding-bottom:50px;">
				<tr>
					<td colspan="2" style="height: 20px; font-family: 'Lucida Console'; font-size: 15px; font-weight: bold; text-align: center;">
						Public IP Updater
					</td>
				</tr>
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
		<footer style="text-align: right;padding-top:20px;">
			Crafted by <a href="https://github.com/shravanSD/">Shravan Dwarka</a> in Mauritius.
		</footer>
	</html>
TEMPLATE
)	
	/usr/bin/printf "%b" "$ipadd" | /usr/bin/mail -a "Content-Type:text/html;" -a "Mime-Version: 1.0;" -s "Public IP Address" <enter email here>
	curl -o "$IPFILE" ipinfo.io/ip
fi
