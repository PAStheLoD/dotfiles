2023-01-19 10:50
  * finger snap ubuntu out of snapping firefox.
  *  https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04
  * as user `gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'`
  * `sudo apt install gnome-shell-extension-manager`
  * via https://www.omgubuntu.co.uk/2022/04/installed-ubuntu-22-04-do-these-things-next


2023-01-19 2:30
  * installed Google Chrome deb
  * set up Seafile
    * one of the synced dirs had some funny characters, Seafile complained but did not inform me of the actual filename(s), then ran `find . -name '*[<>:"/\|?* ]*'` to find it
  * added SSH key loading into the agent at the end of .bashrc
  * Canon EOS M50
    * https://maximevaillancourt.com/blog/canon-dslr-webcam-debian-ubuntu
      * due to using 6.2-rc ... had to manually build & install https://github.com/umlaeute/v4l2loopback
    * it works :o
    * okay, probably I need to write some kind of systemd udev activation thingie to launch the capture to loopback script
      * simple script to add to bashrc as workaround https://austingil.com/dslr-webcam-linux/


2023-01-18
  * new empty 1 TB spinning rust, 500G XFS for everything (rootfs)
  * ubuntu 22.04 form USB pendrive, it was fuuuuuuuuuucking slow to boot from it.
  * after install grub nicely handles existing Win11
  * during install I almost clicked the "download updates & proprietary drivers" in time. confusingly it allows the user to click, even after it does nothing.
  * nvidia geforce RTX 2060 super, worked with noveau + Xwayland pretty okay, but only on 1 display on HDMI (Dell P2415Q)
  * then via the settings additional drivers it was easy to install nvidia-525, it does its DKMS thing pretty well, works on Xorg
  * bluetooth works well with QC35 II, yeey.
  * keepass2
    * needs a PPA (there's an old and a "temporary" one -- `add-apt-repository ppa:ubuntuhandbook1/keepass2`)
    * okay, maybe eventually I need to replace this, because setting up mono, and the plugin handling is a bit meh.
    * needs the RPC plugin, which needs mono-complete (240M)
  * switched back to 5700 XT, because wanted to move toward wayland
  * setup mainline to get 6.2-rc4 so maybe the amdgpu driver gets smarter
  * after a lot of fiddling around with cables, booting back to windows ... it turns out that the Dell + mDP cable + the rightmost port on the card is a bad combo.
    * visible signal noise on the rightmost port, 60Hz 4K on the central one
    * 144Hz works on the M28U flawlessly. yeey.
  * tried vlc snap. meh. 200+ M, vlc deb is just ~80M
  * to set a different background on each display I had to setup HydraPaper -- `flatpak run org.gabmus.hydrapaper`
  * apt install htop sysstat
  * installed VScode deb
    * had to setup AgentForwarding yes for the remote dev VM, maybe VScode has a setting for it, but it was easier to just add it to ~/.ssh/config
    * yzhang.markdown-all-in-one is a pretty nice extension

