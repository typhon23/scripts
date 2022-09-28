##############################
# アプリの一括インストール・更新・OS再起動スクリプト
# 
# 【使用上の注意】
# ・パッケージマネージャー「winget」インストール（コマンドプロンプト・PowerShellでwingetコマンドが実行できる状態）してから、本スクリプトを実行すること
# 　（参考：https://github.com/microsoft/winget-cli/releases）
# ・管理者権限で実行すること
# 　（管理者権限で実行しなかった場合、インストールや更新時にユーザーアカウント制御(UAC)の昇格確認が何度も表示されて手動操作が必要になってしまうため）
# 
# 【今後の課題】
# ・インストール・更新に失敗した場合のエラー処理の追加
# ・上記処理を追加した場合、同じ処理が繰り返されることになるので、インストール処理などの関数化
# 
# 【補足事項】
# winget で扱えるパッケージの探し方：
# ・下記のコマンドを実行し、表示された一覧に目的のアプリのパッケージが含まれているか確認する
# 　`winget search {アプリ名(スペースを含む場合はダブルクォーテーションで囲む)}`
##############################


##############################
# 必須のアプリ
##############################

# 「Auto Dark Mode」をインストール
# 明・暗テーマを自動で切り替えるアプリ
# 参考：https://github.com/AutoDarkMode/Windows-Auto-Night-Mode
winget install --id Armin2208.WindowsAutoNightMode

# 「Power Toys (Preview)」をインストール
# Microsoft のユーティリティアプリ
winget install --id Microsoft.PowerToys

# 「Bitwarden」をインストール
# パスワードマネージャーアプリ
winget install --id Bitwarden.Bitwarden

# 「Discord」をインストール
# コミュニケーションアプリ
winget install --id Discord.Discord

# 「draw.io」をインストール
# 作図アプリ
winget install --id JGraph.Draw

# 「Google Chrome」をインストール
# ブラウザ
winget install --id Google.Chrome

# 「Google 日本語入力」をインストール
# IMEアプリ
winget install --id  Google.JapaneseIME

# 「LINE」をインストール
# コミュニケーションアプリ
winget install --id LINE.LINE

# 「Signal」をインストール
# コミュニケーションアプリ
winget install --id OpenWhisperSystems.Signal

# 「Visual Studio Code」をインストール
# テキストエディタ
winget install --id Microsoft.VisualStudioCode

# 「PowerShell」をインストール
# コマンドライン
winget install --id Microsoft.PowerShell

# 「Windows Terminal」をインストール
# コマンドライン
winget install --id Microsoft.WindowsTerminal

# 「VLC media player」をインストール
# メディアプレーヤー
winget install --id VideoLAN.VLC

# 「WinMerge」をインストール
# 差分表示アプリ
winget install --id WinMerge.WinMerge


##############################
# 必須のアプリ（バージョンアップのたびにID更新が必要）
# 
# パッケージ ID にバージョンナンバーが含まれているため、メジャーアップデートがあった場合に ID を更新しなければならない可能性がある
# 定期的に確認しよう
##############################

# 「Visual Studio Community 2022」をインストール
# IDE
winget install --id Microsoft.VisualStudio.2022.Community

# 「LINQPad 7」をインストール
# C#のツール
winget install --id LINQPad.LINQPad.7


##############################
# 任意のアプリ
# 
# 使用状況によって不要である場合もあるアプリ。都度見直すこと
##############################

# 「Logicool Options」をインストール
# Logicool 製のキーボード・マウスを利用している場合はインストールする
winget install --id Logitech.Options

# 「Microsoft Azure CLI」をインストール
# Azure を扱う場合はインストールする
winget install --id Microsoft.AzureCLI


##############################
# インストール済みアプリの一括更新
# 
# 更新があるアプリはすべて更新する
# アプリによっては更新に失敗する場合がある（エラーメッセージのポップアップ画面が出るので手動操作が必要な場合あり）
##############################
winget upgrade --all


##############################
# インストール済みアプリの一覧を出力
# 
# インストール済みアプリの一覧をテキストファイルに出力しておく
##############################
winget list > C:\Temp\wingetlist.txt


##############################
# OS再起動
##############################
Restart-Computer -Force