## **5\. Installing Linux Mint: Step-by-Step (Continued)**

**Choosing the Installation Type (continued):**  
* **Option 2: Install Linux Mint alongside:** If the installer detects another operating system (like Windows), this option may appear. It attempts to resize the existing partition to make space and installs Linux Mint in the new space, setting up a dual-boot menu (GRUB). This preserves the existing OS but adds complexity regarding disk space management and potential bootloader conflicts. It is less suitable for a dedicated project laptop for a novice user.  
* **Option 3: Something else:** This allows advanced users to manually create, resize, and assign partitions. **Avoid this option** unless you have specific partitioning needs and understand Linux partitioning schemes.

Select "Erase disk and install Linux Mint" and click "Install Now." A confirmation dialog will appear summarizing the changes to be made to the disk (partition formatting). Review it and click "Continue" if you are sure.  
**Timezone Selection:**  
Click your approximate location on the world map, or type the name of a major city in your timezone into the box. This sets the system clock and regional formats. Click "Continue."  
**User Account Setup:**  
Create your user account for the new Linux Mint system:

1. **Your name:** Enter your real name (optional, used for display purposes).  
2. **Your computer's name:** Choose a hostname for the laptop on the network (e.g., omnitrek-hp-laptop). Use lowercase letters, numbers, and hyphens only.  
3. **Pick a username:** Choose a username for logging in (e.g., omni). Use lowercase letters, numbers, no spaces.  
4. **Choose a password:** Select a strong password.  
5. **Confirm your password:** Re-enter the password.  
6. **Login Options:** Select "Require my password to log in" (recommended for security).  
7. **Encrypt my home folder (Optional):** This adds a layer of security by encrypting your personal files. However, it can introduce a small performance overhead and makes data recovery impossible if you forget your password. For simplicity in this development setup, it's generally safe to leave this unchecked unless specific security requirements dictate otherwise.  
8. Click "Continue."

**Installation Progress:**  
The installer will now copy files from the USB drive to the hard drive and configure the system. A slideshow highlighting Linux Mint features will be displayed. This process typically takes 15-30 minutes.  
**Completing the Installation:**

1. When the installation is finished, a dialog box will appear stating "Installation Complete."  
2. Click "Restart Now."  
3. **Important:** Shortly after clicking restart, a message will appear on screen prompting you to **"Please remove the installation medium, then press ENTER"**. Physically remove the USB flash drive from the laptop *before* pressing the Enter key. Failure to remove the USB drive may cause the system to boot back into the live installer environment.  
4. The laptop will reboot.

If everything went correctly, the system should now boot from the internal hard drive into your newly installed Linux Mint system, presenting the login screen.

## **6\. First Steps in Linux Mint: Post-Installation Essentials**

After the first successful boot into the installed Linux Mint system, several essential configuration steps should be performed to ensure the system is up-to-date, secure, and that all hardware is functioning correctly.  
**Initial Login and Welcome Screen:**

1. At the login screen, select your username and enter the password created during installation.  
2. Upon logging in for the first time, the Linux Mint Welcome Screen will likely appear. This screen provides quick links to documentation, system settings, software management, and importantly, the Driver Manager. It's worth exploring briefly. You can uncheck the box at the bottom right to prevent it from showing on subsequent logins.  
3. Familiarize yourself briefly with the Cinnamon desktop: the panel at the bottom, the Menu button (usually bottom-left), application launchers, and the system tray area (bottom-right) containing icons for network, volume, updates, etc.

**Connecting to the Network:**

* **Ethernet:** If you connected an Ethernet cable, the network connection should be established automatically. Check the network icon in the system tray for confirmation.  
* **Wi-Fi:**  
  1. Click the network icon in the system tray.  
  2. If Wi-Fi networks are listed, your Wi-Fi adapter is working (either out-of-the-box or because you installed multimedia codecs). Select your network name (SSID), enter the password when prompted, and connect.  
  3. **If no Wi-Fi networks are listed or the Wi-Fi section is missing/disabled:** This indicates the necessary driver for your Wi-Fi adapter (likely the Realtek or Atheros identified in Section 2 ) is not currently active. This is a common scenario.  
     * **Solution:** Proceed with the next steps using a wired Ethernet connection if possible. The Driver Manager step (below) is designed to resolve this.  
     * **No Ethernet?:** If Ethernet is unavailable, the Driver Manager might still work if the required driver was included in the initial installation (especially if multimedia codecs were selected). If not, resolving this offline is more complex and may involve downloading the driver package on another computer and transferring it via USB (beyond the scope of this basic guide).

