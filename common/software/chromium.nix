{ config, pkgs, lib, ... }:

{
  programs.chromium = {
    enable = true;
    enablePlasmaBrowserIntegration = true;
    # Applies to all Chromium-based browsers like Brave

    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"  # Dark reader
      "nngceckbapebfimnlniiiahkandclblb"  # Bitwarden
      "mnjggcdmjocbbbhaepdhchncahnbgone"  # SponsorBlock
      "gebbhagfogifgggkldgodflihgfeippi"  # Return Youtube Dislike
    ];

    initialPrefs = {
      # Disable password manager
      "credentials_enable_service" = false;
      "password_manager_enabled" = false;
    };

    # Extra sentence case flags
    extraOpts = {
      # Remaining essential policies (errors fixed, telemetry removed)
      MetricsReportingEnabled = false;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BrowserSignin = 0;
      SyncDisabled = true;
      SafeBrowsingProtectionLevel = 1;
      SpellcheckEnabled = true;
      SpellcheckLanguage = [ "en-US" "ro-RO" ];
      DownloadRestrictions = 1;
      WebRtcLocalIpsAllowedUrls = [ ];
      DnsOverHttpsMode = "secure";  # Force DoH (no fallback to system DNS)
      DnsOverHttpsTemplates = "https://dns.quad9.net/dns-query";  # Quad9

      # Brave-specific policies
      TorDisabled = 0;  # Keep Tor enabled
      BraveRewardsDisabled = 1;  # Disable crypto rewards
      BraveWalletDisabled = 1;  # Disable web3/crypto wallet
      BraveVPNDisabled = 1;  # Disable built-in VPN (use your own)
      BraveAIChatEnabled = 0;  # Disable AI chat
      BraveNewsDisabled = 1;  # Disable news feed
      BraveTalkDisabled = 1;  # Disable video call feature
      BraveSpeedreaderEnabled = 1;  # Keep Speedreader enabled
      BraveWaybackMachineEnabled = 1;  # Keep Wayback integration
      BraveP3AEnabled = 0;  # Disable privacy-preserving analytics
      BraveStatsPingEnabled = 0;  # Disable stats telemetry
      BraveWebDiscoveryEnabled = 0;  # Disable web discovery
      BravePlaylistEnabled = 0;  # Disable playlist feature

      # Bookmarks
      EditBookmarksEnabled = true;
      ManagedBookmarks = [
        {
          toplevel_name = "Managed Bookmarks";
        }
        {
          name = "Proxmox";
          url = "http://homelab:8006/";
        }
        {
          name = "ZM";
          url = "http://zoneminder:8095/";
        }
        {
          name = "AdGuard";
          url = "http://adguard:3000/";
        }
        {
          name = "Grafana";
          url = "http://grafana:3000/";
        }
        {
          name = "OMV";
          url = "http://openmediavault/";
        }
        {
          name = "qBittorrent";
          url = "http://arr:8080/";
        }
        {
          name = "Jellyseerr";
          url = "http://arr:5055/";
        }
        {
          name = "Sonarr";
          url = "http://arr:8989/";
        }
        {
          name = "Radarr";
          url = "http://arr:7878/";
        }
        {
          name = "Prowlarr";
          url = "http://arr:9696/";
        }
        {
          name = "Others";
          children = [
            {
              name = "Free Download Books";
              url = "https://oceanofpdf.com/";
            }
            {
              name = "SquidWTF";
              url = "https://eu.qobuz.squid.wtf/";
            }
            {
              name = "Anna's Archive";
              url = "https://annas-archive.org/";
            }
            {
              name = "FMHY Audio";
              url = "https://fmhy.net/audiopiracyguide#audio-ripping-sites";
            }
            {
              name = "LMSys Chatbot Arena";
              url = "https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard";
            }
            {
              name = "--GUIDE--";
              url = "https://rentry.org/voldy";
            }
            {
              name = "Etcher broke my USB stick";
              url = "https://forums.balena.io/t/etcher-broke-my-usb-stick-or-did-it/340169/61";
            }
            {
              name = "Fedora + Nvidia + Secure Boot";
              url = "https://www.reddit.com/r/Fedora/comments/18bj1kt/fedora_nvidia_secure_boot/?share_id=OeTmclcTfTHF_xuqGUqx2";
            }
            {
              name = "NTFS with Linux + Windows";
              url = "https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows#preventing-ntfs-read-errors";
            }
            {
              name = "Redact";
              url = "https://redact.dev/";
            }
            {
              name = "DLSS on Heroic";
              url = "https://www.reddit.com/r/linux_gaming/comments/rpzfbn/dlss_ray_tracing_not_working_on_heroic_games/";
            }
            {
              name = "Debian Sid safely";
              url = "https://linuxconfig.org/how-to-run-debian-sid-relatively-safely";
            }
            {
              name = "Telemetry.md";
              url = "https://gist.github.com/ave9858/a2153957afb053f7d0e7ffdd6c3dcb89";
            }
            {
              name = "lucida";
              url = "https://lucida.to/";
            }
            {
              name = "Fluent-kde";
              url = "https://github.com/vinceliuice/Fluent-kde";
            }
            {
              name = "Papirus Icons";
              url = "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/?tab=readme-ov-file#papirus-installer";
            }
            {
              name = "Pipewire Guide";
              url = "https://forum.endeavouros.com/t/pipewire-guide-audio-crackling-popping-and-latency/69602";
            }
            {
              name = "Drawing Tablets on Wayland";
              url = "https://artonwayland.redstrate.com/";
            }
            {
              name = "ktabletconfig GitLab";
              url = "https://invent.kde.org/redstrate/ktabletconfig";
            }
            {
              name = "DE Comparison";
              url = "https://eylenburg.github.io/de_comparison.htm";
            }
          ];
        }
      ];

    };
  };
}
