# ShellyPlug
Shelly Plug v2 API module

Not sure if I will keep working on this. Only if there is a reason to. 

This is for the single Shelly Plug v2.

The company website is https://shelly.cloud

The product I'm talking about is: https://shelly.cloud/shelly-plus-plug-us/

This is a PowerShell module. 

How to Use:
Once you import-module ./ShellyPlug.psm1
You have 3 CMDlets (so far).
Get-ShellyPlugStatus, Switch-ShellyPlugOff, Switch-ShellyPlugOn
They all take one parameter which I call ShellyIP. You could put in a DNS name here, if you really went that far to give your plugs DNS names. It takes the 
IP as a string, so make sure you do -ShellyIP "192.168.0.1" or whatever your IP is. 

Ask any questions. You can even ask for improvements. 

-Kyle