**Updating the System:**  
The installed system is based on the ISO image, which might not contain the latest software versions or security patches. Updating the system immediately is crucial.

* **Using Update Manager (GUI):**  
  1. Look for a shield icon in the system tray (it might show a blue 'i' or an orange dot if updates are available). Click it to launch the Update Manager. Alternatively, find it in the Menu under "Administration".  
  2. The first time it runs, it might ask if you want to switch to a local mirror for software downloads. Doing so can often speed up downloads. Follow the prompts to select faster mirrors if desired.  
  3. Click the "Refresh" button to check for available updates.  
  4. After checking, a list of updates will appear. Click "Install Updates".  
  5. Enter your password when prompted to authorize the installation. Wait for all updates to download and install. A reboot may be required after certain updates (like a new kernel); the Update Manager will inform you if so.  
* **Using Terminal (CLI Alternative):**  
  1. Open a Terminal (find it in the Menu or use Ctrl+Alt+T).  
  2. Run the following commands:  
     `sudo apt update`  
     `sudo apt upgrade -y`

  3. sudo apt update refreshes the list of available packages from the configured software sources. sudo apt upgrade \-y downloads and installs all available updates, automatically confirming prompts with \-y.

Updating the system first ensures that any subsequent driver installations happen on a current and secure base.  
**Installing Proprietary Drivers (Driver Manager):**  
This is the key step to enable hardware components that require non-open-source drivers, most importantly the Wi-Fi adapter and potentially the AMD graphics card for optimal performance or features.

1. Ensure you have an active internet connection (use Ethernet if Wi-Fi is not yet working).  
2. Open the main Menu, search for "Driver Manager," and launch it.  
3. Enter your password when prompted.  
4. The Driver Manager will automatically scan your system's hardware and check online repositories for available proprietary drivers.  
5. If proprietary drivers are found for your hardware (e.g., "Realtek semiconductor..." or "AMD graphics..."), they will be listed. There might be several options, including open-source alternatives (often marked as xserver-xorg-video-ati or similar for graphics, which is likely already in use) and proprietary versions (often marked "recommended").  
6. Select the **recommended** proprietary driver for your Wi-Fi adapter. If a proprietary AMD graphics driver is offered and recommended, you can select that too, although the default open-source driver is often sufficient.  
7. Click the "Apply Changes" button.  
8. Wait patiently as the selected drivers are downloaded and installed.  
9. **Reboot Required:** Once the installation is complete, the Driver Manager will usually indicate that a reboot is required for the changes to take effect. **Reboot the system.**

**Verification:**  
After the reboot, check if the hardware is now working correctly.

* **Wi-Fi:** Click the network icon in the system tray again. Wi-Fi networks should now be listed. Select your network and attempt to connect.  
* **Graphics:** Check if the screen resolution is correct and if the general desktop responsiveness feels smooth.

**Other Initial Setup Considerations:**

* **Timeshift:** Linux Mint automatically configures Timeshift for system snapshots. This tool creates restore points, allowing you to roll back system changes if an update or configuration causes problems. It's a valuable safety net. You can access its settings via the Menu.  
* **System Settings:** Explore the "System Settings" application (accessible from the Menu) to customize the appearance (themes, icons, fonts), configure power management, manage users, and adjust other system preferences.

With the system updated and essential drivers installed, the base Linux Mint environment is ready for the development toolkit installation.

## **7\. Building Your Robotics Toolkit: Development Environment Setup**

This section details the installation of software required for coding, version control, and robotics development, primarily using the APT package manager via the terminal. APT (Advanced Package Tool) is the standard command-line utility for managing software on Debian-based systems like Linux Mint. Most installation commands require administrative privileges, obtained using the sudo prefix.  
**Installing Core Development Tools:**

1. **Git (Version Control):** Essential for managing source code, collaborating, and interacting with repositories like GitHub.  
   `sudo apt update`  
   `sudo apt install git -y`  
   After installation, configure your Git identity (used when you commit changes):  
   `git config --global user.name "Your Name"`  
   `git config --global user.email "your.email@example.com"`

