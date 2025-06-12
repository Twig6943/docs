# Approach 1: Using flatpak's built in containerization
### Pros
- Easy to setup

### Cons
- Only works with flatpak
- Can only be done globally, not for per-game/prefix

# Approach 2: Using AppArmor

Install AppArmor for your linux distro.

Open `/etc/default/grub` with your text editor of choice.

Locate `GRUB_CMDLINE_LINUX_DEFAULT`

Should look something like this `GRUB_CMDLINE_LINUX_DEFAULT="nowatchdog nvme_load=YES rd.luks.uuid=1789a726-8a00-4985-bf32-3a45751d5219 rd.luks.uuid=4a3498f7-9c99-4979-9b41-1a720bae32e1 resume=/dev/mapper/luks-4a3498f7-9c99-4979-9b41-1a720bae32e1"`

Add in `apparmor=1 security=apparmor`

`GRUB_CMDLINE_LINUX_DEFAULT="nowatchdog nvme_load=YES rd.luks.uuid=1789a726-8a00-4985-bf32-3a45751d5219 rd.luks.uuid=4a3498f7-9c99-4979-9b41-1a720bae32e1 resume=/dev/mapper/luks-4a3498f7-9c99-4979-9b41-1a720bae32e1" apparmor=1 security=apparmor`

Run `sudo grub-mkconfig -o /boot/grub/grub.cfg`

Restart your computer

### Pros
- Not runner specific
- Can do per-game/prefix sandbox

### Cons
- Requires tampering with the bootloader
- Requires user to restart

### Approach 3: Using SELinux
### Pros
-

### Cons
-

# Approach 4: Wine Sandboxing
### Pros
-

### Cons
- Runner specific
