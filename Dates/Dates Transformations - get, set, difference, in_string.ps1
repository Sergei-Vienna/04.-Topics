$StartDate = Get-Date "01/02/2023"
$StartDate01 = '{0:yyyyMMdd}' -f (Get-Date).Adddays(-6)

$StartDate02 = (Get-Date).Adddays(-8)

$EndDate01 = '{0:yyyyMMdd}' -f (Get-Date) #"06/02/2023"
$EndDate02 = (Get-Date) #"06/02/2023"

$RangeStr = "("+[String]$StartDate + " - " + [String]$EndDate + ")"
$RangeStr_ = ($RangeStr.Replace(":",".")).Replace("/","-")