ASSUME CS:CODE
CODE SEGMENT
START:
        MOV DX,03D4H
        MOV AL,0FH
        OUT DX,AL
        MOV AL,040H
        INC DX
        OUT DX,AL
        DEC DX
        MOV AL,0EH
        OUT DX,AL
        MOV AL,01
        INC DX
        OUT DX,AL

        MOV AL,00110110B
        OUT 43H,AL
        MOV AX,59659
        OUT 40H,AL
        XCHG AL,AH
        OUT 40H,AL

        MOV AX,0B800H
        MOV DS,AX
        MOV BYTE PTR DS:[0002H],'#'

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
        MOV BYTE PTR DS:[0142H],'o'

        HLT
        HLT
        HLT
        HLT
        JMP REPLAY

        DB 436 DUP (00)
        DB 055H,0AAH

CODE ENDS
END START

