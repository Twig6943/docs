# Running Native Games Inside a Flatpak Environment

When attempting to run native Linux games through Flatpak, you may encounter issues where games do not launch properly due to library dependencies.

# Workaround

One effective workaround is to use a Flatpak terminal to launch the game. We recommend using [Konsole](https://flathub.org/apps/org.kde.konsole), as it offers a simple and straightforward solution.

### Steps to follow:

1. Install a terminal as a Flatpak application.

2. Add your flatpak terminal as a game to Lutris.

3. Click **Save**, and your game should now launch successfully.

# Konsole

Go to the **Game Options** tab, and set `org.kde.konsole` in the **Application** field.

In the **Arguments** field, input `-e` followed by the path to the game’s launch script.

(If you want the konsole window to stay after you're done playing the game add the `--hold` arguement before `-e`)

   For example, the launch script in my case looks like this:

   ![image](https://github.com/user-attachments/assets/8cee160b-875b-4565-b07b-83ad41afe382)

# Blackbox 

Go to the **Game Options** tab, and set `com.raggesilver.BlackBox` in the **Application** field.

In the **Arguments** field, input `-c` followed by the path to the game’s launch script.

![image](https://github.com/user-attachments/assets/eb9f2f9b-9ce6-490e-aff4-9fc27a4532f2)

<!--
(Not sure about this part)
# Info about game folders

Your game might not launch if its in a folder that contains a space,comma,exclamation mark, and stuff of that nature.
/mnt/8073657c-f7f3-4c5d-bb7e-48e43b904ec0/Games/Alien/run.sh ✅
/mnt/8073657c-f7f3-4c5d-bb7e-48e43b904ec0/Games/Alien/Alien - Isolation Collection/run.sh ❌
-->