2. **Python 3 and Pip:** Linux Mint typically comes with Python 3 pre-installed. Verify by running python3 \--version. Install pip (the Python Package Installer) and essential development tools (python3-dev for compiling some packages, python3-venv for virtual environments).  
   `sudo apt install python3-pip python3-venv python3-dev -y`  
   Using virtual environments (venv) is highly recommended for managing project-specific Python dependencies and avoiding conflicts between projects.  
3. **C++ Build Tools:** Install the build-essential package. This meta-package includes the GNU C++ compiler (g++), make, and other utilities required for compiling C and C++ code.  
   `sudo apt install build-essential -y`

**Installing an Integrated Development Environment (IDE):**

* **Visual Studio Code (VS Code) (Recommended):** A powerful, popular, and extensible code editor.  
  1. Open a web browser and navigate to the official VS Code website: https://code.visualstudio.com/.  
  2. Download the **.deb** package suitable for Debian/Ubuntu (64-bit).  
  3. Open your Downloads folder using the file manager.  
  4. Double-click the downloaded .deb file (e.g., code\_\*.deb). This should open the GDebi Package Installer or a similar graphical tool.  
  5. Click "Install Package" and enter your password when prompted.  
  6. Alternatively, open a terminal, navigate to your Downloads directory (cd \~/Downloads), and install using apt:  
     `sudo apt install./code_*.deb`  
     (Replace code\_\*.deb with the actual filename). Installing the .deb package usually adds Microsoft's APT repository, allowing VS Code to be updated alongside system updates via the Update Manager.  
* **Windsurf (Alternative AI-Focused IDE):** An IDE based on VS Code with integrated AI features from Codeium. Note that some users have reported stability issues or freezes on Linux , making VS Code the more conservative recommendation. Windsurf also uses its own SSH implementation, which might differ from standard VS Code remote development. To install Windsurf:  
  1. Add the Windsurf GPG key and APT repository:  
     `curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg`  
     `echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null`

  2. Update the package list and install Windsurf:  
     `sudo apt-get update`  
     `sudo apt-get install windsurf`

**(Optional) Installing Arduino IDE:**  
Choose one of the following methods to install the Arduino IDE for programming microcontrollers:

* **Method 1: Using APT (Easiest, potentially older version):**  
  `sudo apt update`  
  `sudo apt install arduino -y`  
  This installs the version available in the Linux Mint/Ubuntu repositories, which might lag behind the absolute latest release.  
* **Method 2: Using Flatpak (Sandboxed, up-to-date):** Flatpak provides applications in isolated environments.  
  1. Install Flatpak and add the Flathub repository (if not already done):  
     `sudo apt install flatpak -y`  
     `sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

  2. Install the Arduino IDE from Flathub (choose one):  
     `# For Arduino IDE 1.x`  
     `flatpak install flathub cc.arduino.arduinoide -y`

     `# For Arduino IDE 2.x`  
     `flatpak install flathub cc.arduino.IDE2 -y`

* **Method 3: Official Download (Latest, manual setup):**  
  1. Visit the Arduino Software page on the official Arduino website.  
  2. Download the appropriate package for Linux (64-bit):  
     * **IDE 2.x:** Download the **AppImage** file (.AppImage).  
     * **IDE 1.x:** Download the **Linux 64 bits** tarball (.tar.xz).  
  3. **For AppImage (IDE 2.x):**  
     * Open a terminal, navigate to the download location.  
     * Make the file executable: chmod \+x Arduino\_IDE\_\*.AppImage.  
     * Run the IDE: ./Arduino\_IDE\_\*.AppImage.  
     * If it fails to run mentioning libfuse.so.2 or FUSE, install the required library: sudo apt install libfuse2 \-y.  
  4. **For Tarball (IDE 1.x):**  
     * Open a terminal, navigate to the download location.  
     * Extract the archive: tar \-xf arduino-\*-linux64.tar.xz.  
     * Navigate into the extracted directory: cd arduino-\*.  
     * Run the installation script: sudo sh install.sh. This usually creates a desktop shortcut.  
* **Crucial: Serial Port Permissions:** To allow the Arduino IDE to communicate with connected Arduino or ESP8266 boards (which appear as serial devices like /dev/ttyACM0 or /dev/ttyUSB0), your user account needs permission to access these device files. Add your user to the dialout group:  
  `sudo usermod -a -G dialout $USER`  
  **Important:** This group membership change only takes effect after you **log out and log back in**. Some sources also suggest adding the user to the tty group might be necessary in certain cases. For Arduino IDE 2.x, adding a udev rule might also be recommended for persistent permissions.

