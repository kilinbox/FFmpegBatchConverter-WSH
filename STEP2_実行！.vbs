Option Explicit

Const vbHide = 0             '�E�B���h�E���\��
Const vbNormalFocus = 1      '�ʏ�̃E�B���h�E�A���őO�ʂ̃E�B���h�E
Const vbMinimizedFocus = 2   '�ŏ����A���őO�ʂ̃E�B���h�E
Const vbMaximizedFocus = 3   '�ő剻�A���őO�ʂ̃E�B���h�E
Const vbNormalNoFocus = 4    '�ʏ�̃E�B���h�E�A�������A�őO�ʂɂ͂Ȃ�Ȃ�
Const vbMinimizedNoFocus = 6 '�ŏ����A�������A�őO�ʂɂ͂Ȃ�Ȃ�

'�錾��
Dim STR_Program_Path
Dim OBJ_FSO
Dim OBJ_Lock_File
Dim WshShell
Dim objExec

Set OBJ_FSO = WScript.CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
STR_Program_Path = WScript.CreateObject("WScript.Shell").CurrentDirectory + "\"

'���b�N�t�@�C�����Ȃ���Γ���t�H���_�ꗗ���擾���ăo�b�`�t�@�C�����쐬
If OBJ_FSO.FileExists( STR_Program_Path+"lock" ) = FALSE Then
  Set OBJ_Lock_File = OBJ_FSO.OpenTextFile(STR_Program_Path+"lock", 2, True)
  WshShell.Run "cmd /c Start /low "+STR_Program_Path+"encode.bat", vbNormalFocus, False
End If

Set OBJ_FSO = Nothing
Set WshShell = Nothing