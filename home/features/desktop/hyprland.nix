{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {

  options.features.desktop.hyprland.enable = mkEnableOption "Hyprland";

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {

#        monitor = "eDP-1,2560x1440,0x0,1.6";
        monitor = "eDP-1,2560x1440,0x0,1";

        exec-once = [
          "waybar"
          "hyprpaper"
          "hypridle"
        ];

        env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct"
        ];

        input = {
          kb_layout = "us";
          kb_variant = "dvorak";
          kb_model = "";
          kb_options = "compose:caps";
          kb_rules = "";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = false;
          };

          sensitivity = 0;
        };

        general = {
          gaps_in = 2;
          gaps_out = 5;
          border_size = 1;
          "col.active_border" = "rgb(0080ff) rgb(0080ff) rgb(ff8000) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
          allow_tearing = false;
        };

        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 8;
            passes = 1;
          };
 
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

        };
  
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
  
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };
  
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
  
        master = {
          new_status = true;
        };
  
        gestures = {
          workspace_swipe = false;
        };
  
        windowrulev2 = [
          "suppressevent maximize, class:.*"
        ];
  
        "$mainMod" = "SUPER";
  
        bind = [
          "$mainMod, return, exec, kitty"
          "$mainMod, C, killactive,"
          "$mainMod, M, exit,"
          #"$mainMod, E, exec, dolphin"
          "$mainMod, E, exec, rofi --show emoji"
          "$mainMod, V, togglefloating,"
          "$mainMod, R, exec, rofi -show drun"
          "ALT, Tab, exec, rofi -show window"
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1`"
        ];
  
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
  
      };
    };
  };
}