**(Optional) Adding ESP8266 Board Support to Arduino IDE:**  
To program ESP8266 microcontrollers using the Arduino IDE:

1. Open the Arduino IDE.  
2. Go to File \> Preferences.  
3. In the "Additional Boards Manager URLs" field, paste the following URL:  
   `http://arduino.esp8266.com/stable/package_esp8266com_index.json`  
   If other URLs are already present, separate them with a comma. Click "OK".  
4. Go to Tools \> Board \> Boards Manager....  
5. Wait for the index to download. In the search bar, type esp8266.  
6. Find the entry "esp8266 by ESP8266 Community" and click the "Install" button.  
7. After installation completes, close the Boards Manager.  
8. You can now select your specific ESP8266 board type from the Tools \> Board menu.

**(Optional) Installing ROS (Robot Operating System):**  
ROS is a comprehensive framework for robotics software development. Installing it is a significant undertaking beyond the scope of this guide.

1. Identify the appropriate ROS distribution. For Linux Mint 21.x (based on Ubuntu 22.04 Jammy Jellyfish), the corresponding ROS 2 LTS release is **Humble Hawksbill**.  
2. Follow the official ROS 2 Humble installation instructions for Ubuntu: [https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html)  
3. The process typically involves adding the ROS 2 APT repositories, installing core packages via apt, and setting up environment variables.

**Handling Python Libraries and Input Modules:**

* **Using pip and venv:** Install Python packages using pip install \<package\_name\>. It is strongly recommended to create a virtual environment for each project to isolate dependencies:  
  `# Navigate to your project directory (e.g., ~/omnitrek_project)`  
  `cd ~/omnitrek_project`

  `# Create a virtual environment named 'env'`  
  `python3 -m venv env`

  `# Activate the environment (notice the leading 'source')`  
  `source env/bin/activate`

  `# Your terminal prompt should change, indicating the active environment`  
  `# Now install packages needed for this project`  
  `pip install some-package another-package`

  `# When finished working on the project, deactivate the environment`  
  `deactivate`

* **Addressing Keyboard Input Libraries (Root Permissions Issue):** Many robotics or automation tasks involve monitoring or simulating keyboard input. A common Python library for this is keyboard. However, on Linux, this library directly accesses low-level input device files (/dev/input/\*) which requires administrator (root) privileges. Attempting to import keyboard in a script run by a regular user will result in an ImportError: You must be root to use this library on linux.  
  * **Running with sudo:** The direct workaround is to run the Python script using sudo python3 your\_script.py. While functional, running entire applications as root is generally discouraged due to security risks – a bug in the script could potentially damage the system. It can also interfere with accessing user-specific settings or graphical interfaces.  
  * **Adding User to input Group:** Some suggest adding the user to the input group (sudo usermod \-a \-G input $USER) might grant the necessary permissions. However, this grants *all* programs run by that user access to read all input devices (keyboard, mouse), which poses a significant security risk (e.g., potential keylogging by any application). Furthermore, the keyboard library explicitly checks the effective user ID (os.geteuid()) , so merely having group permissions might not bypass the library's internal check. This approach is **not recommended**.  
  * **Recommended Alternative: pynput:** A more robust and commonly used library for controlling and monitoring input devices is pynput. It generally does not require root privileges for basic operations on standard desktop environments.  
    1. **Installation:** Within your activated virtual environment, install pynput:  
       `pip install pynput`

    2. **Dependencies:** On Linux, pynput relies on the X Window System libraries for interacting with the display server. Install the necessary Python bindings for Xlib:  
       `sudo apt install python3-xlib -y`  
       This might already be installed as part of the desktop environment dependencies.  
    3. **Display Server Context:** pynput's ability to capture global hotkeys (keys pressed when the script's window doesn't have focus) works best under the Xorg display server. Newer systems sometimes default to Wayland, which has stricter security policies limiting inter-application communication. Linux Mint Cinnamon typically defaults to Xorg, so pynput is expected to function correctly for global hotkey monitoring in this setup.

Given the security implications and potential limitations of the keyboard module on Linux, using pynput is the recommended approach for handling keyboard input/control in Python for this project.