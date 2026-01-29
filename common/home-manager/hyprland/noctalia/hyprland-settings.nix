{ config, ... }:

{
    wayland.windowManager.hyprland.settings = {
        bind = [
          "SUPER, R, exec, sh -c 'noctalia-shell ipc call launcher toggle > /tmp/noctalia-ipc.out 2> /tmp/noctalia-ipc.err; echo $? > /tmp/noctalia-ipc.code'"
          "SUPER, L, exec, sh -c 'noctalia-shell ipc call lockScreen lock'"
          "SUPER, V, exec, sh -c 'noctalia-shell ipc call launcher clipboard'"
        ];

        exec-once = [
            
        ];
    };
}
