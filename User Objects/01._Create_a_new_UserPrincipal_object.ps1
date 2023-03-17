#ChatGPT. Feb 13 Version March 7, 2023. Directly doesn't work

#Create aan user object in PowerShell?

<#
In PowerShell, you can create a user object using the New-Object cmdlet and the System.DirectoryServices.AccountManagement.UserPrincipal class 
from the System.DirectoryServices.AccountManagement namespace.

Here's an example of how to create a user object:
#>

# Import the System.DirectoryServices.AccountManagement namespace
Add-Type -AssemblyName System.DirectoryServices.AccountManagement

# Create a new UserPrincipal object
$user = New-Object System.DirectoryServices.AccountManagement.UserPrincipal([System.DirectoryServices.AccountManagement.PrincipalContext]::Machine)

# Set the properties of the user object
$user.Name = "Sergei Nagaev"
$user.UserPrincipalName = "Sergei.Nagaev@tmw.at"
$user.EmailAddress = "Sergei.Nagaev@tmw.at"
$user.Description = "This is a test user- Me!"
$user.PasswordNeverExpires = $true
$user.Enabled = $true

# Save the user object
$user.Save()


<#
In this example, we first import the System.DirectoryServices.AccountManagement namespace using the Add-Type cmdlet.

Then we create a new UserPrincipal object using the New-Object cmdlet and passing in the System.DirectoryServices.AccountManagement.PrincipalContext enum value Machine, 
which specifies that we want to create a user object on the local machine.

Next, we set the properties of the user object using the dot notation.
In this example, we set the name, user principal name (UPN), email address, description, password never expires, and enabled properties.

Finally, we save the user object using the Save() method.
#>

<#
New-Object : A constructor was not found. Cannot find an appropriate constructor for type System.DirectoryServices.AccountManagement.UserPrincipal.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:15 char:9
+ $user = New-Object System.DirectoryServices.AccountManagement.UserPri ...
+         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (:) [New-Object], PSArgumentException
    + FullyQualifiedErrorId : CannotFindAppropriateCtor,Microsoft.PowerShell.Commands.NewObjectCommand
 
The property 'Name' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:18 char:1
+ $user.Name = "Sergei Nagaev"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
The property 'UserPrincipalName' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:19 char:1
+ $user.UserPrincipalName = "Sergei.Nagaev@tmw.at"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
The property 'EmailAddress' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:20 char:1
+ $user.EmailAddress = "Sergei.Nagaev@tmw.at"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
The property 'Description' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:21 char:1
+ $user.Description = "This is a test user- Me!"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
The property 'PasswordNeverExpires' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:22 char:1
+ $user.PasswordNeverExpires = $true
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
The property 'Enabled' cannot be found on this object. Verify that the property exists and can be set.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:23 char:1
+ $user.Enabled = $true
+ ~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyNotFound
 
You cannot call a method on a null-valued expression.
At C:\Users\NagaeSer\Topics\02. Computing\02. Systems\06. System Programming\01. PowerShell\04. Code\01. Examples\04. Topics\User Objects\01._Create_a_new_UserPrincipal_object.ps1:26 char:1
+ $user.Save()
+ ~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvokeMethodOnNull
 
#>