#ChatGPT. Feb 13 Version March 7, 2023.
#Create a temporary user object in PowerShell?
<#In PowerShell, you can create a temporary user object by creating an instance of the PSObject class
 and adding properties to it. Here's an example of how to create a temporary user object:
 #>

 $user = New-Object -TypeName PSObject -Property @{
    # Set the properties of the user object
    Name = "Sergei Nagaev"
    UserPrincipalName = "Sergei.Nagaev@tmw.at"
    EmailAddress = "Sergei.Nagaev@tmw.at"
    Description = "This is a test user- Me!"
    PasswordNeverExpires = $true
    Enabled = $true
}

<#In this example, we use the New-Object cmdlet to create a new PSObject object and set its properties using a hash table. 
We set the Name, EmailAddress, Description, PasswordNeverExpires, and Enabled properties.

You can then use this temporary user object to perform operations in PowerShell, such as displaying its properties or passing 
it as an argument to a function. Note that since this is a temporary object, 
it won't be saved to a directory or database like a regular user object.
#>

Write-Host $user