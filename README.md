# init

## ubuntuの初期設定

1. グラボを積んでる場合はグラフィックドライバーの変更後再起動
1-1. applicationで `ソフトウェアとアップデート` を選択し、起動
1-2. 追加のドライバータブを選択
1-3. プロプライエタリのドライバーを選択する
1-4. 再起動


2. フォルダ名を英語に変更
```
 LANG=C xdg-user-dirs-gtk-update
````

3. 日本語/英語切り替え

3-1. 設定 > デバイス > キーボード > キーボード・ショートカット > タイピング に移動
3-2. `前の入力ソースへ切り替える` を `Ctrl + Space` に変更
3-3. `次の入力ソースへ切り替える` を `Shift + Ctrl + Space` 変更
3-4. mozic(日本語) の入力モードを `ひらがな` に変更

4. gitコマンドのインストール
```
sudo apt install git
```

4. onedriveクライアントのインストール

see https://github.com/skilion/onedrive
インストール後、 `onedrive` コマンドを実行

5. chromeのインストール

```
curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable
```

5. 各GUIアプリをインストール
  - jetbrains-toolboxのインストール
  - slackのインストール
  - vscodeのインストール

6. GNOME Tweak のインストール
  ubuntuソフトウェアから検索してインストール

7. 新しいubuntuテーマをインストール

8. インストールスクリプトの実行
