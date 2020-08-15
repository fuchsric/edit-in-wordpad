# edit-in-wordpad

Wordpad is a text-editor that comes with every installation of windows.
It is one of few programs that support Windows' Handwriting-Input, which is very comfortable for writing large amounts of natural-language text.
This text often needs to be in plaintext files like latex or markdown.

Wordpad _can_ open plaintext files, but the default formatting is horrendous, and every time you save it pops up a dialogue asking you to confirm discarding the formatting. Every. Time.

## How to use

Just drag-and-drop plaintext files onto `editinwordpat.bat`.

You can also right-click > open with > browse... and select `editinwordpat.bat`.
This gives you the option of using it later through right-click menu directly.

## How it works

The batch file just calls the powershell file for every argument.
The latter reads the file and converts it to RTF; Opens that in Wordpad (waiting until it exits); Reads the RTF and converts it back to plaintext, overwriting the original file.

Consequently:
- Hitting Ctrl+S in Wordpad doesn't actually save the file (only the temporary RTF file). The plaintext file only gets updated once Wordpad is closed. To protect against (some) data loss, the script will attempt to re-use existing RTF files if they exist.
Data loss is still possible, so quit Wordpad frequently and save your plaintext files in a versioning system. Or commit the RTF files to some non-master branch.

- The preferred font size and font face can be set in `editinwordpat.ps1`
