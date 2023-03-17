<#ChatGPT. Feb 13 Version March 7, 2023.

Is it possible by creating a PSObject in PowerShell to get the object properties names from variables?

Yes, it is possible to create a PSObject in PowerShell and dynamically set its property names using variables. Here's an example:

#>

# Define the property names in variables
$prop1 = "Name"
$prop2 = "EmailAddress"
$prop3 = "Description"

# Create the PSObject and set its properties using the variable names
$user = New-Object -TypeName PSObject -Property @{
    $prop1 = "John Smith"
    $prop2 = "john.smith@contoso.com"
    $prop3 = "This is a temporary user"
}

# Display the user object and its properties
$user
$user | Get-Member -MemberType NoteProperty

<#
In this example, we define the property names in variables $prop1, $prop2, and $prop3. 

We then create the PSObject and use the variable names to set its properties.

Finally, we display the user object and its properties using the Get-Member cmdlet 

with the -MemberType Property parameter. This displays the property names of the object, 

which are retrieved dynamically from the variable names we defined earlier.
#>