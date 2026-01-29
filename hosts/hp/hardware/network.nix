{ config, pkgs, ... }:

{
  networking = {
    hostName = "hp";  # unique to each host
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];   # add per-machine exceptions (e.g., [22] for SSH)
    };
  };
}
