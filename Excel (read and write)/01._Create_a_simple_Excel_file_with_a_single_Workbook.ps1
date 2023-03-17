<# ChatGPT Feb 13 Version. March 7, 2023

Is it possible by creating a PSObject in PowerShell to get the object properties names from variables?

Yes, it is possible to create a PSObject in PowerShell and dynamically set its property names using variables. Here's an example:

#>

# Create an instance of the Excel.Application class
$excel = New-Object -ComObject Excel.Application

# Hide the Excel application window
$excel.Visible = $false

# Create a new workbook
$workbook = $excel.Workbooks.Add()

# Save the workbook to a file
$ExcelFile = "C:\Users\NagaeSer\USB_for_TMW\TMW_STRUCTURE\07_PowerShell\PowerShell\Input_Output\Basic_Excel2.xlsx"
$workbook.SaveAs($ExcelFile)

# Close the workbook and Excel application
$workbook.Close()
$excel.Quit()

<#
In this example, we first create an instance of the Excel.Application class using the -ComObject parameter of the New-Object cmdlet. 
We then set the Visible property to $false to hide the Excel application window.

Next, we create a new workbook using the Add() method of the Workbooks property of the Excel object. 
We can then save the workbook to a file using the SaveAs() method, passing in the path and filename of the file we want to create.

Finally, we close the workbook and Excel application using the Close() and Quit() methods, respectively. 
This ensures that the Excel application is terminated and any resources are released.
#>