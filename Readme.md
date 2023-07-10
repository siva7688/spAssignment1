**Approach for applying this template on demand via Azure**
    - Create an Azure App Registration and generate a secret. secure the secret in keyvault
    - add the API permissions and select SharePoint and choose all the Application permissions
    - add another API Permissions and select Graph and choose all the Application permissions
    - Get the admin consent for the permissions to reflect.
    - Create an Azure Runbook or Azure Function app with PowerShell Platform and run the scripts 
    - make the following change to work for authentication via function app or runbook.
      Connect-PnPOnline [tenant].sharepoint.com -ClientId [clientid] -Tenant [tenant].onmicrosoft.com -CertificateBase64Encoded $encodedPfx

**Approach for integrating a solution into other systems say PowerPlatform**:

  - Create a Micorsoft Form and request the user about the site Details and site owner details.
  - Store the data into one of the SharePoint sites or can use other databases for reference purposes
  - Create a Logic App/ Power Automate flow (in same tenant) to read the data from the databases.
  - Can add a step for approval from request user's Manager.
  - Once the Manager Approves the flow. then call the Azure function app end point to run the provisioning script.
  - This Azure function app call require an Azure App Registration. with the delegated access tor un Azure Serivces.
