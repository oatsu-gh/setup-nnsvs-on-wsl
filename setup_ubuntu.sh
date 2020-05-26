# Ubuntu の更新
cd ~
sudo apt update && sudo apt upgrade -y && sudo apt autoremove

# pip3のインストール
sudo apt install python3-pip -y

# .bashrc に書き込み
echo \ >> ~/.bashrc
echo '# ここから追記' >> ~/.bashrc
echo alias python=\'python3\' >> ~/.bashrc
echo alias pip=\'pip3\' >> ~/.bashrc

# 終了
exit
