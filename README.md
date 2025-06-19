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




### Screenshots for Execution Times for 2^20 including Correctness check for each kernel

![1](Execution%20Times%20Screenshots/1048576/1.png)
![2](Execution%20Times%20Screenshots/1048576/2.png)
![3](Execution%20Times%20Screenshots/1048576/3.png)
![4](Execution%20Times%20Screenshots/1048576/4.png)
![5](Execution%20Times%20Screenshots/1048576/5.png)
![6](Execution%20Times%20Screenshots/1048576/6.png)
![7](Execution%20Times%20Screenshots/1048576/7.png)
![8](Execution%20Times%20Screenshots/1048576/8.png)
![9](Execution%20Times%20Screenshots/1048576/9.png)
![10](Execution%20Times%20Screenshots/1048576/10.png)
![11](Execution%20Times%20Screenshots/1048576/11.png)
![12](Execution%20Times%20Screenshots/1048576/12.png)
![13](Execution%20Times%20Screenshots/1048576/13.png)
![14](Execution%20Times%20Screenshots/1048576/14.png)
![15](Execution%20Times%20Screenshots/1048576/15.png)
![16](Execution%20Times%20Screenshots/1048576/16.png)
![17](Execution%20Times%20Screenshots/1048576/17.png)
![18](Execution%20Times%20Screenshots/1048576/18.png)
![19](Execution%20Times%20Screenshots/1048576/19.png)
![20](Execution%20Times%20Screenshots/1048576/20.png)
![21](Execution%20Times%20Screenshots/1048576/21.png)
![22](Execution%20Times%20Screenshots/1048576/22.png)
![23](Execution%20Times%20Screenshots/1048576/23.png)
![24](Execution%20Times%20Screenshots/1048576/24.png)
![25](Execution%20Times%20Screenshots/1048576/25.png)
![26](Execution%20Times%20Screenshots/1048576/26.png)
![27](Execution%20Times%20Screenshots/1048576/27.png)
![28](Execution%20Times%20Screenshots/1048576/28.png)
![29](Execution%20Times%20Screenshots/1048576/29.png)
![30](Execution%20Times%20Screenshots/1048576/30.png)

### Screenshots for Execution Times for 2^26 including Correctness check for each kernel

![1](Execution%20Times%20Screenshots/67108864/1.png)
![2](Execution%20Times%20Screenshots/67108864/2.png)
![3](Execution%20Times%20Screenshots/67108864/3.png)
![4](Execution%20Times%20Screenshots/67108864/4.png)
![5](Execution%20Times%20Screenshots/67108864/5.png)
![6](Execution%20Times%20Screenshots/67108864/6.png)
![7](Execution%20Times%20Screenshots/67108864/7.png)
![8](Execution%20Times%20Screenshots/67108864/8.png)
![9](Execution%20Times%20Screenshots/67108864/9.png)
![10](Execution%20Times%20Screenshots/67108864/10.png)
![11](Execution%20Times%20Screenshots/67108864/11.png)
![12](Execution%20Times%20Screenshots/67108864/12.png)
![13](Execution%20Times%20Screenshots/67108864/13.png)
![14](Execution%20Times%20Screenshots/67108864/14.png)
![15](Execution%20Times%20Screenshots/67108864/15.png)
![16](Execution%20Times%20Screenshots/67108864/16.png)
![17](Execution%20Times%20Screenshots/67108864/17.png)
![18](Execution%20Times%20Screenshots/67108864/18.png)
![19](Execution%20Times%20Screenshots/67108864/19.png)
![20](Execution%20Times%20Screenshots/67108864/20.png)
![21](Execution%20Times%20Screenshots/67108864/21.png)
![22](Execution%20Times%20Screenshots/67108864/22.png)
![23](Execution%20Times%20Screenshots/67108864/23.png)
![24](Execution%20Times%20Screenshots/67108864/24.png)
![25](Execution%20Times%20Screenshots/67108864/25.png)
![26](Execution%20Times%20Screenshots/67108864/26.png)
![27](Execution%20Times%20Screenshots/67108864/27.png)
![28](Execution%20Times%20Screenshots/67108864/28.png)
![29](Execution%20Times%20Screenshots/67108864/29.png)
![30](Execution%20Times%20Screenshots/67108864/30.png)

### Screenshots for Execution Times for 2^28 including Correctness check for each kernel

![1](Execution%20Times%20Screenshots/268435456/1.png)
![2](Execution%20Times%20Screenshots/268435456/2.png)
![3](Execution%20Times%20Screenshots/268435456/3.png)
![4](Execution%20Times%20Screenshots/268435456/4.png)
![5](Execution%20Times%20Screenshots/268435456/5.png)
![6](Execution%20Times%20Screenshots/268435456/6.png)
![7](Execution%20Times%20Screenshots/268435456/7.png)
![8](Execution%20Times%20Screenshots/268435456/8.png)
![9](Execution%20Times%20Screenshots/268435456/9.png)
![10](Execution%20Times%20Screenshots/268435456/10.png)
![11](Execution%20Times%20Screenshots/268435456/11.png)
![12](Execution%20Times%20Screenshots/268435456/12.png)
![13](Execution%20Times%20Screenshots/268435456/13.png)
![14](Execution%20Times%20Screenshots/268435456/14.png)
![15](Execution%20Times%20Screenshots/268435456/15.png)
![16](Execution%20Times%20Screenshots/268435456/16.png)
![17](Execution%20Times%20Screenshots/268435456/17.png)
![18](Execution%20Times%20Screenshots/268435456/18.png)
![19](Execution%20Times%20Screenshots/268435456/19.png)
![20](Execution%20Times%20Screenshots/268435456/20.png)
![21](Execution%20Times%20Screenshots/268435456/21.png)
![22](Execution%20Times%20Screenshots/268435456/22.png)
![23](Execution%20Times%20Screenshots/268435456/23.png)
![24](Execution%20Times%20Screenshots/268435456/24.png)
![25](Execution%20Times%20Screenshots/268435456/25.png)
![26](Execution%20Times%20Screenshots/268435456/26.png)
![27](Execution%20Times%20Screenshots/268435456/27.png)
![28](Execution%20Times%20Screenshots/268435456/28.png)
![29](Execution%20Times%20Screenshots/268435456/29.png)
![30](Execution%20Times%20Screenshots/268435456/30.png)

