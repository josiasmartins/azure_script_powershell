Connect-AzAccount

$Location="North Europe"
$ResourceGroupName="web-grp"
$AppServicePlanName="learningplan70001"

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Location $Location -Tier Basic

$AppName="learningapp588787777"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName

$gitrepo="https://github.com/josiasmartins/learningapp_dotnet"

$PropertiesObject = @{
    repoUrl = $gitrepo;
    branch = "master";  
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $AppName/web -ApiVersion 2024-04-01 -Force