<#
Developed by: Satyajit
Developed on: 9:31 PM 20-07-2019
Version: 1.0
THis script allows to list out the selective sub-licenses of bulk users

#Reference taken from:
https://ryentang.wordpress.com/2017/06/08/obtaining-licenses-and-service-status-using-msonline-powershell-]module/

#Testing one-liner, but isn't working out. Too complex to be put or static\not reliable to use AssignedPlans[0]
Get-AzureADUser -SearchString satyajit.arora@contoso.com | select UserPrincipalName,@{Name="Exchange";Expression={$_ | ?{$_.Service -eq 'Exchange'} | $_.AssignedPlans.CapabilityStatus}}


(Get-MsolUser -UserPrincipalName belindan@litwareinc.com).Licenses.ServiceStatus

#Run this to get the sublicense names
(Get-AzureADUser -SearchString satyajit.arora@contoso.com).AssignedPlans
AssignedTimestamp      CapabilityStatus Service               ServicePlanId
-----------------      ---------------- -------               -------------
14-03-2019 10:31:45 AM Enabled          Exchange              33c4f319-9bdd-48d6-9c4d-410b750a4a5a
14-05-2018 7:47:14 PM  Enabled          MicrosoftStream       9e700747-8b1d-45e5-ab8d-ef187ceec156
26-11-2017 5:01:15 PM  Deleted          OfficeForms           2789c901-c14e-48ab-a76a-be334d9d793a
03-10-2017 4:01:17 PM  Enabled          SCO                   c1ec4a95-1f05-45b3-a911-aa3fa01094f5
31-08-2017 5:37:27 PM  Enabled          SharePoint            e95bec33-7c88-4a70-8e19-b10bd9d0c014
31-08-2017 5:37:27 PM  Enabled          SharePoint            5dbe027f-2339-4123-9542-606e4d348a72
04-04-2017 6:08:32 PM  Enabled          ProcessSimple         76846ad7-7776-4c40-a281-a386362dd1b9
04-04-2017 6:08:32 PM  Enabled          Deskless              8c7d2df8-86f0-4902-b2ed-a0458298f3b3
04-04-2017 6:08:32 PM  Enabled          TeamspaceAPI          57ff2da0-773e-42df-b2af-ffb7a2317929
04-04-2017 6:08:32 PM  Enabled          PowerAppsService      c68f8d98-5534-41c8-bf36-22fa496fa792
25-07-2016 8:02:10 PM  Enabled          Exchange              efb87545-963c-4e0d-99df-69c6916d9eb0
25-07-2016 8:02:10 PM  Enabled          ProjectWorkManagement b737dad2-2f6c-4c65-90e3-ca563267e8b9
25-07-2016 8:02:10 PM  Enabled          Sway                  a23b959c-7ce8-4e57-9140-b90eb88a9e97
25-07-2016 8:02:10 PM  Enabled          YammerEnterprise      7547a3fe-08ee-4ccb-b430-5077c5041653



.EXAMPLE
PS C:\Users\Satyajit\Scripts> gc users.txt
satyajit.kurmam@contoso.com
satyajit.arora@contoso.com


PS C:\Users\Satyajit\Scripts>  .\Get-AzureADUserLicense.ps1
UserPrincipalName,Exchange,SharePoint
satyajit.kurmam@contoso.com,Enabled,Enabled
satyajit.arora@contoso.com,Enabled,Enabled



#>
#####Script starts here#######

#Install-Module -Name AzureAD -Force
#Connect-AzureAD

#For testing single user
#$Msolusers = Get-AzureADUser -SearchString satyajit.arora@contoso.com | select UserPrincipalName

#Pull all users in the script itself
#$Msolusers = Get-AzureADUser -All | select UserPrincipalName

#Selective input userprincipalname
$Msolusers = gc users.txt

#Header - Add more sublicenses as required
"UserPrincipalName,Exchange,SharePoint"

foreach($Msoluser in $Msolusers)
{

#Single user or all users object input
#$user = Get-AzureADUser -SearchString $Msoluser.UserPrincipalName 

#Selective input userprincipalname from text input
$user = Get-AzureADUser -SearchString $Msoluser 

#$user.UserPrincipalName
$userAPs = $user.AssignedPlans

foreach($userAP in $userAPs)
{

switch ($userAP.Service) 
{
 'Exchange' 
 {
  $Exchangevalue = $userAP.CapabilityStatus
 }

 'SharePoint' 
 {
  $SharePointvalue = $userAP.CapabilityStatus
 }

 #Add more sublicenses as required

}#switchends

}#forends

#Values - Add more sublicenses as required
"$($user.UserPrincipalName),$Exchangevalue,$SharePointvalue"

}


#####Script ends here#######

#This can be used to quickly export the data to csv
#.\Get-AzureADUserLicense.ps1 | Out-File Licenses.csv