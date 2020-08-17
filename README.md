# setup-nnsvs-on-wsl

WSL上に[NNSVS](https://github.com/r9y9/nnsvs)の環境構築するバッチとシェルスクリプト

## 動作確認環境

- Windows 10 Home 2004
- WSL1, 2（Ubuntu 20.04 LTS, Debian）

## 使い方

### WSLを普段使わない人

1.  WSLのインストールとユーザー作成を行ってください。「WSL インストール」でググったらたくさん出ます。
2.  **[ここ](https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl/archive/master.zip)** からダウンロードした zip を解凍
3.  解凍したフォルダで「Shift + 右クリック」してPowerShellまたはコマンドプロンプトを起動
4. PowerShellで `.\setup_nnsvs_cmd.bat` を実行。（セキュリティ関連の警告が出るかもしれません。）
5. 10分から30分ほど待機。たまにパスワード入力を求められるので入力してください。

### 普段からWSLを使う人

WSL上

    git clone https://github.com/oatsu-gh/setup-nnsvs-on-wsl
    cd setup-nnsvs-on-wsl
    chmod 744 setup_nnsvs.sh
    ./setup_nnsvs.sh

してください。
