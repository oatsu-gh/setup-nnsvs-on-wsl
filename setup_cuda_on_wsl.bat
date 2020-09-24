REM WSLでNNSVSの環境構築をするバッチ

wsl --update
wsl uname -r
REM WSLのバージョンが4.9.121 以降になっていますか？

wsl bash setup_pytorch_on_wsl.sh
