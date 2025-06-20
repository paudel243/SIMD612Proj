|    | kernel                         |   runtime_debug |   runtime_release |   Speed Gain/Loss |
|---:|:-------------------------------|----------------:|------------------:|------------------:|
|  0 | C Kernel (^20)                 |         3.31408 |          3.41685  |          0.969923 |
|  1 | C Kernel (^26)                 |       215.367   |        220.991    |          0.974551 |
|  2 | C Kernel (^28)                 |       859.098   |        904.214    |          0.950105 |
|  3 | SIMD using XMM register (^20)  |         0.60664 |          0.641753 |          0.945285 |
|  4 | SIMD using XMM register (^26)  |        70.8686  |         67.1932   |          1.0547   |
|  5 | SIMD using XMM register (^28)  |       266.188   |        269.044    |          0.989383 |
|  6 | SIMD using YMM register (^20)  |         0.50024 |          0.479687 |          1.04285  |
|  7 | SIMD using YMM register (^26)  |        67.3389  |         64.2126   |          1.04869  |
|  8 | SIMD using YMM register (^28)  |       259.609   |        257.568    |          1.00792  |
|  9 | x86-64 assembly language (^20) |         1.00521 |          0.878753 |          1.1439   |
| 10 | x86-64 assembly language (^26) |        77.5846  |         72.84     |          1.06514  |
| 11 | x86-64 assembly language (^28) |       297.835   |        291.428    |          1.02199  |