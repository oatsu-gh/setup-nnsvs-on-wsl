#!/usr/bin/env bash
sudo apt update
sudo apt upgrade -y

# CUDAをインストール
sudo apt -yV install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cuda-toolkit-gcc

# PyTorchをインストール
pip install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
# PyTorchのバージョン確認
python3 -c "import torch; print( torch.__version__ )"
