Option Explicit

'�錾��
Dim STR_Movie_Path
Dim STR_Export_Path
Dim STR_Program_Path
Dim STR_Presets_File

Dim OBJ_FSO
Dim OBJ_Folder
Dim OBJ_File
Dim COL_SubFolder
Dim COL_File

'�t�H���_�̏ꏊ���`
'�X�y�[�X���������t�H���_�͂�߂Ă�������
'�t�H���_�p�X�̍Ō�ɂ͕K��\�}�[�N�����Ă�������
STR_Program_Path = "C:\Programs\"		'���̃v���O����������t�H���_
STR_Movie_Path = "C:\Movies_Folder\"	'�����悪����t�H���_
STR_Export_Path = "C:\Export_Folder\"	'�o�͐�t�H���_

Set OBJ_FSO = WScript.CreateObject("Scripting.FileSystemObject")

'���b�N�t�@�C�����Ȃ���Γ���t�H���_�ꗗ���擾���ăo�b�`�t�@�C�����쐬
If OBJ_FSO.FileExists( STR_Program_Path+"lock" ) = FALSE Then

  Set OBJ_Folder = OBJ_FSO.GetFolder(STR_Movie_Path)
  Set OBJ_File = OBJ_FSO.OpenTextFile(STR_Program_Path+"encode.bat", 2, True)

  For Each COL_File In OBJ_Folder.Files
    OBJ_File.WriteLine STR_Program_Path+"ffmpeg.exe -threads 1 -i "+""""+STR_Movie_Path+COL_File.Name+""" -deinterlace -c:v prores_aw -profile:v 2 -acodec aac -ab 192k """+STR_Export_Path+OBJ_FSO.GetBaseName(COL_File.Name)+"_prores.mov"""
  Next

  For Each COL_SubFolder In OBJ_Folder.SubFolders

    GET_FileList(COL_SubFolder)

  Next


  OBJ_File.WriteLine "del /q " + """"+STR_Program_Path+"lock"""

  OBJ_File.Close
  Set OBJ_File = Nothing

End If

Set OBJ_FSO = Nothing
