## このプログラムについて

自分用。
FFmpegを使ってフォルダ内にある動画ファイルを一括変換するもの。
WSH（Windows Script Host）で書いている。

## 別途用意するもの

* FFmpeg

version 4.2.1で動作確認済

## ファイルの説明

* libx264.ffpreset

　FFmpegでH264エンコードする際のパラメータをまとめたもの。プリセットという。
 
* STEP1_H264のMP4変換バッチ作成(fpsを24に指定アニメ用).vbs

　MP4コンテナ、H264コーデックでエンコードするためのバッチを作成。  
　アニメにあわせてフレームレートを24fpsにしたもの。
 
* STEP1_H264のMP4変換バッチ作成.vbs

　MP4コンテナ、H264コーデックでエンコードするためのバッチを作成。  
　フレームレートは元動画にあわせる。
 
* STEP1_PRORESのMOV変換バッチ作成.vbs

　MOVコンテナ、Apple ProResコーデックでエンコードするためのバッチを作成。  
　フレームレートは元動画にあわせる。
 
* STEP2_実行！.vbs

　STEP1で作成したバッチファイルを実行するためのもの。  
　ただ実行させるだけでなく、他のプログラムの邪魔をしないため優先度低の状態で実行させる。
 
* README.md

　このファイル
 
## 初期設定
 
* STEP1_H264のMP4変換バッチ作成(fpsを24に指定アニメ用).vbs
* STEP1_H264のMP4変換バッチ作成.vbs
* STEP1_PRORESのMOV変換バッチ作成.vbs

これらをテキストエディタで開き、18～20行目の値を変更する。

> STR_Program_Path = "C:\Programs\"	'このプログラムがあるフォルダ  
> STR_Movie_Path = "C:\Movies_Folder\"	'元動画があるフォルダ  
> STR_Export_Path = "C:\Export_Folder\"	'出力先フォルダ  

## 使い方

1. STR_Program_Pathで指定したフォルダにffmpegを入れる。
1. STR_Movie_Pathで指定したフォルダに動画を入れておく。
1. STEP1_〇〇.vbsのどれか（用途にあったもの）をダブルクリックする。
1. STEP2_実行！.vbsをダブルクリックする。
