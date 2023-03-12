Reshade installation for Steam Deck on Arch Linux with Pacman

This is a small shell script that easlity installs Reshade (vkBasalt), an overlay (goverlay), and all the necessary dependencies for Steam Deck users running Arch Linux with Pacman. The script also installs Chaotic-AUR for easy installation of other programs.

To use the script:

1. Download the reshade-steamdeck.sh file to your desired directory.
2. Make the file executable by running chmod +x reshade-steamdeck.sh.
3. Run ./reshade-steamdeck.sh in the same directory as the file in the terminal.
4. After running the script, Reshade will be enabled on Steam Deck with an overlay (goverlay... set the hotkeys as needed.), and you can download all the shaders from the inside goverlay with no configuration needed (click sync). You can also use vkBasalt for additional effects.

*Note, not all shaders work, but most do. Here's a great resource to make sure your game is playable.
https://github.com/gripped/vkBasalt-working-reshade-shaders
For more information on how to configure the overlay and effects, you can refer to various tutorials on YouTube.

Here are some relevant links:

Programs that the script installs and works with on Steam Deck (likely to work on other Arch distros with Pacman enabled):

Chaotic AUR: https://aur.chaotic.cx/
vkBasalt: https://github.com/DadSchoorse/vkBasalt
goverlay: https://github.com/benjamimgois/goverlay and all needed dependencies

Hope you enjoy!
