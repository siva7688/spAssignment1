$tenantURL = "https://[tenant]-admin.sharepoint.com"
$TemplateXML  ="[siteTemplate location]\PnP-Provisioning-File.xml"

Connect-PnPOnline -Url $tenantURL -Interactive
$SiteCollections = Get-PnPTenantSite | Where-Object -Property Template -NotIn ("SRCHCEN#0", "REDIRECTSITE#0", "SPSMSITEHOST#0", "APPCATALOG#0", "POINTPUBLISHINGHUB#0", "EDISC#0", "STS#-1")
    
#Loop through each site collection
for($i=0; $i -lt 10000 || $i -lt $SiteCollections.count ; $i++)
{
    $siteURL = $SiteCollections[$i]._Url
    Connect-PnPOnline -Url $SiteURL -Interactive
    Invoke-PnPSiteTemplate -path $TemplateXML
}