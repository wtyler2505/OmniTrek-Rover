## **8\. Enabling Remote Control: SSH Server Setup**

Setting up a Secure Shell (SSH) server allows you to securely connect to and control the Linux Mint laptop from another computer on the same network using a command-line interface. This is invaluable for remote development, monitoring, and administration.  
**Installing the SSH Server:**  
The standard SSH server software for Linux is OpenSSH. Install the server package using apt:  
`sudo apt update`  
`sudo apt install openssh-server -y`

**Checking and Managing the SSH Service:**  
The SSH server service (ssh or sshd) usually starts automatically upon installation. You can verify its status:  
`sudo systemctl status ssh`

Look for output indicating "active (running)". If needed, you can manually start, stop, enable (start on boot), or disable the service using:  
`sudo systemctl start ssh`  
`sudo systemctl stop ssh`  
`sudo systemctl enable ssh  # Ensures it starts automatically on future boots`  
`sudo systemctl disable ssh # Prevents it from starting automatically`

**Finding the Laptop's IP Address:**  
To connect remotely, you need the IP address assigned to the laptop on your local network. Open a terminal on the Mint laptop and run:  
`ip addr show`

Look for the network interface currently in use (e.g., eth0 for wired Ethernet, or wlan0 or similar for Wi-Fi). Under that interface's entry, find the line starting with inet followed by the IP address (e.g., inet 192.168.1.105/24). Note this IP address.  
It's important to understand that this IP address is likely assigned dynamically by your network router (via DHCP) and could potentially change after a reboot or lease expiration. For persistent remote access, consider configuring a static IP address on the Mint laptop itself (via Network Manager settings) or setting up a DHCP reservation for the laptop's MAC address in your router's configuration. Alternatively, Linux Mint often supports mDNS/Avahi out-of-the-box, allowing connection via ssh username@hostname.local (using the computer name set during installation), which can work even if the IP changes.  
**Configuring the Firewall (UFW):**  
A firewall is essential for network security. Linux Mint includes UFW (Uncomplicated Firewall). It might be inactive by default. To allow incoming SSH connections, you must configure UFW.

1. **Check UFW Status:**  
   `sudo ufw status`  
   If it reports "Status: inactive", you will need to enable it after adding the necessary rule. UFW's default policy when enabled is typically to deny all incoming connections unless explicitly allowed.  
2. **Allow SSH Connections:** Create a rule to permit incoming traffic on the standard SSH port (TCP port 22):  
   `sudo ufw allow ssh`  
   This command uses the predefined application profile for SSH. Alternatively, you can specify the port directly: sudo ufw allow 22/tcp.  
3. **Enable UFW (if inactive):** If UFW was reported as inactive in step 1, enable it now:  
   `sudo ufw enable`  
   Confirm the operation when prompted. Enabling the firewall without first allowing SSH would block your remote access attempts.  
4. **Verify Rules:** Check the status again to confirm the firewall is active and the SSH rule is present:  
   `sudo ufw status verbose`  
   You should see entries allowing traffic on port 22/tcp.

If you plan to use other remote access methods like RDP (via xrdp), you would need to allow its corresponding port as well (typically 3389): sudo ufw allow 3389\. However, for development purposes, SSH is generally preferred.  
**Connecting Remotely via SSH:**  
From another computer on the same network:

* **From Linux or macOS:** Open a terminal and use the ssh command:  
  `ssh your_mint_username@laptop_ip_address`  
  Replace your\_mint\_username with the username created during the Mint installation and laptop\_ip\_address with the IP address you found earlier.  
* **From Windows:**  
  * **Modern Windows (10/11):** Open Command Prompt or PowerShell and use the same ssh command as above.  
  * **Older Windows or Preference:** Use a third-party SSH client like PuTTY. Enter the laptop's IP address in the "Host Name (or IP address)" field, ensure Port is 22 and Connection type is SSH, then click "Open."

The first time you connect from a new client machine, you will likely see a message about the authenticity of the host and its ECDSA key fingerprint. Type yes to continue connecting. You will then be prompted for the password associated with the user account on the Linux Mint laptop. Once authenticated, you will have a command-line session controlling the remote laptop.

## **9\. Conclusion**

