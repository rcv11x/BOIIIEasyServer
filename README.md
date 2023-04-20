✨ BOIIIEasyServer is a script written in batch that automates the installation of a T7 server (BOIII) with a simple click

### What does it do?
- It basically automates the installation process of a T7 server (BOIII) for Windows, automatically downloads everything necessary to start a server even if it still requires a little hand on the part of the user such as editing parts of your server such as (name, maximum clients, map rotation ...), automatically downloads steamcmd, installs the server files for Black Ops 3 and downloads the configuration files for the server <br> 
It requires a stable connection to download everything you need since they are ~3.6gb, the speed will depend on your internet connection.
Thanks to [Dss0](https://github.com/Dss0/) for the [configuration files](https://github.com/Dss0/t7-server-config)

## How to use

1- Download the script to `.zip` and unzip it, then move the script to a folder where you want to install the server. <br>
2- Run the script
3- Download the `boiii.exe` client and move it to the BO3 folder e.g.: D:\SteamLibrary\steamapps\common\Call of Duty Black Ops III
Important: To have access to the client you must be a sponsor of the BOIII project created by [momo5502](https://github.com/momo5502/boiii) are 5€ and you can do it by [Patreon](https://www.patreon.com/xlabsproject) or by [Github Sponsor](https://github.com/sponsors/momo5502)

## What to do next? 
- Go to the BOIII folder and edit with Notepad or your favorite editor the file `BOIII_MP_Server.bat` (For MP), in the `GamePort` variable you can change the port to the one you want to use in your server (You can leave the one that is set).
- Now go to the `zone` folder and edit the `server.cfg` file, this is the file where you can edit all the values of your server, I recommend to edit the name of your server which is the variable `set live_steam_server_name`.
- You must allow 2 inbound rules in your Firewall, both the executable `boiii.exe` (as a program) and the port `27017` for `UDP`.
- If you want your friends or other people to be able to join your server you must open port `27017` via `UDP` on your router.
