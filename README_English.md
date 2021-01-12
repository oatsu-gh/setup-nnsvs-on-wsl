# setup-nnsvs-on-wsl

[NNSVS](https://github.com/r9y9/nnsvs) installation batch scripts for Ubuntu as WSL.

## System requirements

-   Windows 10 Home
    -   Version 2004
-   WSL1, 2（Ubuntu 20.04 LTS, Ubuntu）

## How to use

1. Install [**Ubuntu**](https://www.microsoft.com/ja-jp/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab) and do initial setting of it.
3. double click **setup_nnsvs_on_wsl.bat** .

### Advanced (optional)

If your WSL2 and your machine are ready to use CUDA (≧10.1), double click and run **setup_cuda_on_wsl.bat** .

## Problems?

If you installed Sinsy successfully but fail to `import sinsy` on python (ERROR message saying there is no Sinsy), run on bash`export LD_LIBRARY_PATH=/usr/local/lib` .