Following the steps outlined in this guide, the HP Pavilion 15-n210dx laptop has been successfully configured with Linux Mint Cinnamon LTS. The process included assessing the hardware, preparing verified installation media, adjusting necessary BIOS/UEFI settings like disabling Secure Boot, performing the operating system installation using the recommended "Erase disk" method, and completing essential post-installation tasks such as system updates and proprietary driver installation via the Driver Manager, particularly addressing potential Wi-Fi issues.  
Furthermore, a core development environment suitable for the OmniTrek Rover project (or general robotics/electronics work) has been established, including Git, Python 3 (with pip and venv), C++ build tools, VS Code, and optionally the Arduino IDE with ESP8266 support. The guide specifically addressed the common challenge of Python keyboard input libraries on Linux, recommending pynput over the keyboard module to avoid running scripts with root privileges. Finally, remote access has been enabled by installing and configuring the OpenSSH server and adjusting the UFW firewall rules.  
The HP Pavilion 15-n210dx, while having modest hardware specifications, is now a functional Linux workstation prepared for development tasks. Performance for demanding operations might be limited by the original hardware, but the system provides a stable and versatile platform.  
**Next Steps:**  
With the setup complete, potential next steps include:

* Cloning the OmniTrek Rover project repository using Git.  
* Creating a Python virtual environment (venv) for the project and installing necessary Python packages using pip.  
* Starting development using the installed IDE (VS Code or Windsurf).  
* If using microcontrollers, connecting the Arduino/ESP8266 board and testing communication/upload via the Arduino IDE (remembering the dialout group permission).  
* If required, begin installing and configuring ROS by following the official documentation linked earlier.  
* Further exploring and customizing the Linux Mint environment through System Settings.  
* Setting up Timeshift snapshots if custom configuration is desired.

**Further Resources:**

