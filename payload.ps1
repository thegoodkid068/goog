# read in UTF8 encoded file data
$utf8 = [system.io.file]::readallbytes('C:\Users\ADMIN\Desktop\HackBrowserData\google_RAT\client\PowerShell\client.ps1');
$text = [system.text.encoding]::utf8.getstring($utf8);
# compress payload into one line
$text = $text.replace("  ","").replace("`n","").replace("`r","");
$bytes = [system.text.encoding]::utf8.getbytes($text);
# compress unicode payload using gzip
$buf = new-object system.io.memorystream;
$gzip = new-object system.io.compression.gzipstream(
    $buf,
    [system.io.compression.compressionmode]::compress);
$gzip.write($bytes, 0, $bytes.length);
$gzip.close();
# base64 encode compressed payload
[system.convert]::tobase64string($buf.toarray());
$buf.close();
