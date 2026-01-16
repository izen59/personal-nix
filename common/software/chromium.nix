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
    };
  };
}
