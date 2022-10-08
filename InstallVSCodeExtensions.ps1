##############################
# Visual Studio Code 拡張機能の一括インストールスクリプト
# 
# 【使用上の注意】
# ・VSCode がインストール済みで PowerShell で「code」コマンドが実行できる状態で、本スクリプトを実行すること
# 
# 【今後の課題】
# ・AddSettingJson() にエラー処理を追加
# 
# 【補足事項】
# 拡張機能の識別子の確認方法：
# ・VSCode の拡張機能ページ、または Web の拡張機能ページを開き、画面右ペインの詳細情報(More Info)のところにある「識別子」(Unique Identifier)を確認する
##############################

# 「Japanese Language Pack for Visual Studio Code」をインストール
# VSCode を日本語化する拡張機能
code --install-extension ms-ceintl.vscode-language-pack-ja

# 「Markdown All in One」をインストール
# Markdown 文書作成に便利な拡張機能
code --install-extension yzhang.markdown-all-in-one

# 「Markdown Preview Enhanced」をインストール
# Markdown 文書のプレビューを表示する拡張機能
code --install-extension shd101wyy.markdown-preview-enhanced

# 「Paste Image」をインストール
# クリップボードにコピーした画像を Markdown 文書へかんたんに挿入する拡張機能
code --install-extension mushan.vscode-paste-image
# 画像の保存場所を images フォルダへ変更するため setting.json へ設定追加
AddSettingJson('pasteImage.path', '${currentFileDir}/images')

# 「Code Spell Checker」をインストール
# スペルチェックしてくれる拡張機能
code --install-extension streetsidesoftware.code-spell-checker

# 「vscode-icons」をインストール
# ファイルの拡張子に応じたアイコンを表示してくれる拡張子
code --install-extension vscode-icons-team.vscode-icons

Function AddSettingJson($additionalSettingName, $additionalSettingValue){
    $settingJsonPath = $env:APPDATA + '\Code\User\settings.json'

    # settings.json の内容を取得
    $jsonObject = Get-Content $settingJsonPath | ConvertFrom-Json
    # 設定を追加
    $jsonObject | Add-Member -NotePropertyName $additionalSettingName -NotePropertyValue $additionalSettingValue
    # settings.json を上書き保存
    ConvertTo-Json $jsonObject | Out-File $settingJsonPath -Encoding utf8
}