# setup-nnsvs-ubuntu-wsl

WindowsのWSL1でNNSVSの環境構築するバッチとシェルスクリプト

## 著作権表記

(c) 2020 Ryuichi Yamamoto  
setup_nnsvs は NNSVS 内の手順書（[リンク](https://github.com/r9y9/nnsvs/blob/76552acbdad7d17a07debeec39db592cae529b4b/.github/workflows/ci.yml#L20-L52)）を改変したものです。

## 使い方

### WSLを普段使わない人

zipを解凍してダウンロード、batをダブルクリックすると大体全部やってくれます。  
ですが、エラー確認のため setup-nnsvs-ubuntu-wsl のフォルダで右クリックして、コマンドプロンプトかPowerShellを起動してから `setup_nnsvs_cmd.bat` を入力して実行してください。

### 普段からWSLを使う人

bashrcをいじってほしくない人向けのやり方です。  
余計な設定を変えないようにするため、
WSL上から

    git clone https://github.com/oatsu-gh/setup-nnsvs-ubuntu-wsl
    cd setup-nnsvs-ubuntu-wsl
    ./setup_nnsvs.sh

してください。

