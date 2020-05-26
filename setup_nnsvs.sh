# Ubuntuの更新
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# 必要なコマンドを準備しておく
sudo apt install cmake -y
# pip のアプデ
python3 -m pip install --upgrade pip

# NNSVSをインストールするフォルダを作る
cd ~
mkdir nnsvs

#  hts_engine_API をインストール
git clone https://github.com/r9y9/hts_engine_API
cd hts_engine_API/src
python3 waf configure build
sudo python3 waf install
cd ../../ && rm -rf hts_engine_API

# Sinsyをインストール
git clone https://github.com/r9y9/sinsy
cd sinsy/src/ && mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON  .. && make -j && sudo make install
cd ../../../ && rm -rf sinsy

# NNSVSをインストール
git clone https://github.com/r9y9/nnsvs
cd nnsvs
# Pythonのパッケージをダウンロード
# python3 -m pip install --upgrade pip # 8行目でやったので省略
pip3 install -r requirements.txt && pip3 install -e .
sudo pip3 install -r requirements.txt

# PySinsyをインストール
git clone https://github.com/r9y9/pysinsy
cd pysinsy
sudo python3 setup.py install
cd ..

# おわり
