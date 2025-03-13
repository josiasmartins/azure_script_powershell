# warning: DONT WORK

$ResourceGroupName="wb-grp"
$AppServicePlanName="learningplan70001"
$AppName="learningapp70001"

Set-AzAppServicePlan -Name $AppServicePlanName -ResourceGroupName $ResourceGroupName -Tier Standard

New-AzWebAppSlot -Name $AppName -ResourceGroupName $ResourceGroupName -Slot "staging"

$gitrepo="https://github.com/josiasmartins/learningapp_dotnet"

$PropertiesObject = @{
    repoUrl = $gitrepo;
    branch = "master";  
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
-ResourceName $AppName/staging/web -ApiVersion 2024-04-01 -Force


Switch-AzWebAppSlot -Name $AppName -ResourceGroupName $ResourceGroupName -SourceSlotName "staging" -DestinationSlotName "production"