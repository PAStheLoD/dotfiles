2023-02-06
  * things for .bashrc: `export PS4='$0.$LINENO+ '`
    * so every time a script runs with `-x` (or `-o trace`) instead of the `+` we get a nice filename + linenumber. neat! ([source](https://theleo.zone/posts/linux-upskill/)) 
  * also, good to know, [sshpass](https://serverfault.com/a/512220/6619) (because no one has time for `expect`)
  * also also, I want to explore alternatives for Hetzner's Storage thing .. so I paid 7EUR for a VM at DeinServerHost.de, then promptly forgot the root password, then tried metasploit to recover it :) ... but no luck with `post/multi/recon/local_exploit_suggestor` :(

2023-01-25
  * webcam + udev, yeey :)
    * see [webcam](webcam/) directory

2023-01-23
  * oh, full HD webcam, okay. https://github.com/gphoto/libgphoto2/issues/567#issuecomment-740813120
  * also Signal "minimize to tray" works, but there's no UI option for it https://github.com/signalapp/Signal-Desktop/issues/3877

2023-01-22
  * StarCraft II runs in 4K almost perfectly. (probably rusty spinning disk is the cause of all the hitches)
    * lutris! (just installed wine, then Lutris, searched for SC2, click click .. it installs battle.net installer, then it just works)

2023-01-21
  * signal ... ah ... the joys of open source. https://github.com/signalapp/Signal-Desktop/issues/2521

2023-01-20
  * printing with a Brother MFC printer works flawlessly (just click click click from Chrome, find printer, add, blablabla, great)
  * scanning not so lucky :D I just gave up and took a photo with my phone 😅
  * so gnome is what it is. the Settings "app" ([gnome-control-center](https://gitlab.gnome.org/GNOME/gnome-control-center)) has a nice interface, but it just ... stops working correctly after some usage. how? why? no one knows? it should be stateless. right? it's just dbus and dconf calls and under the hood. [woah, that's a lot of dbus calls.](https://www.reddit.com/r/pcmasterrace/comments/elw7ah/rgb_power/) ([eheh](https://knowyourmeme.com/memes/fortune-teller)).
    * so had to install `pavucontrol` and manually set the output to the bluetooth headphones for Chrome and Firefox.
    * there's also a definitely missing feature that I have to always manually set the microphone input to the bluetooth one.
    * there are of course some open bugs for these: [1](https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/1580) [2](https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/1759) (pipewire wireplumber pipewire-pulse) oh and see this one too about how [pavucontrol works but not the control panel](https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/2011)

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

