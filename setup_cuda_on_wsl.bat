REM WSL��NNSVS�̊��\�z������o�b�`

wsl --update
wsl uname -r
REM "Is your WSL version >= 4.9.121 ?"
REM " If lower, CUDA is unable."

wsl sh/setup_cuda_on_wsl.sh
