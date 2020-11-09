Option Explicit

'宣言部
Dim STR_Movie_Path
Dim STR_Export_Path
Dim STR_Program_Path
Dim STR_Presets_File

Dim OBJ_XML
Dim OBJ_FSO
Dim OBJ_Folder
Dim OBJ_File
Dim COL_SubFolder
Dim COL_File

Set OBJ_XML = WScript.CreateObject("MSXML2.DOMDocument")
OBJ_XML.load("setting.xml")

'フォルダの場所を定義
STR_Program_Path = WScript.CreateObject("WScript.Shell").CurrentDirectory + "\"
STR_Movie_Path = OBJ_XML.getElementsByTagName("Movie_Path").Item(0).firstChild.nodeValue
STR_Export_Path = OBJ_XML.getElementsByTagName("Export_Path").Item(0).firstChild.nodeValue

STR_Presets_File = "libx264.ffpreset"
Set OBJ_FSO = WScript.CreateObject("Scripting.FileSystemObject")

'ロックファイルがなければ動画フォルダ一覧を取得してバッチファイルを作成
If OBJ_FSO.FileExists( STR_Program_Path+"lock" ) = FALSE Then

  Set OBJ_Folder = OBJ_FSO.GetFolder(STR_Movie_Path)
  Set OBJ_File = OBJ_FSO.OpenTextFile(STR_Program_Path+"encode.bat", 2, True)

  For Each COL_File In OBJ_Folder.Files
    OBJ_File.WriteLine STR_Program_Path+"ffmpeg.exe -threads 1 -i "+""""+STR_Movie_Path+COL_File.Name+""" -fpre """+STR_Presets_File+""" -vcodec libx264 -vf yadif=0:-1:1 -ar 44100 -ab 128k -ac 2 -vol 256 """+STR_Export_Path+OBJ_FSO.GetBaseName(COL_File.Name)+".mp4"""
  Next

  For Each COL_SubFolder In OBJ_Folder.SubFolders

    GET_FileList(COL_SubFolder)

  Next


  OBJ_File.WriteLine "del /q " + """"+STR_Program_Path+"lock"""

  OBJ_File.Close
  Set OBJ_File = Nothing

End If

Set OBJ_FSO = Nothing