* **Linux Mint Documentation:** [https://linuxmint.com/documentation.php](https://linuxmint.com/documentation.php)  
* **Arduino Documentation:** [https://docs.arduino.cc/](https://docs.arduino.cc/)  
* **Python Documentation:** [https://docs.python.org/3/](https://docs.python.org/3/)  
* **VS Code Documentation:** [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)  
* **ROS 2 Humble Documentation:** [https://docs.ros.org/en/humble/](https://docs.ros.org/en/humble/)  
* **pynput Documentation:** [https://pynput.readthedocs.io/](https://pynput.readthedocs.io/)

Should issues arise, consulting community forums such as the official Linux Mint forums, Ask Ubuntu (askubuntu.com), and Stack Overflow (stackoverflow.com) can be very helpful. Providing specific error messages and details about the system configuration will increase the likelihood of receiving effective assistance.

#### **Works cited**

1\. HP Pavilion 15-n210dx Repair Help \- iFixit, https://www.ifixit.com/Device/HP\_Pavilion\_15-n210dx 
2\. HP Pavilion TS 15-n210dx 15.6" A8-4555M 1.6GHz 4GB 750GB DVD WiFi BT C, https://www.ntelectronic.com/products/hp-pavilion-ts-15-n210dx-15-6-a8-4555m-1-6ghz-4gb-750gb-dvd-wifi-bt-cam-w8-1 
3\. HP Pavilion TouchSmart 15.6" Touch-Screen Laptop AMD A8-Series 4GB Memory 750GB Hard Drive Anodized Silver/Sparking Black 15-n210dx \- Best Buy, https://www.bestbuy.com/site/hp-pavilion-touchsmart-15-6-touch-screen-laptop-amd-a8-series-4gb-memory-750gb-hard-drive-anodized-silver-sparking-black/3596544.p?skuId=3596544 
4\. HP Pavilion 15-n210dx 15.6" Genuine Wireless WiFi Card 709505-001 RTL8188EE ER, https://www.ebay.com/itm/333130838959 
5\. HP Pavilion 15-n210dx 15.6" Genuine Laptop Wireless WiFi Card ar5bhb63, https://www.gotlaptopparts.com/products/hp-pavilion-15-n210dx-15-6-genuine-laptop-wireless-wifi-card-ar5bhb63 
6\. Install and Setup Linux Mint Debian Edition 6 "Faye" \- YouTube, https://www.youtube.com/watch?v=WtTdstZx6JU 
7\. Memory Upgrade for HP Pavilion 15-n210dx TouchSmart Laptop, https://www.memorystock.com/memory/HewlettPackardPavilion15n210dxTouchSmart.html 
8\. HP Pavilion Notebook 15-n210dx TouchSmart Compatible SSD Upgrades \- Mr Memory, https://www.mrmemory.co.uk/ssd-upgrades/hp/pavilion-notebook/15-n210dx-touchsmart 
9\. Memory for a HP/HPE \- Pavilion TouchSmart Notebook 15-n210dx \- Kingston Technology, https://www.kingston.com/en/memory/search/model/90283/hp-hpe-pavilion-touchsmart-notebook-15-n210dx 
10\. Advanced \- Windsurf \- Codeium, https://docs.codeium.com/windsurf/advanced 
11\. Windsurf \- Getting Started, https://docs.codeium.com/windsurf/getting-started 
12\. Installing the Arduino IDE on Linux \- Baeldung, https://www.baeldung.com/linux/arduino-ide-install 
13\. Download and install Arduino IDE, https://support.arduino.cc/hc/en-us/articles/360019833020-Download-and-install-Arduino-IDE 
14\. Installing \- ESP8266 Arduino Core documentation \- Read the Docs, https://arduino-esp8266.readthedocs.io/en/latest/installing.html 
15\. Installing ESP8266 Board in Arduino IDE (Windows, Mac OS X, Linux), https://randomnerdtutorials.com/how-to-install-esp8266-board-arduino-ide/ 
16\. I want to download Linux but I don't know how. : r/linuxquestions \- Reddit, https://www.reddit.com/r/linuxquestions/comments/g1imgx/i\_want\_to\_download\_linux\_but\_i\_dont\_know\_how/ 
17\. Verify your ISO image \- Linux Mint Installation Guide \- Read the Docs, https://linuxmint-installation-guide.readthedocs.io/en/latest/verify.html 
18\. balenaEtcher \- Flash OS images to SD cards & USB drives, https://etcher.balena.io/ 
19\. Solved: How to fix bootable usb not showing in bios or boot menu? \- HP Support Community, https://h30434.www3.hp.com/t5/Notebook-Software-and-How-To-Questions/How-to-fix-bootable-usb-not-showing-in-bios-or-boot-menu/td-p/9097429 
20\. Create the bootable media \- Linux Mint Installation Guide \- Read the Docs, https://linuxmint-installation-guide.readthedocs.io/en/latest/burn.html 
21\. HP PCs \- Configuring the boot order in the system BIOS, https://support.hp.com/in-en/document/ish\_3891464-2337914-16 
22\. How to access boot options to enable USB boot drive \- HP Support Community \- 5772607, https://h30434.www3.hp.com/t5/Notebook-Boot-and-Lockup/How-to-access-boot-options-to-enable-USB-boot-drive/td-p/5772607 
23\. How to Configure the Boot Order in the System BIOS for HP PCs | HP Support \- YouTube, https://www.youtube.com/watch?v=UzPKv5J\_NkI\&pp=0gcJCdgAo7VqN5tD 
24\. Change Boot Sequence and How to Boot from USB \- HP Support Community \- 6132655, https://h30434.www3.hp.com/t5/Notebook-Operating-System-and-Recovery/Change-Boot-Sequence-and-How-to-Boot-from-USB/td-p/6132655 
25\. Solved: Changing boot order \- HP Support Community \- 8893962, https://h30434.www3.hp.com/t5/Notebook-Boot-and-Lockup/Changing-boot-order/td-p/8893962 
26\. Solved: Can't change boot order/sequence \- HP Support Community \- 8272902, https://h30434.www3.hp.com/t5/Notebook-Boot-and-Lockup/Can-t-change-boot-order-sequence/td-p/8272902 
27\. I can't install Linux on my laptop, https://www.linux.org/threads/i-cant-install-linux-on-my-laptop.47273/ 
28\. Linux Mint Debian Edition COMPLETE Install Guide \- YouTube, https://www.youtube.com/watch?v=reHV4ihkY7w\&pp=0gcJCfcAhR29\_xXO 
29\. Windsurf Editor by Codeium, https://codeium.com/windsurf 
30\. Windsurf Freezes on Linux : r/Codeium \- Reddit, https://www.reddit.com/r/Codeium/comments/1itv8gi/windsurf\_freezes\_on\_linux/ 
31\. Anyone managed to get windsurf working in Debian? : r/Codeium \- Reddit, https://www.reddit.com/r/Codeium/comments/1hevpvt/anyone\_managed\_to\_get\_windsurf\_working\_in\_debian/ 
32\. How to install the latest Arduino IDE? \- Ask Ubuntu, https://askubuntu.com/questions/107619/how-to-install-the-latest-arduino-ide 
33\. Flatpak—the future of application distribution, https://flatpak.org/ 
34\. Arduino IDE 1 Installation (Linux), https://www.arduino.cc/en/Guide/Linux 
35\. Downloading and installing the Arduino IDE 2, https://docs.arduino.cc/software/ide-v2/tutorials/getting-started/ide-v2-downloading-and-installing/ 
36\. ESP8266 core for Arduino \- GitHub, https://github.com/esp8266/Arduino 
37\. (RESOLVED) How to add unlisted boards like ESP8266 OLED? \- IDE 2.x \- Arduino Forum, https://forum.arduino.cc/t/resolved-how-to-add-unlisted-boards-like-esp8266-oled/1232899 
38\. How To Install ESP32 And ESP8266 Boards In Arduino IDE (Step-by-Step Guide), https://arduinoyard.com/install-esp32-and-esp8266-boards-in-arduino-ide/ 
39\. Import error: you must be root \- python \- Stack Overflow, https://stackoverflow.com/questions/48796147/import-error-you-must-be-root 
40\. You must be root to use this library on linux." · Issue \#420 · boppreh/keyboard \- GitHub, https://github.com/boppreh/keyboard/issues/420 
41\. keyboard module; must be root problem \- Python Forum, https://python-forum.io/thread-33152.html 
42\. ImportError: You must be root to use this library on linux. Keyboard module doesn't work. Can you help? \- Ask Ubuntu, https://askubuntu.com/questions/1387219/importerror-you-must-be-root-to-use-this-library-on-linux-keyboard-module-does 
43\. Guide to Python's keyboard Module \- Stack Abuse, https://stackabuse.com/guide-to-pythons-keyboard-module/ 
44\. ImportError in python keyboard library \[duplicate\] \- Stack Overflow, https://stackoverflow.com/questions/68663955/importerror-in-python-keyboard-library 
45\. How can I give Python's "keyboard" and "mouse" modules root permissions to run?, https://askubuntu.com/questions/1380965/how-can-i-give-pythons-keyboard-and-mouse-modules-root-permissions-to-run 
46\. How do you install the keyboard module with root privileges? · python-poetry · Discussion \#9258 \- GitHub, https://github.com/orgs/python-poetry/discussions/9258 
47\. pynput \- PyPI, https://pypi.org/project/pynput/ 
48\. Error importing 'pynput' library in python 2.7 in ubuntu 16, https://askubuntu.com/questions/880026/error-importing-pynput-library-in-python-2-7-in-ubuntu-16 
49\. How can I get pynput working with ubuntu? \- Stack Overflow, https://stackoverflow.com/questions/70700153/how-can-i-get-pynput-working-with-ubuntu 
50\. \[SOLVED\] Pynput module not working properly on framework with Ubuntu 22.04 \- Linux, https://community.frame.work/t/solved-pynput-module-not-working-properly-on-framework-with-ubuntu-22-04/27548 
51\. Configuring System Firewall with Cinnamon Desktop on Linux Mint \- Siberoloji, https://www.siberoloji.com/configuring-system-firewall-with-cinnamon-desktop-on-linux-mint/ 
52\. How to Use UFW Firewall on Debian, Ubuntu, Linux Mint \- LinuxBabe, https://www.linuxbabe.com/security/ufw-firewall-debian-ubuntu-linux-mint-server 
53\. How to add xRDP and XFCE4 o UFW rules? \- Ask Ubuntu, https://askubuntu.com/questions/1001154/how-to-add-xrdp-and-xfce4-o-ufw-rules 
54\. How to Set Up Remote Access with Cinnamon Desktop on Linux Mint | Siberoloji, https://www.siberoloji.com/how-to-set-up-remote-access-with-cinnamon-desktop-on-linux-mint/