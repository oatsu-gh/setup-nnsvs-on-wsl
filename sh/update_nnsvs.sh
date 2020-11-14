#!/usr/bin/env bash
# WSL(Ubuntu)上のNNSVS環境をアップデートするシェルスクリプト

cd ~
# Ubuntuをアップデート
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
# Pythonのパッケージ管理ツールをアップデート
python3 -m pip install --upgrade pip

# 古いライブラリをアップデートまたは削除
rm -rf nnsvs nnmnkwii
pip3 uninstall nnsvs nnmnkwii torch
pip3 install --upgrade numpy cython wheel
# PyTorchをアップデート
pip uninstall torch
pip install torch==1.7.0+cu101 torchvision==0.8.1+cu101 torchaudio===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
# nnmnkwii の最新版をインストール
cd ~/nnmnkwii
git pull
pip install .
# NNSVSの最新版をインストール
cd ~/nnsvs
git pull
pip install .
echo $'\a'
