# HlangPU

High-level-language PU

## ディレクトリ構成

- fpga_proj/ : Vivado, Vitis プロジェクト
- lalr_rule/ : LALR表作成プログラム

## プログラム例

```c
a = 1 ;
b = 2 ;
c = a + ( b << 2 ) ;
d = c if ( 1 ) ;
out d ;
EOF
```
