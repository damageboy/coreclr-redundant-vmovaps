; ================================================================================
; superfluous_mov.Program.BugBugBug()
; 207 (0xCF) bytes
; 53 (0x35) instructions

00007F6724940780 55                   push    rbp
00007F6724940781 4157                 push    r15
00007F6724940783 4156                 push    r14
00007F6724940785 4155                 push    r13
00007F6724940787 4154                 push    r12
00007F6724940789 53                   push    rbx
00007F672494078A 4883EC28             sub     rsp,28h
00007F672494078E C5F877               vzeroupper
00007F6724940791 488D6C2450           lea     rbp,[rsp+50h]

;             var P = Vector256.Create(100);
00007F6724940796 BF64000000           mov     edi,64h
00007F672494079B C5F96EC7             vmovd   xmm0,edi
00007F672494079F C4E27D58C0           vpbroadcastd ymm0,xmm0

;             var e0 = P.GetElement(0);
00007F67249407A4 C5FC28C8             vmovaps ymm1,ymm0
00007F67249407A8 C5F97ECB             vmovd   ebx,xmm1

;             var e1 = P.GetElement(1);
00007F67249407AC C5FC28C8             vmovaps ymm1,ymm0
00007F67249407B0 C4C37916CE01         vpextrd r14d,xmm1,1

;             var e2 = P.GetElement(2);
00007F67249407B6 C5FC28C8             vmovaps ymm1,ymm0
00007F67249407BA C4C37916CF02         vpextrd r15d,xmm1,2

;             var e3 = P.GetElement(3);
00007F67249407C0 C4C37916C403         vpextrd r12d,xmm0,3

;             Console.WriteLine($"{e0+e1+e2+e3}");
00007F67249407C6 48BFE8A09B24677F0000 mov     rdi,offset methodtable(System.Int32)
00007F67249407D0 E84BBC3679           call    CORINFO_HELP_NEWSFAST
00007F67249407D5 4C8BE8               mov     r13,rax
00007F67249407D8 4103DE               add     ebx,r14d
00007F67249407DB 4103DF               add     ebx,r15d
00007F67249407DE 4103DC               add     ebx,r12d
00007F67249407E1 41895D08             mov     [r13+8],ebx
00007F67249407E5 48BFC0BDF323677F0000 mov     rdi,7F6723F3BDC0h
00007F67249407EF BE29010000           mov     esi,129h
00007F67249407F4 E807DF3F79           call    CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
00007F67249407F9 48BE60F3FF0B677F0000 mov     rsi,7F670BFFF360h
00007F6724940803 488B36               mov     rsi,[rsi]
00007F6724940806 33FF                 xor     edi,edi
00007F6724940808 33C0                 xor     eax,eax
00007F672494080A 4C892C24             mov     [rsp],r13
00007F672494080E 48897C2408           mov     [rsp+8],rdi
00007F6724940813 4889442410           mov     [rsp+10h],rax
00007F6724940818 4889742418           mov     [rsp+18h],rsi
00007F672494081D 48BEB810000C677F0000 mov     rsi,7F670C0010B8h
00007F6724940827 488B36               mov     rsi,[rsi]
00007F672494082A E8593CFFFF           call    System.String.FormatHelper(System.IFormatProvider, System.String, System.ParamsArray)
00007F672494082F 488BF8               mov     rdi,rax
00007F6724940832 E879F7FFFF           call    System.Console.WriteLine(System.String)

;             Console.ReadLine();
00007F6724940837 E86CFAFFFF           call    System.Console.ReadLine()

;         }
00007F672494083C 90                   nop
00007F672494083D C5F877               vzeroupper
00007F6724940840 488D65D8             lea     rsp,[rbp-28h]
00007F6724940844 5B                   pop     rbx
00007F6724940845 415C                 pop     r12
00007F6724940847 415D                 pop     r13
00007F6724940849 415E                 pop     r14
00007F672494084B 415F                 pop     r15
00007F672494084D 5D                   pop     rbp
00007F672494084E C3                   ret

; ================================================================================
; superfluous_mov.Program.Main(System.String[])
; 26 (0x1A) bytes
; 9 (0x9) instructions

00007F672493FF80 55                   push    rbp
00007F672493FF81 4883EC10             sub     rsp,10h
00007F672493FF85 488D6C2410           lea     rbp,[rsp+10h]
00007F672493FF8A 48897DF8             mov     [rbp-8],rdi

;             BugBugBug();
00007F672493FF8E E805BFFFFF           call    superfluous_mov.Program.BugBugBug()

;         }
00007F672493FF93 90                   nop
00007F672493FF94 488D6500             lea     rsp,[rbp]
00007F672493FF98 5D                   pop     rbp
00007F672493FF99 C3                   ret
