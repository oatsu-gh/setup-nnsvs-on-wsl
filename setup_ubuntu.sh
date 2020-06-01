# Ubuntu の更新
cd ~
sudo apt update && sudo apt upgrade -y && sudo apt autoremove

# 'python', 'pip' で python3, pip3を呼び出すように設定
sudo apt install python-is-python3

# pip3のインストール
sudo apt install python3-pip -y

# .bashrc に書き込み
echo \ >> ~/.bashrc
echo '# ここから追記' >> ~/.bashrc
echo alias set bell-style none >> ~/.bashrc

# 終了
exit
