# Conecta na conta  azure
# Connect-AzAccount

$Location="North Europe"
$ResourceGroupName="web-grp"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

$AppServicePlanName="learningplan7000"

# Cria o App service plan
New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Location $Location -Tier Free

$ApppName="learningapp58878777"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $ApppName `
-AppServicePlan $AppServicePlanName