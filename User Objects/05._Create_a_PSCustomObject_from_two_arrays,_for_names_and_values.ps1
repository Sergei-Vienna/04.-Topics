# ChatGPT Feb 13 Version. March 7, 2023 
<# Question: I have two arrays in PowerShell. Is it possible to create a PSCustomObject, 
where the values of the first array becomes the object properties, 
and the content of the second array are assigned as values of the newly defined object properties?
#>

<#Yes, it is possible to create a PSCustomObject in PowerShell where the properties of the object 
are defined by the values in one array, 
and the values of those properties are assigned from another array.

Here's an example: #>

# Define the arrays
$propertyNames = "Name", "Age", "City"
$propertyValues = "John", 30, "New York"

# Create a PSCustomObject with the properties defined by the first array
$obj = [PSCustomObject]@{}
foreach ($prop in $propertyNames) {
    $obj | Add-Member -MemberType NoteProperty -Name $prop -Value $null
}

# Assign the property values from the second array
for ($i = 0; $i -lt $propertyNames.Count; $i++) {
    $obj.$($propertyNames[$i]) = $propertyValues[$i]
}

# Display the object and its properties
$obj

<#In this example, we define two arrays $propertyNames and $propertyValues. 
The $propertyNames array contains the names of the properties we want to define for the object,
 and the $propertyValues array contains the values we want to assign to those properties. #>

<#We then create an empty PSCustomObject using the @{} syntax, and use a foreach loop to 
add properties to the object using the Add-Member cmdlet. 
The property names are defined by the values in the $propertyNames array, 
and the property values are initially set to $null. #>

<#Finally, we use a for loop to assign the property values from the $propertyValues 
array to the corresponding properties in the object. We use the property names 
as variable names inside a $() subexpression to reference the object properties dynamically. #>

<#When we display the object using Write-Output or Write-Host, we can see that it has 
been created with the specified properties and values. #>