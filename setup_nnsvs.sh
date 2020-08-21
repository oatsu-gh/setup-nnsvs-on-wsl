# WSL(Ubuntu)でNNSVSの環境構築をするシェルスクリプト
#
# WSL2にしておくことをお勧めします。
#
# [参考]
# Google Colaboratory で NNSVS で遊ぶ mini-HOWTO - Qiita
# https://qiita.com/taroushirani/items/ec16cb9a6b3b691f5e74
#
# 初期$PATH
# /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program
#

cd ~

# Ubuntuの更新
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
# Python3 パッケージ管理ツールのインストール
sudo apt install python3-pip -y
sudo apt install cmake -y

# Python3 で使うNumPyとCythonをインストール
# python3 -m pip install --upgrade pip
pip3 install --upgrade pip
pip3 install --user numpy cython wheel
# ---------------------------------------------------------
# PATH通ってないけど大丈夫？って言われるけど気にしなくてOK
# ---------------------------------------------------------


# hts_engine_API をビルド
git clone https://github.com/r9y9/hts_engine_API
cd hts_engine_API/src
python3 waf configure --prefix=/usr/
python3 waf build > hts_engine_API_build.log 2>&1
sudo python3 waf install # original: python3 waf install
cd ~

# Sinsyをビルド
git clone https://github.com/r9y9/sinsy
cd sinsy/src/ && mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON  -DCMAKE_INSTALL_PREFIX=/usr/local/ ..
make -j  > sinsy_build.log 2>&1
sudo make install # original: make install
cd ~

# PySinsyをインストール
git clone https://github.com/r9y9/pysinsy
cd pysinsy
export SINSY_INSTALL_PREFIX=/usr/local/
pip3 install .
cd ~

# nnmnkwii をインストール
git clone https://github.com/r9y9/nnmnkwii
cd nnmnkwii && pip3 install .
cd ~

# NNSVS をインストール
# これ結構時間かかる
git clone https://github.com/r9y9/nnsvs
# ModuleNotFoundError: No module named 'nnsvs.io' になるのを対策
touch nnsvs/nnsvs/io/__init__.py

cd nnsvs && pip3 install .
# ---------------------------------------------------------
# PATH通ってないけど大丈夫？って言われるけど気にしなくてOK
# ---------------------------------------------------------
cd ~

# python で python3 が起動するようにする。
# UbuntuならできますがDebianは失敗します。

sudo apt install python-is-python3

# nnsvs/run.sh の stage1 で躓く問題を対策 (詳細: bandmat をPyPIからインストールできない。)
git clone https://github.com/MattShannon/bandmat
cd bandmat && pip3 install .
cd ~

# 「おふとんP 歌声DB」でつかうライブラリをインストール
pip3 install jaconv
