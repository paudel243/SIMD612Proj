;void CVersionStencil(int64_t* x, int64_t* y, int n)
;{
00007FF73CBA2B90  mov         dword ptr [rsp+18h],r8d  
00007FF73CBA2B95  mov         qword ptr [rsp+10h],rdx  
00007FF73CBA2B9A  mov         qword ptr [rsp+8],rcx  
00007FF73CBA2B9F  push        rbp  
00007FF73CBA2BA0  push        rdi  
00007FF73CBA2BA1  sub         rsp,128h  
00007FF73CBA2BA8  lea         rbp,[rsp+20h]  
00007FF73CBA2BAD  lea         rcx,[__ED1E9812_main@c (07FF73CBB40A5h)]  
00007FF73CBA2BB4  call        __CheckForDebuggerJustMyCode (07FF73CBA137Fh)  
00007FF73CBA2BB9  nop  
;    int min = 3;
00007FF73CBA2BBA  mov         dword ptr [min],3  
;    for (int i = 0; min < (n - 3); i++)
00007FF73CBA2BC1  mov         dword ptr [rbp+24h],0  
00007FF73CBA2BC8  jmp         CVersionStencil+42h (07FF73CBA2BD2h)  
00007FF73CBA2BCA  mov         eax,dword ptr [rbp+24h]  
00007FF73CBA2BCD  inc         eax  
00007FF73CBA2BCF  mov         dword ptr [rbp+24h],eax  
00007FF73CBA2BD2  mov         eax,dword ptr [n]  
00007FF73CBA2BD8  sub         eax,3  
00007FF73CBA2BDB  cmp         dword ptr [min],eax  
00007FF73CBA2BDE  jge         CVersionStencil+0F4h (07FF73CBA2C84h)  
;    {
;        y[i] = x[min - 3] + x[min - 2] + x[min - 1] + x[min] + x[min + 1] + x[min + 2] + x[min + 3];
00007FF73CBA2BE4  mov         eax,dword ptr [min]  
00007FF73CBA2BE7  sub         eax,3  
00007FF73CBA2BEA  cdqe  
00007FF73CBA2BEC  mov         ecx,dword ptr [min]  
00007FF73CBA2BEF  sub         ecx,2  
00007FF73CBA2BF2  movsxd      rcx,ecx  
00007FF73CBA2BF5  mov         rdx,qword ptr [x]  
00007FF73CBA2BFC  mov         rax,qword ptr [rdx+rax*8]  
00007FF73CBA2C00  mov         rdx,qword ptr [x]  
00007FF73CBA2C07  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C0B  mov         ecx,dword ptr [min]  
00007FF73CBA2C0E  dec         ecx  
00007FF73CBA2C10  movsxd      rcx,ecx  
00007FF73CBA2C13  mov         rdx,qword ptr [x]  
00007FF73CBA2C1A  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C1E  movsxd      rcx,dword ptr [min]  
00007FF73CBA2C22  mov         rdx,qword ptr [x]  
00007FF73CBA2C29  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C2D  mov         ecx,dword ptr [min]  
00007FF73CBA2C30  inc         ecx  
00007FF73CBA2C32  movsxd      rcx,ecx  
00007FF73CBA2C35  mov         rdx,qword ptr [x]  
00007FF73CBA2C3C  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C40  mov         ecx,dword ptr [min]  
00007FF73CBA2C43  add         ecx,2  
00007FF73CBA2C46  movsxd      rcx,ecx  
00007FF73CBA2C49  mov         rdx,qword ptr [x]  
00007FF73CBA2C50  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C54  mov         ecx,dword ptr [min]  
00007FF73CBA2C57  add         ecx,3  
00007FF73CBA2C5A  movsxd      rcx,ecx  
00007FF73CBA2C5D  mov         rdx,qword ptr [x]  
00007FF73CBA2C64  add         rax,qword ptr [rdx+rcx*8]  
00007FF73CBA2C68  movsxd      rcx,dword ptr [rbp+24h]  
00007FF73CBA2C6C  mov         rdx,qword ptr [y]  
00007FF73CBA2C73  mov         qword ptr [rdx+rcx*8],rax  
;        min++;
00007FF73CBA2C77  mov         eax,dword ptr [min]  
00007FF73CBA2C7A  inc         eax  
00007FF73CBA2C7C  mov         dword ptr [min],eax  
;    } 
00007FF73CBA2C7F  jmp         CVersionStencil+3Ah (07FF73CBA2BCAh)  
;}