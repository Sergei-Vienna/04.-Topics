
# ChatGPT Feb 13 Version. March 7, 2023.

#PowerShell read from and write to an excel file?


<#Yes, PowerShell can read from and write to an Excel file using the Excel COM object. Here's an example of how to do it:

First, you need to create an instance of the Excel application using the New-Object cmdlet:
#>


$excel = New-Object -ComObject Excel.Application

#Next, you need to open the Excel file you want to read or write to:

$ExcelFile = "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\PowerShell\Input_Output\Basic_Excel.xlsx"

$workbook = $excel.Workbooks.Open($ExcelFile)

#To read data from a worksheet, you can use the following code:


$worksheet = $workbook.Worksheets.Item(1) # get the first worksheet
$data = @() # initialize an empty array to store the data
$row = 1 # start at the first row
$col = 1 # start at the first column

while ($worksheet.Cells.Item($row,$col).Value2) {
    $cellValue = $worksheet.Cells.Item($row,$col).Value2
    $data += $cellValue
    $row++
}

#This code reads data from the first worksheet, starting at the first row and column and continuing until it reaches a cell with no value. 
#It stores the data in an array called $data.

$worksheet = $workbook.Worksheets.Item(1) # get the first worksheet
$data = @("foo", "bar", "baz") # the data to write
$row = 1 # start at the first row
$col = 1 # start at the first column

foreach ($value in $data) {
    $worksheet.Cells.Item($row,$col).Value2 = $value
    $row++
}

#This code writes data to the first worksheet, starting at the first row and column and continuing until it has written all the data in the $data array.

#Finally, you need to save and close the workbook:

$workbook.Save()
$workbook.Close()

#And quit the Excel application:
$excel.Quit()

[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Excel) | Out-Null  
Stop-Process -Name "EXCEL"  
