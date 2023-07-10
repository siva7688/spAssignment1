Import-Module PnP.PowerShell
$siteURL = "https://[tenant].sharepoint.com/sites/DataSite2";
Connect-PnPOnline -Url $siteURL -Interactive
Get-PnPSiteTemplate -Out "PnP-Provisioning-File.xml"