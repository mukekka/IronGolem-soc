;----3.5INCH 1440KB FLOPPY DISK-------------------------------------------------
ASSUME CS:CODE
CODE SEGMENT
    MAIN:
    JMP SHORT BOOT_LOADER
    NOP
    OEM_NAME            DB 'KOIZUMI.'           ;OEM名
    BPB_BYTES_PER_SEC   DW 512                  ;每扇区字节数
    BPB_SEC_PER_CLUS    DB 1                    ;每簇扇区数
    BPB_RSVD_SEC_COUNT  DW 1                    ;BOOT占用扇区数
    BPB_NUM_FATS        DB 2                    ;FAT表数
    BPB_ROOT_ENT_COUNT  DW 512                  ;文件数最大值
    BPB_TOT_SEC16       DW 2880                 ;扇区总数
    BPB_MEDIA           DB 0F0H                 ;介质描述符
    BPB_FAT_SIZE_16     DW 9                    ;每FAT扇区数
    BPB_SEC_PER_TRACK   DW 18                   ;每磁道扇区数
    BPB_NUM_HEADS       DW 2                    ;磁头数
    BPB_HIDD_SEC        DB 00,00,00,00          ;隐藏扇区数
    BPB_TOT_SEC32       DB 00,00,00,00          ;若BPB_FAT_SIZE_16=0,由此记录
    BS_DRV_NUN          DB 00H                  ;INT13H驱动器号
    BS_RESERVEDL        DB ?                    ;NULL
    BS_BOOT_SIG         DB 029H                 ;扩展引导标记
    BS_VOL_ID           DB 00H,00H,00H,01H      ;卷序列号
    BS_VOL_LAB          DB 'NO NAME    '        ;卷标
    BS_FILE_SYS_TYPE    DB 'FAT12   '           ;文件系统类型

    BOOT_LOADER:
        MOV DX,03D4H
        MOV AL,0AH
        OUT DX,AL
        INC DX
        MOV AL,20H
        OUT DX,AL

        MOV AL,00110110B
        OUT 43H,AL
        MOV AX,59659
        OUT 40H,AL
        XCHG AL,AH
        OUT 40H,AL

        MOV AX,0B800H
        MOV DS,AX
        MOV BYTE PTR DS:[0002],'#'

        STI 

        REPLAY:

        MOV BYTE PTR DS:[00A0H],'O'
        MOV BYTE PTR DS:[00A2H],'o'
        MOV BYTE PTR DS:[00A4H],'O'
        MOV BYTE PTR DS:[0142H],'o'
        HLT
        HLT
        HLT
        HLT

        MOV BYTE PTR DS:[00A0H],'o'
        MOV BYTE PTR DS:[00A2H],'O'
        MOV BYTE PTR DS:[00A4H],'o'
        MOV BYTE PTR DS:[0142H],'O'
        HLT
        HLT
        HLT
        HLT
        JMP REPLAY

    DB 510 - (THIS FAR - MAIN) DUP (00)
    DB 055H,0AAH

CODE ENDS
END