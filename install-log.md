2023-10-28

  * ASUS STRIX ROG B450-F GAMING motherboard, USB layout .. interestingly the 10G bus is not on the backside :o

  * kernel version Linux 6.5.0-10-generic #10-Ubuntu SMP PREEMPT_DYNAMIC Fri Oct 13 13:49:38 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

    the Logitech Brio works with ffplay /dev/video0 (is this a defeat of the "fancy SLR as webcam" project? so-so, at least the Canon EOS M50 Mark I is no bueno, because after 30m it needs a touch .. at least on Linux :D)

    I'm pasting the usb tree, because in a different setup the whole thing burnt down (half the ports stopped ... strange errors like `Failed to query (GET_INFO) UVC control 7 on unit 3: -110 (exp. 1)` (110 is timeout), `usb 2-2: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.`, though I'm still getting errors like `kwin_libinput: Libinput: event5  - Logitech G502 HERO Gaming Mouse: client bug: event processing lagging behind by 38ms, your system is too slow`, ... I disabled something something USB legacy whatever in the BIOS, might have helped ... others also mentioned that the USB 3.1 port didn't work, but the 3.0 did)

    ```    
    usb 2-2: Found UVC 1.00 device Logi 4K Stream Edition (046d:086b)
    uvcvideo 2-2:1.2: Failed to set UVC probe control : -110 (exp. 26).
    usb 2-2: Failed to query (GET_CUR) UVC control 13 on unit 1: -110 (exp. 8).
    ```

    now it works without UVC errors ...

    ```
    usb 4-3: Found UVC 1.00 device Logi 4K Stream Edition (046d:086b)
    usb 4-1: Found UVC 1.00 device Logi 4K Stream Edition (046d:086b)
    ```

    

    https://webcamtests.com/ detects two of it, which is interesting, but at least it works well in 1920x1080 30fps.
    

    ```
    # v4l2-compliance 
    v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
    
    Compliance test for uvcvideo device /dev/video0:
    
    Driver Info:
            Driver name      : uvcvideo
            Card type        : Logi 4K Stream Edition
            Bus info         : usb-0000:0b:00.3-3
            Driver version   : 6.5.3
            Capabilities     : 0x84a00001
                    Video Capture
                    Metadata Capture
                    Streaming
                    Extended Pix Format
                    Device Capabilities
            Device Caps      : 0x04200001
                    Video Capture
                    Streaming
                    Extended Pix Format
    Media Driver Info:
            Driver name      : uvcvideo
            Model            : Logi 4K Stream Edition
            Serial           : 165FB720
            Bus info         : usb-0000:0b:00.3-3
            Media version    : 6.5.3
            Hardware revision: 0x00000317 (791)
            Driver version   : 6.5.3
    Interface Info:
            ID               : 0x03000002
            Type             : V4L Video
    Entity Info:
            ID               : 0x00000001 (1)
            Name             : Logi 4K Stream Edition
            Function         : V4L2 I/O
            Flags            : default
            Pad 0x0100000d   : 0: Sink
              Link 0x02000029: from remote pad 0x1000010 of entity 'Processing 3' (Video Pixel Formatter): Data, Enabled, Immutable
    
    Required ioctls:
            test MC information (see 'Media Driver Info' above): OK
            test VIDIOC_QUERYCAP: OK
            test invalid ioctls: OK
    
    Allow for multiple opens:
            test second /dev/video0 open: OK
            test VIDIOC_QUERYCAP: OK
            test VIDIOC_G/S_PRIORITY: OK
            test for unlimited opens: OK
    
    Debug ioctls:
            test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
            test VIDIOC_LOG_STATUS: OK (Not Supported)
    
    Input ioctls:
            test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
            test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
            test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
            test VIDIOC_ENUMAUDIO: OK (Not Supported)
            test VIDIOC_G/S/ENUMINPUT: OK
            test VIDIOC_G/S_AUDIO: OK (Not Supported)
            Inputs: 1 Audio Inputs: 0 Tuners: 0
    
    Output ioctls:
            test VIDIOC_G/S_MODULATOR: OK (Not Supported)
            test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
            test VIDIOC_ENUMAUDOUT: OK (Not Supported)
            test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
            test VIDIOC_G/S_AUDOUT: OK (Not Supported)
            Outputs: 0 Audio Outputs: 0 Modulators: 0
    
    Input/Output configuration ioctls:
            test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
            test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
            test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
            test VIDIOC_G/S_EDID: OK (Not Supported)
    
    Control ioctls (Input 0):
                    fail: v4l2-test-controls.cpp(206): no V4L2_CID_PRIVATE_BASE allowed
            test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
                    fail: v4l2-test-controls.cpp(352): node->controls.find(qctrl.id) == node->controls.end()
            test VIDIOC_QUERYCTRL: FAIL
            test VIDIOC_G/S_CTRL: OK
            test VIDIOC_G/S/TRY_EXT_CTRLS: OK
            test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
            test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
            Standard Controls: 19 Private Controls: 0
    
    Format ioctls (Input 0):
            test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
            test VIDIOC_G/S_PARM: OK
            test VIDIOC_G_FBUF: OK (Not Supported)
            test VIDIOC_G_FMT: OK
            test VIDIOC_TRY_FMT: OK
                    warn: v4l2-test-formats.cpp(1046): Could not set fmt2
            test VIDIOC_S_FMT: OK
            test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
            test Cropping: OK (Not Supported)
            test Composing: OK (Not Supported)
            test Scaling: OK (Not Supported)
    
    Codec ioctls (Input 0):
            test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
            test VIDIOC_G_ENC_INDEX: OK (Not Supported)
            test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
    
    Buffer ioctls (Input 0):
            test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
            test VIDIOC_EXPBUF: OK
            test Requests: OK (Not Supported)
    
    Total for uvcvideo device /dev/video0: 46, Succeeded: 44, Failed: 2, Warnings: 1
    ```
    
    ```
    #  lsusb -v -t
    /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
        ID 1d6b:0003 Linux Foundation 3.0 root hub
        |__ Port 3: Dev 2, If 0, Class=Video, Driver=uvcvideo, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
        |__ Port 3: Dev 2, If 1, Class=Video, Driver=uvcvideo, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
        |__ Port 3: Dev 2, If 2, Class=Video, Driver=uvcvideo, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
        |__ Port 3: Dev 2, If 3, Class=Audio, Driver=snd-usb-audio, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
        |__ Port 3: Dev 2, If 4, Class=Audio, Driver=snd-usb-audio, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
        |__ Port 3: Dev 2, If 5, Class=Human Interface Device, Driver=usbhid, 5000M
            ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
    /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
        ID 1d6b:0002 Linux Foundation 2.0 root hub
        |__ Port 1: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
            ID 096e:085a Feitian Technologies, Inc. 
        |__ Port 2: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
            ID 046d:c33a Logitech, Inc. G413 Gaming Keyboard
        |__ Port 2: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
            ID 046d:c33a Logitech, Inc. G413 Gaming Keyboard
    /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
        ID 1d6b:0003 Linux Foundation 3.0 root hub
    /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
        ID 1d6b:0002 Linux Foundation 2.0 root hub
        |__ Port 1: Dev 2, If 0, Class=Wireless, Driver=btusb, 12M
            ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)
        |__ Port 1: Dev 2, If 1, Class=Wireless, Driver=btusb, 12M
            ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)
        |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=rtw_8822bu, 480M
            ID 0b05:19aa ASUSTek Computer, Inc. 
        |__ Port 5: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
            ID 046d:c08b Logitech, Inc. G502 SE HERO Gaming Mouse
        |__ Port 5: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid, 12M
            ID 046d:c08b Logitech, Inc. G502 SE HERO Gaming Mouse
        |__ Port 6: Dev 5, If 0, Class=Audio, Driver=snd-usb-audio, 12M
            ID 145f:02d9 Trust 
        |__ Port 6: Dev 5, If 1, Class=Audio, Driver=snd-usb-audio, 12M
            ID 145f:02d9 Trust 
        |__ Port 6: Dev 5, If 2, Class=Human Interface Device, Driver=usbhid, 12M
            ID 145f:02d9 Trust 
    ```

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

