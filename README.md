# publicip

1. Create a .txt file `ip.txt` and copy its path.
2. Open the script using your favorite text editor.
3. Paste the path in the script. (Assign it to the IPFILE variable). `IPFILE = ~/ip.txt`
4. Enter your e-mail address in the command found below the template.
5. Install `mailutils`. `sudo apt-get install mailutils`
6. Configure postfix `vim /etc/postfix`.
7. Use a proper relay host.
8. Update your cron as you wish.
