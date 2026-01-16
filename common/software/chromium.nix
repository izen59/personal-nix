{ config, pkgs, lib, ... }:

{
  programs.chromium = {
    enable = true;
    # Applies to all Chromium-based browsers like Brave

    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh";  # Dark reader
      "nngceckbapebfimnlniiiahkandclblb";  # Bitwarden
      "mnjggcdmjocbbbhaepdhchncahnbgone";  # SponsorBlock
      "gebbhagfogifgggkldgodflihgfeippi";  # Return Youtube Dislike
    ];

    initialPrefs = {
      # Disable password manager
      "credentials_enable_service" = false;
      "password_manager_enabled" = false;
    };

    enablePlasmaBrowserIntegration = true;

    # Extra sentence case flags
    extraOpts = {
      # Telemetry off (0/false)
      MetricsReportingEnabled = false;
      DeviceMetricsReportingEnabled = false;
      HeartbeatEnabled = false;
      DeviceActivityHeartbeatEnabled = false;
      LogUploadEnabled = false;
      DeviceFlexHwDataForProductImprovementEnabled = false;
      DeviceExtensionsSystemLogEnabled = false;
      EnableDeviceGranularReporting = false;
      DeviceReportNetworkEvents = false;
      DeviceReportRuntimeCounters = false;
      DeviceReportXDREvents = false;
      ReportAppInventory = false;
      ReportAppUsage = false;
      ReportWebsiteTelemetry = false;
      ReportWebsiteActivityAllowlist = [ ];
      ReportUploadFrequency = 0;
      ReportArcStatusEnabled = false;
      ReportCRDSessions = false;
      ReportDeviceActivityTimes = false;
      ReportDeviceAppInfo = false;
      ReportDeviceAudioStatus = false;
      ReportDeviceBacklightInfo = false;
      ReportDeviceBluetoothInfo = false;
      ReportDeviceBoardStatus = false;
      ReportDeviceBootMode = false;
      ReportDeviceCpuInfo = false;
      ReportDeviceCrashReportInfo = false;
      ReportDeviceFanInfo = false;
      ReportDeviceGraphicsStatus = false;
      ReportDeviceHardwareStatus = false;
      ReportDeviceLoginLogout = false;
      ReportDeviceMemoryInfo = false;
      ReportDeviceNetworkConfiguration = false;
      ReportDeviceNetworkInterfaces = false;
      ReportDeviceNetworkStatus = false;
      ReportDeviceOsUpdateStatus = false;
      ReportDevicePeripherals = false;
      ReportDevicePowerStatus = false;
      ReportDevicePrintJobs = false;
      ReportDeviceSecurityStatus = false;
      ReportDeviceSessionStatus = false;
      ReportDeviceStorageStatus = false;
      ReportDeviceSystemInfo = false;
      ReportDeviceTimezoneInfo = false;
      ReportDeviceUsers = false;
      ReportDeviceVersionInfo = false;
      ReportDeviceVpdInfo = false;
      CloudReportingEnabled = false;
      CloudProfileReportingEnabled = false;
      CloudExtensionRequestEnabled = false;
      UserSecurityAuthenticatedReporting = false;
      UserSecuritySignalsReporting = false;

      # Privacy/Security (fixed types)
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BrowserSignin = 0;  # 0=disable
      SyncDisabled = true;
      BuiltInDnsClientEnabled = false;
      SafeBrowsingProtectionLevel = 1;
      CloudPrintSubmitEnabled = false;
      VariationReportingEnabled = false;
      SpellcheckEnabled = true;
      SpellcheckLanguage = [ "en-US" "ro-RO" ];
      DownloadRestrictions = 1;
      SpellcheckServiceEnabled = false;
      WebRtcLocalIpsAllowedUrls = [ ];
      DnsOverHttpsMode = "secure";
    };
  };
}
