{ config, pkgs, lib, ... }:

{
  programs.chromium = {
    enable = true;
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

    enablePlasmaBrowserIntegration = true;

    # Extra sentence case flags
    extraOpts = {
      # Remaining essential policies (errors fixed, telemetry removed)
      MetricsReportingEnabled = false;
    
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BrowserSignin = 0;
      SyncDisabled = true;
      BuiltInDnsClientEnabled = false;
      SafeBrowsingProtectionLevel = 1;
      SpellcheckEnabled = true;
      SpellcheckLanguage = [ "en-US" "ro-RO" ];
      DownloadRestrictions = 1;
      WebRtcLocalIpsAllowedUrls = [ ];
      DnsOverHttpsMode = "secure";
    };
  };
}
