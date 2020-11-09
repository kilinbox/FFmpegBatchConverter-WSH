Option Explicit

Const vbHide = 0             'ウィンドウを非表示
Const vbNormalFocus = 1      '通常のウィンドウ、かつ最前面のウィンドウ
Const vbMinimizedFocus = 2   '最小化、かつ最前面のウィンドウ
Const vbMaximizedFocus = 3   '最大化、かつ最前面のウィンドウ
Const vbNormalNoFocus = 4    '通常のウィンドウ、ただし、最前面にはならない
Const vbMinimizedNoFocus = 6 '最小化、ただし、最前面にはならない

'宣言部
Dim STR_Program_Path
Dim OBJ_FSO
Dim OBJ_Lock_File
Dim WshShell
Dim objExec

Set OBJ_FSO = WScript.CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
STR_Program_Path = WScript.CreateObject("WScript.Shell").CurrentDirectory + "\"

'ロックファイルがなければ動画フォルダ一覧を取得してバッチファイルを作成
If OBJ_FSO.FileExists( STR_Program_Path+"lock" ) = FALSE Then
  Set OBJ_Lock_File = OBJ_FSO.OpenTextFile(STR_Program_Path+"lock", 2, True)
  WshShell.Run "cmd /c Start /low "+STR_Program_Path+"encode.bat", vbNormalFocus, False
End If

Set OBJ_FSO = Nothing
Set WshShell = Nothing