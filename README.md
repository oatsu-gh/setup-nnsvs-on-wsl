# setup-nnsvs-on-wsl

WSL上に[NNSVS](https://github.com/r9y9/nnsvs)の環境構築するバッチとシェルスクリプト

## 動作確認環境

-   Windows 10 Home 2004
-   WSL1, 2（Ubuntu 20.04 LTS, Debian）

### 補足

- `autocrlf = false` にしてあります。

## 使い方

### WSLを普段使わない人

1.  管理者権限でPowerShellを起動して、次のコマンドを実行
```shell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
2. PCを再起動（必ず）
3. [Ubuntu](https://www.microsoft.com/ja-jp/p/ubuntu/9nblggh4msv6) をインストール
4. Ubuntuを起動してユーザー名とパスワードを登録
5. Ubuntuを閉じる。
6.  **[ここ](https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl/archive/master.zip)** からダウンロードした zip を解凍
8.  `.\setup_nnsvs_cmd.bat` をダブルクリックで実行。（セキュリティ関連の警告が出るかもしれません。）
9.  10分から30分ほど待機。たまにパスワード入力を求められるので入力してください。

### 普段からWSLを使う人

WSL上で次のコマンドを実行してください。

```shell
git clone https://github.com/oatsu-gh/setup-nnsvs-on-wsl
cd setup-nnsvs-on-wsl
chmod 744 setup_nnsvs.sh
./setup_nnsvs.sh
```

## 参考

-   [Google Colaboratory で NNSVS で遊ぶ mini-HOWTO - Qiita](https://qiita.com/taroushirani/items/ec16cb9a6b3b691f5e74)
    -   setup_nnsvs.sh はほぼ上記記事のコピペです。
    -   `sudo` を数か所増やしました。
    -   各種ライブラリのインストールパスをWSL用に調整しました。
    -   `python` `pip` を `python3` `pip3` にしました。

## おまけ

### WSLのGPU利用環境構築（参考記事）

- [WSL 2 で GPU を使う（WSL 2 の Ubuntu で，CUDA や PyTorch や TensorFlow 2.2 GPU 版を動かす．Docker は使わない，Windows 10 Insider Program，WSL 2 上 の Ubuntu を使用）](https://www.kkaneko.jp/tools/wsl/wsl_tensorflow2.html)