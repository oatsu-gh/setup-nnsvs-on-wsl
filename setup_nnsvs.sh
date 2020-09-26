# WSL(Ubuntu)でNNSVSの環境構築をするシェルスクリプト
#
# CUDAを使わない場合はWSL1のほうがいいです。
# WSL2はメモリの使い方がおかしいので、ステージ4で失敗しやすいです。
# ただし、NFSなどでCUDAを使いたい場合はWSL2が必要です。
#
# [参考]
# Google Colaboratory で NNSVS で遊ぶ mini-HOWTO - Qiita
# https://qiita.com/taroushirani/items/ec16cb9a6b3b691f5e74
#

cd ~
echo $'\a'
# Ubuntuの更新
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
# Python3 パッケージ管理ツールのインストール
sudo apt install python3-pip -y
sudo apt install cmake -y

# python で python3 が起動するようにする。 (次回のWSL起動時から)
sudo apt install python-is-python3

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

## nnmnkwii をインストール
# pip3 install nnmnkwii
git clone https://github.com/r9y9/nnmnkwii
cd nnmnkwii && pip3 install .
# ---------------------------------------------------------
# install に1回失敗してエラー出るけど自動でやり直してインストールされるから大丈夫
# ---------------------------------------------------------
cd ~

# NNSVS をインストール
# これ結構時間かかる
git clone https://github.com/r9y9/nnsvs
cd nnsvs && pip3 install .
# ---------------------------------------------------------
# PATH通ってないけど大丈夫？って言われるけど気にしなくてOK
# ---------------------------------------------------------
cd ~

# nnsvs/run.sh の stage1 で躓く問題を対策 (詳細: bandmat をPyPIからインストールできない。)
git clone https://github.com/MattShannon/bandmat
cd bandmat && pip3 install .
cd ~

# NNSVSでモデル生成するときに使うライブラリをインストール
pip3 install jaconv
pip3 install tqdm

# PySinsy が Sinsy にアクセスできるようにする
export LD_LIBRARY_PATH=/usr/local/lib

# 終わりを知らせる
echo $'\a'
