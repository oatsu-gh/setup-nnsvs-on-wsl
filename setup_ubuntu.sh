# Ubuntu の更新
sudo apt update && sudo apt upgrade -y && sudo autoremove

# pip3のインストール
sudo apt install python3-pip

# .bashrc に書き込み
echo \ >> ~/.bashrc
echo '# ここから追記'
echo alias python=\'python3\' >> ~/.bashrc
echo alias pip=\'pip3\' >> ~/.bashrc
echo alias Hachune=\'Y(๑°口°๑)\'


# 終了
exit
