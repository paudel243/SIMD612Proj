# SIMD612Proj
| Implementation | 2^20 Size | 2^26 Size | 2^28 Size |
|----------------|-----------|-----------|-----------|
| C              | 3.43      | 281.67    | 1300.23   |
| X86            | 1.00      | 114.90    | 536.20    |
| XMM (SSE)      | 0.93      | 82.87     | 372.23    |
| YMM (AVX)      | 0.73      | 69.77     | 313.73    |

On 2^20 input x86 was 3.43 times faster than C / XMM was 3.69 times faster / YMM 4.70 times faster
On 2^26 input x86 was 2.45 times faster than C / XMM was 3.40 times faster / YMM 4.04 times faster
On 2^28 input x86 was 2.42 times faster than C / XMM was 3.49 times faster / YMM 4.14 times faster

Why it's faster:
SSE and AVX were able to operate on vectors which allows for multiple operations to happen concurrently unlike the base C kernel that handles one value at a time. XMM utilizes 128-bit registers while YMM makes use of 256-bit registers so AVX can process twice as much data per instruction as SSE. x86 is faster than C due to assembly making use of efficient instructions for the dataflow compared to C.

![2^20 Screenshot 1] (Execution Times Screenshots/1048576/1.png)
