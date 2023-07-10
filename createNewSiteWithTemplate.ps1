$tenantURL = "https://[tenant]-admin.sharepoint.com"
$siteName = "[siteName]"
$siteURL = "https://[tenant].sharepoint.com/sites/"+$siteName
$TemplateXML  ="[siteTemplate location]\PnP-Provisioning-File.xml"

Connect-PnPOnline -Url $tenantURL -Interactive
New-PnPSite -Type TeamSiteWithoutMicrosoft365Group -Title $siteName -Url $siteURL -Lcid 1040
Connect-PnPOnline -Url $SiteURL -Interactive
Invoke-PnPSiteTemplate -path $TemplateXML