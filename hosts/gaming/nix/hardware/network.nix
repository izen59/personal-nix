{ config, pkgs, ... }:

{
  networking = {
    hostName = "gaming";
    firewall = {
      allowedTCPPorts = [ ];   # add per-machine exceptions (e.g., [22] for SSH)
    };
  };
}
