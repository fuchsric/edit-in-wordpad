param([string]$filename)


Add-Type -AssemblyName System.Windows.Forms
$Rtb = New-Object -TypeName System.Windows.Forms.RichTextBox;
$Rtb.Text = [System.IO.File]::ReadAllText($filename);
$Rtb.SelectAll();
$Rtb.SelectionFont = New-Object System.Drawing.Font("Times New Roman", 12, [System.Drawing.FontStyle]::Regular);
# create temporary rtf file
# if it already exists (e.g. a crash happened previously) just keep that one
if(![System.IO.File]::Exists("$filename.rtf")){
    [System.IO.File]::WriteAllText("$filename.rtf", $Rtb.Rtf);
}
& cmd /C start /W wordpad "$filename.rtf";
$Rtb.Rtf = [System.IO.File]::ReadAllText("$filename.rtf");
[System.IO.File]::WriteAllText($filename, $Rtb.Text);
Remove-Item "$filename.rtf";
