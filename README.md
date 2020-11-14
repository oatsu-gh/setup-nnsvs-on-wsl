# setup-nnsvs-on-wsl

WSL上に[NNSVS](https://github.com/r9y9/nnsvs)の環境構築とアップデートするバッチとシェルスクリプト

## 動作確認環境

-   Windows 10 Home Insider Preview
    -   バージョン 2004
    -   OSビルド 20241.1005
-   WSL1, 2（Ubuntu 20.04 LTS, Ubuntu）

### 補足

- `autocrlf = false` にしてあります。

## 使い方

### WSLを普段使わない人

1.  管理者権限でPowerShellを起動して、次のコマンドを実行
```shell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
2. PCを再起動（必ず）
3. **[Ubuntu](https://www.microsoft.com/ja-jp/p/ubuntu/9nblggh4msv6)** をインストール
4. Ubuntuを起動してユーザー名とパスワードを登録
5. Ubuntuを閉じる。
6.  このREADMEをブラウザで見ている場合は、**[ここ](https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl/archive/master.zip)** からダウンロードした zip を解凍
8.  **setup_nnsvs_on_wsl.bat** をダブルクリックで実行。（セキュリティ関連の警告が出るかもしれません。）
9.  10分から30分ほど待機。たまにパスワード入力を求められるので入力してください。

### 普段からWSLを使う人

1. **setup_nnsvs_on_wsl.bat** をダブルクリック実行で、NNSVSをインストール。

#### CUDAの環境を作りたい場合（CUDAを使用可能なバージョンのWSL2を利用している場合）

1. Windowsに Visual C++ Build Tools をインストール
   （参考：[Visual Studio Community 2019 vesion 16.2, Visual C++ ビルドツールのインストール（Windows 上）](https://www.kkaneko.jp/tools/win/vs2019.html#S1)）
2. Windowsに [CUDA Toolkit 10.1](https://developer.nvidia.com/cuda-10.1-download-archive-update2?target_os=Windows&target_arch=x86_64&target_version=10&target_type=exenetwork) をインストール
   （参考：[WSL 2 で GPU を使う（WSL 2 の Ubuntu で，CUDA や PyTorch や TensorFlow 2.2 GPU 版を動かす．Docker は使わない，Windows 10 Insider Program，WSL 2 上 の Ubuntu を使用）](https://www.kkaneko.jp/tools/wsl/wsl_tensorflow2.html)）
3. **setup_cuda_on_wsl.bat** をダブルクリック実行して、WSLにCUDAとPyTorchをインストール

## アップデート方法
- 2020年10月以前に本ツールでインストールした環境をアップデートできます。
- update_nnsvs_on_wsl.bat をダブルクリック実行してください。

## 参考

-   [Google Colaboratory で NNSVS で遊ぶ mini-HOWTO - Qiita](https://qiita.com/taroushirani/items/ec16cb9a6b3b691f5e74)
    -   setup_nnsvs.sh はほぼ上記記事のコピペです。
    -   `sudo` を数か所増やしました。
    -   各種ライブラリのインストールパスをWSL用に調整しました。
    -   `python` `pip` を `python3` `pip3` にしました。

- [WSL 2 で GPU を使う（WSL 2 の Ubuntu で，CUDA や PyTorch や TensorFlow 2.2 GPU 版を動かす．Docker は使わない，Windows 10 Insider Program，WSL 2 上 の Ubuntu を使用）](https://www.kkaneko.jp/tools/wsl/wsl_tensorflow2.html)
