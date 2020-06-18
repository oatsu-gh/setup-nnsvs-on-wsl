# Copyright (c) 2020 oatsu

# Copyright (c) 2020 Ryuichi Yamamoto
# 山本りゅういち様のこちらコードを改変して作りました。
# (https://github.com/r9y9/nnsvs/blob/76552acbdad7d17a07debeec39db592cae529b4b/.github/workflows/ci.yml#L20-L52)
echo 'Copyright (c) 2020 Ryuichi Yamamoto'
echo \

# Ubuntuの更新
cd ~
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# 必要なコマンドを準備しておく
sudo apt install cmake -y
sudo apt install git -y
# pip のアプデ
python3 -m pip install --upgrade pip

# NNSVSをダウンロードして作業フォルダにする
cd ~
git clone https://github.com/r9y9/nnsvs
cd nnsvs

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


# PySinsyをインストール
git clone https://github.com/r9y9/pysinsy
cd pysinsy
sudo pip3 install --user -r requirements.txt 
sudo pip3 install --user -e . 
sudo python3 setup.py install

# Pysinsyの動作テスト
export LD_LIBRARY_PATH=/usr/local/lib
pip3 install pytest
pytest
cd ..

# NNSVS のセットアップ
sudo python3 setup.py develop

# おわり
