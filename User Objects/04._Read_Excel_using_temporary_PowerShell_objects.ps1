cls
$File = "C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\02. Play\Input\Test_Excel_File_Short.xlsx"
$WorkSheetName = "Input"  
$Excel = New-Object -ComObject Excel.Application  
$WorkBook = $Excel.Workbooks.Open($File)  
$WorkSheet = $WorkBook.Worksheets.Item($WorkSheetName)  
$UsedRange = $WorkSheet.UsedRange  
$Rows = $UsedRange.Rows.Count  
$Columns = $UsedRange.Columns.Count  

$TitleRow = 1

$Titels = @()

function create_empty_Object([Parameter(Mandatory=$true)]
                [string[]]$propertyNames)
            {
            $obj = [PSCustomObject]@{}
            foreach ($prop in $propertyNames) {$obj | Add-Member -MemberType NoteProperty -Name $prop -Value $null}
            return $obj
            }


function get_Row(
                [Parameter(Mandatory=$true)]
                [int]$Row,
                [Parameter(Mandatory=$false)]
                [string[]]$Titles)
    {
    $Output = @()

    if ($Titles -ne $null)
            {

            $Output = create_empty_Object -propertyNames $Titles

            for($Column=1; $Column -le $Columns; $Column++)
                {  
                 $Output.$($Titles[$Column-1]) = $UsedRange.Cells($Row,$Column).Text
                }
            }       
            
      else
            {
            for($Column=1; $Column -le $Columns; $Column++)
                {  
                $Output +=  $UsedRange.Cells($Row,$Column).Text
                Write-Host $Output
                }
            }

     return $Output

}

$Titles = get_Row -Row $TitleRow

$Objs = @()  
for($Row=2; $Row -le $Rows; $Row++)
    {  
    $Objs += get_Row -Row $Row -Titles $Titles
    }   
  

Write-Host $Objs

$WorkBook.Close()

#And quit the Excel application:
#$Excel.Quit()

[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null  
#Stop-Process -Name "EXCEL"  

