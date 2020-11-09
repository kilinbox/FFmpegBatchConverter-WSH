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
 
* setting.xml
　
　
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
 
* setting.xmlをテキストエディタで開いて次の2カ所を編集する。

> <Movie_Path>C:\Movies_Folder\</Movie_Path>
> <Export_Path>C:\Export_Folder\</Export_Path>

## 使い方

1. ffmpegをダウンロードして、このファイルと同じ場所に入れる。
1. setting.xmlのMovie_Pathで指定したフォルダに動画を入れておく。
1. STEP1_〇〇.vbsのどれか（用途にあったもの）をダブルクリックする。
1. STEP2_実行！.vbsをダブルクリックする。
