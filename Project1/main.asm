section .data
    msg db "Hello %d", 10, 0 ; フォーマット文字列 "Hello %d\n" を定義

section .text
    global main ; エントリーポイントを定義
    extern printf ; Cのprintf関数を呼び出すために宣言

main:
    sub rsp, 40        ; スタックを40バイト分確保（スタックアラインメントのため）

    lea rcx, [rel msg] ; 第1引数（RIP相対アドレッシング） 
    mov rdx, 123       ; 第2引数
    xor rax, rax       ; 可変引数関数の呼び出しでは AL=使用したXMMレジスタ数（ここでは0）
    call printf ; printf関数を呼び出す

    add rsp, 40 ; スタックを元に戻す

    mov eax, 0 ; 戻り値0をeaxにセット（main関数の成功を示す）
    ret ; 実行位置を呼び出し元に戻す（=この場合は、osに戻る)