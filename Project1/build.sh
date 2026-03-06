# アセンブリを実行ファイルにする手順

# asmからobj（中間ファイル）にする
nasm -f win64 main.asm

# objからexeにする
gcc main.obj -o main.exe