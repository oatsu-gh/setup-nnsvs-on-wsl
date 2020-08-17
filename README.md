# setup-nnsvs-ubuntu-wsl

WSLで[NNSVS](https://github.com/r9y9/nnsvs)の環境構築するバッチとシェルスクリプト

## 動作確認環境

-   Windows 10 Home 2004
-   WSL1, 2（Ubuntu 20.04 LTS, Debian）

## 著作権表記

Copyright (c) 2020 Ryuichi Yamamoto  
[setup_nnsvs.sh](https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl/blob/master/setup_nnsvs.sh) は NNSVS 内の手順書（[リンク](https://github.com/r9y9/nnsvs/blob/76552acbdad7d17a07debeec39db592cae529b4b/.github/workflows/ci.yml#L20-L52)）を改変したものです。

## 使い方

### WSLを普段使わない人

1.  WSLのインストールとユーザー作成を行ってください。「WSL インストール」でググったらたくさん出ます。
2.  **[ここ](https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl/archive/master.zip)** からダウンロードした zip を解凍
3.  解凍したフォルダで「Shift + 右クリック」してPowerShellまたはコマンドプロンプトを起動
4.  PowerShellで `.\setup_nnsvs_cmd.bat` を実行。（セキュリティ関連の警告が出るかもしれません。）
5.  10分から30分ほど待機。たまにパスワード入力を求められるので入力してください。

### 普段からWSLを使う人

WSL上で

    git clone https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl
    cd setup-nnsvs-ubuntu-wsl
    ./setup_nnsvs.sh

してください。
