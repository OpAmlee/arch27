Vim�UnDo� <�b�Zߛ�"�*��Fo������ni���  �   Z  xmproc2 <- spawnPipe ("xmobar -x 2 $HOME/.config/xmobar/" ++ colorScheme ++ "-xmobarrc")  �   3                       b��    _�                     S       ����                                                                                                                                                                                                                                                                                                                                                             b���     �   R   T  �      import Colors.DoomOne5��    R                    -                    5�_�                    V   8    ����                                                                                                                                                                                                                                                                                                                                                             b���     �   U   W  �      UmyFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"5��    U   7                 �                    5�_�                    \       ����                                                                                                                                                                                                                                                                                                                                                             b���     �   [   ]  �      4myTerminal = "alacritty"    -- Sets default terminal5��    [          	                	              5�_�                    _       ����                                                                                                                                                                                                                                                                                                                                                             b���     �   ^   `  �      :myBrowser = "qutebrowser "  -- Sets qutebrowser as browser5��    ^                    a                    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             b��(     �   �   �  �      8  spawnOnce "xargs xwallpaper --stretch < ~/.cache/wall"5��    �                     �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             b��5     �   �   �  �      q  -- spawnOnce "feh --randomize --bg-fill /usr/share/backgrounds/dtos-backgrounds/*"  -- feh set random wallpaper5��    �                                          �    �                                          5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             b��<    �   �   �  �      o   spawnOnce "feh --randomize --bg-fill /usr/share/backgrounds/dtos-backgrounds/*"  -- feh set random wallpaper5��    �                                         �    �                                          5�_�      	             �        ����                                                                                                                                                                                                                                                                                                                                                             b�ȗ     �  �  �  �      bmyWorkspaces = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]5��    �                      =                     5�_�      
           	  �       ����                                                                                                                                                                                                                                                                                                                                                             b�ș     �  �  �  �      d--myWorkspaces = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]5��    �                    "=                     5�_�   	              
  �       ����                                                                                                                                                                                                                                                                                                                                                             b�Ȝ     �  �  �  �      Q-- myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]5��    �                     �<                     5�_�   
                �       ����                                                                                                                                                                                                                                                                                                                                                             b��    �  �  �  �      7  , ("M-S-c", addName "Kill focused window"    $ kill1)5��    �                   �I                    5�_�                   �        ����                                                                                                                                                                                                                                                                                                                                                             b��|     �  �  �  �      O myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]5��    �                     �<                     5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             b�ɀ    �  �  �  �      e-- myWorkspaces = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]5��    �                      =                     5�_�                   �       ����                                                                                                                                                                                                                                                                                                                                                             b�ɽ    �  �  �  �      c myWorkspaces = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]5��    �                      =                     5�_�                   �   3    ����                                                                                                                                                                                                                                                                                                                                                             b��     �  �  �  �      Z  xmproc0 <- spawnPipe ("xmobar -x 0 $HOME/.config/xmobar/" ++ colorScheme ++ "-xmobarrc")5��    �  3                  �x                     5�_�                   �   3    ����                                                                                                                                                                                                                                                                                                                                                             b��     �  �  �  �      Z  xmproc1 <- spawnPipe ("xmobar -x 1 $HOME/.config/xmobar/" ++ colorScheme ++ "-xmobarrc")5��    �  3                  8y                     �    �  8                 =y                    5�_�                    �   3    ����                                                                                                                                                                                                                                                                                                                                                             b��    �  �  �  �      Z  xmproc2 <- spawnPipe ("xmobar -x 2 $HOME/.config/xmobar/" ++ colorScheme ++ "-xmobarrc")5��    �  3                  �y                     5��