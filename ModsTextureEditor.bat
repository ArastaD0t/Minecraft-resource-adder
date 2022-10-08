if exist mod.jar (mkdir %tmp%\mods & copy mod.jar %tmp%\mod.zip & powershell Expand-Archive -LiteralPath "%tmp%\mod.zip" -DestinationPath "%tmp%\mods" -Force & robocopy %tmp%\mods /e) 




if exist "C:\Sandbox\Danny\DefaultBox\drive\C\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe" ("C:\Program Files\Sandboxie-Plus\Start.exe" /box:DefaultBox "C:\Sandbox\Danny\DefaultBox\drive\C\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe" pack.png ) else mspaint pack.png

