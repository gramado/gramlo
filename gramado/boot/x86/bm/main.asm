;
; File: bm/main.asm 
;
; #todo
; Refazer esses comentários. 
;
; Descri��o:
;     Esse � o arquivo principal de BM.BIN.
;     Foi carregado pelo MBR.  
;     O objetivo � carregar BL.BIN na mem�ria e passar o comando para ele.
; 
;     *** Importante: @todo: Um novo nome deve ser criado.
;     Arquivo principal do System4Nora. (Come�a com o BM).
;
; *Importante:
; + O arquivo main.asm faz uma sequ�ncia de inclus�es de m�dulos que comp�em 
; o Boot manager, come�ando pelos m�dulos de 16bit e depois os m�dulos de 
; 32bit. 
; + O arquivo header32.inc deve ficar no in�cio das inclus�es dos m�dulos de 
; 32bit, para que os m�dulos de 32bit possam utiliza-lo adequadamente.
;
;Sobre o sistema System4Nora: (#cancelado)
;========================================
;    O sistema � chamado SYSTEM.VHD.
;    � um VHD de 32 MB feito em assembly. (NASM).
;    Comt�m 4 programas compilados juntos.
;    S�o eles:
;    
;       1, Boot Manager (16 e 32 bit).
;       2, Boot Loader (32 bit). (@todo)
;       3, Kernel (32 bit).      (@todo)
;       4, Browser (32 bits).    (@todo)
;       
;    Obs: 
;    ====
;        *IMPORTANTE: Os 4 programas do System4Nora
;                     podem usar as bibliotecas de 32bit
;                     que pertencem ao Boot Manager.
;
;       *O System4Nora permite a inicializa��o no Modo Texto e
;        e no Modo Gr�fico. A sele��o do modo � feita no arquivo stage2.inc.
;        mas a sele��o do modo de iniciliza��o poder� ser feita pelo
;        usu�rio administrador e pelo desenvolvedor.
;
;  1) Sobre o Boot Manager do System4Nora:
;       Faz a inicializa��o em 16 bits.
;
;  2) Sobre o Boot Loader do System4Nora:
;       � um Boot Loader interno que carrega o kernel interno
;
;  3) Sobre o Kernel do System4Nora:
;         O Kernel � m�nimo, monotarefa.
;         Tecnologia semelhante ao DPMI.
;         Os recursos do System4Nora podem
;         ser acessados atrav�s de um Shell interno.
;         usado pelo desenvolvedor para gerenciamento de
;         inicializa��o.         
;       
;  4) Sobre o Browser do System4Nora:
;        O Browser � a interface gr�fica. � a �rea de trabalho onde
;        aparecer�o as p�ginas em html, os atalhos para as aplica��es
;        ou os gerenciadores do sistema.
;        Essa inteface gr�fica assim como o shell interno ser�
;        usada para gerenciamento de inicializa��o.
;
;Sobre o subsistema:
;===================
;    O subsistema � chamado SYSTEM.BIN.
;    � um programa em user mode feito em C.
;    Ser�o usados os c�digos do Boot Loader em C e
;    do Kernel em C, j� feitos.
;    A atribui��o do subsistema � ser uma interface
;    entre as aplica��es em user mode e o kernel em assembly.
;     
; Sobre as aplica��es:
; ===================
;     As aplica��es s�o programas feitos em C 32bit.
;     Rodam em user mode.
;
; @todo: Filtrar as informa�oes abaixo nesse coment�rio.
;
; Sobre o Boot Manager contido no System4Nora:
; ============================================
;     O Boot Manager � a primeira parte do System4Nora, ele come�a com um MBR 
; em 16bit e stage 2 em 16bit depois muda pra 32bit.
; 
;     Arquivo principal do Boot Manager.
;     M0 - M�dulos em ring0.
;
;     Boot Manager 16bit via BIOS.
;     Para HD IDE.
;     Tamanho = 32KB.
;
; Video modes:
; ============
; VirtualBox:
; Oracle VirtualBox: 0x0112   640x480x24bpp
; Oracle VirtualBox: 0x0115   800x600x24BPP
; Oracle VirtualBox: 0x0118  1024x768x24BPP
;
; Nvidia GeForce:  
; GeForce_8400_GS equ 0x06E4  
; GeForce 8400 GS: 0x0115   800x600x32BPP
;
; Obs: A resolu��o usada por enquanto em 32bit � 800x600x24BPP.
; 
; Continua ...
;
; OBS: 
;     O Boot Loader (BL.BIN) pode querer configurar o modo de v�deo. Ent�o ele 
; salva o modo no metafile e reinicia a m�quina. Para isso o Boot Manager deve 
; apenas pegar o valor que esta no metafile e n�o editar o metafile.
;
; Autor: Frederico Martins Nora - (frednora)
;
; History:
;     (2005-2016) - Created by Fred Nora. 
;---------------------------------------------------


;;
;; #importante
;; O arquivo foi carregado em 0:8000. Fica mais f�cil lidar com a gdt 
;; configurando o org em 0x8000 e colocando os segmentos em 0.
;;


[ORG 0x8000]


;;====================================================
;;    ****    Entry point do Boot Manager    ****    ;;
;;====================================================


;;
;;   ## VIDEO MODE ##
;;

;
; 0x4112 is 640x480x24bit
; 0x4115 is 800x600x24bit
; 0x4118 is 1024x768x24bit 
; 0x411B is 1280x1024x24bit

;Mode 0x100: 640x400x8bpp
;Mode 0x101: 640x480x8bpp
;Mode 0x102: 800x600x4bpp 4 1F
;Mode 0x103: 800x600x8bpp
;Mode 0x104: 1024x768x4bpp 4 1F
;Mode 0x105: 1024x768x8bpp
;Mode 0x106: 1280x1024x4bpp 4 1F
;Mode 0x107: 1280x1024x8bpp
;Mode 0x10D: 320x200x15bpp 1 9B
;Mode 0x10E: 320x200x16bpp
;Mode 0x10F: 320x200x24bpp 1 9B
;Mode 0x110: 640x480x15bpp 1 9B
;Mode 0x111: 640x480x16bpp
;Mode 0x112: 640x480x24bpp 1 9B
;Mode 0x113: 800x600x15bpp 1 9B
;Mode 0x114: 800x600x16bpp
;Mode 0x115: 800x600x24bpp 1 9B
;Mode 0x116: 1024x768x15bpp 1 9B
;Mode 0x117: 1024x768x16bpp
;Mode 0x118: 1024x768x24bpp 1 9B
;Mode 0x119: 1280x1024x15bpp 1 9B
;Mode 0x11A: 1280x1024x16bpp
;Mode 0x11B: 1280x1024x24bpp 1 9B

;Mode 0x140: 320x200x32bpp
;Mode 0x141: 640x400x32bpp
;Mode 0x142: 640x480x32bpp
;Mode 0x143: 800x600x32bpp
;Mode 0x144: 1024x768x32bpp
;Mode 0x145: 1280x1024x32bpp

;Mode 0x146: 320x200x8bpp
;Mode 0x147: 1600x1200x32bpp
;Mode 0x148: 1152x864x8bpp
;Mode 0x149: 1152x864x15bpp 1 9B
;Mode 0x14A: 1152x864x16bpp
;Mode 0x14B: 1152x864x24bpp 1 9B
;Mode 0x14C: 1152x864x32bpp
;Mode 0x160: 3840x2160x16bpp
;Mode 0x161: 3840x2160x32bpp


;; #importante
;; use isso para selecionar o modo de video.
;;

;; 24bpp
;; funcionaram na oracle virtual box.
;;G_VIDEO_MODE EQU 0x112
;;G_VIDEO_MODE EQU 0x115
;;G_VIDEO_MODE EQU 0x118
;;G_VIDEO_MODE EQU 0x11B
;;...


;;32bpp
;;G_VIDEO_MODE EQU 0x140  ;;320x200x32
;;G_VIDEO_MODE EQU 0x141  ;;640x400x32 
;;G_VIDEO_MODE EQU 0x142  ;;640x480x32 
;;G_VIDEO_MODE EQU 0x143  ;;800x600x32bpp
;;G_VIDEO_MODE EQU 0x144  ;;1024x768x32 
;;G_VIDEO_MODE EQU 0x145  ;;#bugbug


; Nvidia GeForce:  
; GeForce 8400 GS: 0x0115   800x600x32BPP


;G_VIDEO_MODE EQU 0x0112     ;640x480
G_VIDEO_MODE EQU 0x0115     ;800x600
;G_VIDEO_MODE EQU 0x0118     ;1024x768
;..



;;
;; GUI FLAG.
;;

;; 1 = Starts system GUI.
;; 0 = Starts the Boot Manager CLI.

;G_START_GUI EQU 1  ;; 1= (YES) 0 = (NO)  
G_START_GUI EQU 0  ;; 1= (YES) 0 = (NO)  


;;
;; 16 bit: 
;; Estamos no primeiro setor do BM.BIN, ele come�a em 16 bit.
;;


[bits 16]



;; #importante
;; Entrypoint do BM.BIN
;; Saltaremos a �rea de dados no in�cio do arquivo.

bm_main:    

    jmp START_AFTER_DATA

ROOTDIRSTART EQU (bootmanagerOEM_ID)
ROOTDIRSIZE  EQU (bootmanagerOEM_ID+4)

bootmanagerOEM_ID                db "QUASI-OS"
bootmanagerBytesPerSector        dw 0x0200
bootmanagerSectorsPerCluster     db 1
bootmanagerReservedSectors       dw 62
bootmanagerTotalFATs             db 0x02
bootmanagerMaxRootEntries        dw 0x0200
bootmanagerTotalSectorsSmall     dw 0x0000
bootmanagerMediaDescriptor       db 0xF8
bootmanagerSectorsPerFAT         dw 246
bootmanagerSectorsPerTrack       dw 0x11
bootmanagerNumHeads              dw 4
bootmanagerHiddenSectors         dd 5       ;; 1+1+3 (mbr+vbr+reserved sectors depois do vbr)
bootmanagerTotalSectorsLarge     dd 0
bootmanagerDriveNumber           db 0x80
bootmanagerFlags                 db 0x00
bootmanagerSignature             db 0x29
bootmanagerVolumeID              dd 0x980E63F5
bootmanagerVolumeLabel           db "QUASI  BMBM"
bootmanagerSystemID              db "FAT16   "

;;
;; Salvando alguns argumentos passados pelo MBR. 
save_cylinder_numbers: dw 0  ;N�mero de cilindros do disco.
;;...



;;====================================================================


;;
;; Real entry point.
;; 

;; #importante: 
;; O �nico argumento passado pelo MBR foi o n�mero do disco.
;; IN: dl = Disk number.

;; /dev/sda - 0x80
;; /dev/sdb - 0x81
;; /dev/sdc - 0x82
;; /dev/sdd - 0x83


START_AFTER_DATA:

    ; Set up registers.
    ; Adjust segment registers and stack.
    ; Code located at 0000:0x8000. 
    ; Stack located at 0000:0x6000.

    
    cli
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ax, 0x0000
    mov ss, ax
    mov sp, 0x6000   
    sti


    ;
    ; Save disk number.
    ;

    mov byte [bootmanagerDriveNumber], dl
    mov byte [META$FILE.DISK_NUMBER], dl  
    mov byte [DISKINFO16_disk_number], dl  

    ;;
    ;; Get disk info.
    ;;

;;========================================
;;getDiskInfo:

    ; Get drive parameters: 
    ; =====================
    ; Return: CF set on error.
    ; AH = status (07h).
    ; CF clear if successful.
    ; AH = 00h.
    ; AL = 00h on at least some BIOSes.
    ; BL = drive type (AT/PS2 floppies only). 
    ; CH = low eight bits of maximum cylinder number.
    ; CL = maximum sector number (bits 5-0).
    ;      high two bits of maximum cylinder number (bits 7-6).
    ; DH = maximum head number.
    ; DL = number of drives.

    xor ax, ax
    mov ah, byte 08h
    int 0x13 

	;
	;Heads.
	;N�mero de heads.
	;Logical last index of heads = (number_of - 1). 
	;(Because index starts with 0).
	;
	; Obs: 
	; O valor de Heads foi gravado no BPB mas precisar� ser passado a diante
	; para uso posterior.
	;

    xor ax, ax
    mov al, dh
    inc ax                            ;From 0-based to count.
    ;Number of heads.
    mov word [bootmanagerNumHeads], ax
    mov word [META$FILE.HEADS], ax
    mov word [DISKINFO16_heads], ax

    ;
    ; Sectors Per Track e Cylinders.
    ; Essas informa��es apresentam meio truncadas
    ; O valor do n�mero de cilindros � aprentado
    ; de forma parcial, uma parte em cada registrador.
    ;


	;spt.
	;  bits [5:0] logical last index of sectors per track = number_of 
	;  (because index starts with 1).
	;cyl.
	;   bits [7:6] [15:8] logical last index of cylinders = number_of - 1 
	;  (because index starts with 0).

    
    ; Sectors Per Track - (SPT).
    ; "Esconde 2 bits que pertencem a quantidade de setores".
    ;
    ; Obs: 
    ; O valor de SPT foi gravado no BPB mas precisar� 
    ; ser passado a diante para uso posterior.

    xor eax, eax 
    mov al, cl
    and al, byte 00111111b             ;03Fh
    mov byte [SectorsPerTrack], al    ;BPB (word).
    ;Sectors per track.
    mov ah, 0                                  ; enviamos apenas 'al' 
    mov word [bootmanagerSectorsPerTrack], ax  ; enviamos apenas 'al'
    mov word [META$FILE.SPT], ax
    mov word [DISKINFO16_spt], ax   


    ; Cylinders
    ; Obs: 
    ; O valor de CylinderNumbers foi gravado em vari�vel mas precisar� ser 
    ; passado a diante para uso posterior.

    xor eax, eax
    mov al, cl                 ; Two high bits of cylinder number in bits 6&7.
    and al, 11000000b          ; Mask it.
    shl ax, 2                  ; Move them to bits 8&9.
    mov al, ch                 ; Rest of the cylinder bits.(low 8 bits)
    inc eax                    ; Number is 0-based.
    ; N�mero de cilindros do disco.
    mov word [save_cylinder_numbers], ax
    mov word [META$FILE.CYLINDERS], ax
    mov word [DISKINFO16_cylinders], ax


    ;;
    ;;========================================
    ;;
   
    ;;
    ;; Carregar root.
    ;;

bootmanagerLOAD_ROOT:
    
    ;Compute size of root directory and store in "cx".
    
    xor cx, cx
    xor dx, dx
    mov ax, 0x0020                          ; 32 byte directory entry.
    mul WORD [bootmanagerMaxRootEntries]    ; Total size of directory.
    div WORD [bootmanagerBytesPerSector]    ; Sectors used by directory.
    mov word [ROOTDIRSIZE], ax
    mov cx, ax
    ;xchg ax, cx
 
    ;Compute location(LBA) of root directory and store in "ax".
    xor ax, ax
    mov al, BYTE [bootmanagerTotalFATs]                   ; Number of FATs.
    mul WORD [bootmanagerSectorsPerFAT]              ; Sectors used by FATs.
    add ax, WORD [bootmanagerReservedSectors]    ; Adjust for bootsector.
    add ax, WORD [bootmanagerHiddenSectors]

    ; Nesse momento ax contem o setor inicial do root dir 

    mov word [ROOTDIRSTART], ax   
    add  ax, cx
    mov WORD [bootmanagerdatasector], ax     ; base of root directory
    ;Read root directory into memory (0:1000) ?
    ;mov WORD [bootmanagerdatasector], 591  ;;SIMULADO In�cio da �rea de dados.


    mov ax, word [ROOTDIRSTART]    ; In�cio do root.
    mov cx, word [ROOTDIRSIZE]       ; Tamanho do root.
    mov bx, 0x1000                             ; root_buffer. Copy root dir above bootcode
    call bootmanagerReadSectors

    pusha
    mov si, bootmanagermsgCRLF
    call bootmanagerDisplayMessage
    popa


    ;Debug breakpoint.
    ;jmp $


    ;Browse root directory for binary image.
    mov cx, WORD [bootmanagerMaxRootEntries]    ; Load loop counter.
    mov di, 0x1000                              ; root_buffer, 0x1000, locate first root entry. ?
.bootmanagerLOOP:
    push cx
    mov cx, 0x000B                    ; eleven character name
    mov si, bootmanagerImageName      ; image name to find
    pusha
    call bootmanagerDisplayMessage
    popa
    push di
    rep cmpsb                         ; test for entry match
    pop di
    je bootmanagerLOAD_FAT
    pop cx
    add di, 0x0020                    ; queue next directory entry
    loop .bootmanagerLOOP
    jmp bootmanagerFAILURE

    ;;
    ;;  Load FAT.
    ;;

;; Se o nome for encontrado.
bootmanagerLOAD_FAT:
    pusha
    mov si, bootmanagermsgFAT
    call bootmanagerDisplayMessage
    popa


    ; Debug breakpoint.
    ;mov ah, 0x00
    ;int 0x16


    ; Save starting cluster of boot image.
    mov dx, WORD [di + 0x001A]
    mov WORD [bootmanagercluster], dx             ; file's first cluster.

    ;;
    ;; #BUGBUG 
    ;; N�O ESTAMOS CARREGANDO A FAT INTEIRA.
    ;; CARREGAR A FAT INTEIRA D� PROBLEMA.
    ;;
 
 
    ; Read FAT into memory (es:bx).?? Onde ??
    ; ?? 0:0x1000 
    ; ?? Qual � o segmento e o offset da FAT ??

    mov ax, 0 
    mov es, ax


    ; Compute location of FAT and store in "ax".
    mov ax, WORD [bootmanagerHiddenSectors]       ; adjust for bootsector.
    add ax, WORD [bootmanagerReservedSectors]     ; lba inicial da fat ?.
    mov cx, 8         ; (apenas 8 setores da fat.) (246/2)  ;; metade da fat  WORD [bootmanagerSectorsPerFAT]
    mov bx, 0x1000    ; fat_buffer ; copy FAT above bootcode.
    call bootmanagerReadSectors


	;;
	;; Nesse momento j� carregamos a FAT.
	;;


	;Debug breakpoint. 
	;jmp $


    ;;
    ;; Message.
    ;;


    ; Read image file into memory (0x2000:0)(es:bx)
    
    ;Mensagem.
    mov si, bootmanagermsgImg
    call bootmanagerDisplayMessage

    ; Op��o de mensagem.
    ; mov si, bootmanagermsgCRLF
    ; call bootmanagerDisplayMessage



    ;;
    ;; Load image.
    ;;



    ; Destination for the image.
    ; es:bx = (2000:0).

    mov ax, 0x2000 
    mov es, ax
    mov bx, 0x0000
     
    ;;
    ;; Ajust fat segment.
    ;; 
     
    ;gs:bx para a FAT.

    
    ;; ??
    ;; Salva o offset da imagem.
    push bx    


    ; FAT segment.
    mov ax, 0 
    mov gs, ax     


    ;;
    ;; Loading the image.
    ;;


bootmanagerLOAD_IMAGE:

    mov ax, WORD [bootmanagercluster]    ; Cluster to read.
    pop bx                          ;Buffer to read into (offset da imagem).
    call bootmanagerClusterLBA         ;Convert cluster to LBA.

    xor cx, cx
    mov cl, BYTE 1    ;[bootmanagerSectorsPerCluster] ;sectors to read.
    call bootmanagerReadSectors

    push bx
    ;Compute next cluster.
    mov ax, WORD [bootmanagercluster]    ; Identify current cluster.
    add ax, ax                                                ; 16 bit(2 byte) FAT entry.
    mov bx, 0x1000                                       ; fat_buffer, offset.
    add bx, ax                                                ; Index into FAT.
    ;TESTANDO...
    mov dx, WORD [gs:bx]                           ; Read two bytes from FAT.
.bootmanagerDONE:
    mov WORD [bootmanagercluster], dx    ; store new cluster.

    ;EOF.
    cmp dx, 0xFFFF                       ; 0x0FF0 test for end of file.
    jne bootmanagerLOAD_IMAGE
    ;jnb bootmanagerLOAD_IMAGE ;Op��o. 
bootmanagerDONE:

    ;Op��o de mensagem.
    ;mov si, bootmanagermsgCRLF
    ;call bootmanagerDisplayMessage

    ;;========================
    ;; Aten��o:
    ;;     Esse � primeiro setor do BM.BIN, ele ir� carregar o arquivo BL.BIN 
    ;; e ir� passar o comando para o stage 2 do (BM).
    ;;=======================	

    ;Mensagem de sucesso.
    mov si, bootmanagermsgOK 
    call bootmanagerDisplayMessage

	;Debug breakpoint.
	;jmp $

	;; ===================================
	;; *Importante:
	;;
	;; >> Nesse momento j� conseguimos carregar o BL.BIN em 0x2000:0. Agora 
	;; passamos o comando para o stage2 do BM, onde configuramos o m�quina,
	;; entramos em modo gr�fico, em modo protegido e por fim entramos no 
	;; mini-shell do BM.
	;; >> Observe que o in�cio do BM est� em 16bit. Aproveitamos isso para
	;; carregarmos o arquivo BL.BIN com a ajuda dos recursos do BIOS. Isso
	;; nos oferece um pouco de tranquilidade. Ent�o, j� que o BM, cumpriu 
	;; seu principal objetivo logo no in�cio do c�digo, podemos usar o resto 
	;; dele para rotinas mais detalhadas de obten��o de informa��es sobre a 
	;; arquitetura x86. Assim podemos passar para o BL.BIN o maior n�mero de 
	;; inform��es poss�veis, e deix�-lo em um estado confort�vel.
	;; Sendo assim, o BM.BIN, pode ser um programa com um tamanho um pouco 
	;; maior, mas talvez isso torne o trabalho o MBR mais dif�cil.
	;; =====================================



; Go!
; Agora saltamos para a trap que existe no in�cio do META$FILE.
; Trap 1. (isso est� nesse arquivo mesmo)

.goToFisrtTrap:

    push WORD 0
    push WORD AFTER_DATA  
    retf



;;===============================
; Fail. 
;     #todo: Colocar uma mensagem de erro.
;

bootmanagerFAILURE:

    int 0x18
    jmp $


    ;mov ax, 0x8000 
    ;mov ds, ax
    ;mov es, ax

    ;mov  si, bootmanagermsgFailure
    ;call  bootmanagerDisplayMessage
    ;mov  ah, 0x00
    ;int  0x16         ; await keypress
    ;int  0x19         ; warm boot computer





;*****************************************************************
; bootmanagerDisplayMessage:
;     Display ASCIIZ string at "ds:si" via BIOS.
;*****************************************************************

bootmanagerDisplayMessage:

    lodsb                               ; load next character
    or al, al                          ; test for NUL character
    jz .bootmanagerDONE
    mov ah, 0x0E                 ; BIOS teletype
    mov bh, 0x00                 ; display page 0
    mov bl, 0x07                  ; text attribute
    int 0x10                           ; invoke BIOS
    jmp bootmanagerDisplayMessage

.bootmanagerDONE:
    ret



;************************************************************************
; bootmanagerReadSectors:
;     Reads "cx" sectors from disk starting at "ax" into memory location 
; "es:bx".
;     Carrega na mem�ria, em es:bx, 'cx' setores do disco, come�ando pela 
; LBA 'ax'. 
;************************************************************************

bootmanagerReadSectors:

    mov WORD [bootmanagerDAPBuffer], bx
    mov WORD [bootmanagerDAPBuffer+2], es
    mov WORD [bootmanagerDAPStart], ax

.bootmanagerMAIN:
    mov di, 0x0005           ;Five retries for error. (8??)
.bootmanagerSECTORLOOP:
    push ax
    push bx
    push cx

    push si
    mov ah, 0x42
    mov dl, 0x80
    mov si, bootmanagerDAPSizeOfPacket
    int 0x13
    pop si

    jnc .bootmanagerSUCCESS        ; test for read error
    xor ax, ax                              ; BIOS reset disk
    int 0x13                                ; invoke BIOS
    dec di                                  ; decrement error counter
    pop cx
    pop bx
    pop ax
    jnz .bootmanagerSECTORLOOP    ; attempt to read again
    int 0x18
.bootmanagerSUCCESS:
    mov si, bootmanagermsgProgress
    call bootmanagerDisplayMessage
    pop cx
    pop bx
    pop ax
    add bx, WORD [bootmanagerBytesPerSector]           ; queue next buffer
    cmp bx, 0x0000  ;;??
    jne .bootmanagerNextSector
    push ax
    mov ax, es
    add ax, 0x1000
    mov es, ax
    pop ax
.bootmanagerNextSector:
    inc ax                               ; queue next sector
    mov WORD [bootmanagerDAPBuffer], bx    
    mov WORD [bootmanagerDAPStart], ax
    loop .bootmanagerMAIN                ; read next sector
    ret


;*****************************************************
; bootmanagerClusterLBA:
; convert FAT cluster into LBA addressing scheme
; LBA = (cluster - 2) * sectors per cluster
;*****************************************************
bootmanagerClusterLBA:
    sub ax, 0x0002     ; zero base cluster number.
    xor cx, cx
    mov cl, BYTE  1    ;[bootmanagerSectorsPerCluster] ; convert byte to word.
    mul cx
    add ax, WORD 591   ;[bootmanagerdatasector] ; base data sector.(#bugbug Valor determinado.)
    ret


;;
;; Dados de supporte.
;;


;DAP.
bootmanagerDAPSizeOfPacket  db  10h
bootmanagerDAPReserved      db  00h
bootmanagerDAPTransfer      dw  0001h
bootmanagerDAPBuffer        dd  00000000h
bootmanagerDAPStart         dq  0000000000000000h


;Sector, Head, Track.
bootmanagerabsoluteSector   db 0x00
bootmanagerabsoluteHead     db 0x00
bootmanagerabsoluteTrack    db 0x00

;Data sector.
bootmanagerdatasector dw 0x0000

;Cluster.
bootmanagercluster dw 0x0000

;;
;; Messages and strings.
;;

; File name.
bootmanagerImageName    db "BL      BIN" ,0x0D, 0x0A,0x00

; Strings.
bootmanagermsgFAT       db  0x0D, 0x0A,"Loading FAT", 0x0D, 0x0A, 0x00
bootmanagermsgImg       db  "L... I", 0x0D, 0x0A, 0x00
bootmanagermsgFailure   db  0x0D, 0x0A, "ROOT", 0x00
bootmanagermsgFail      db  "Read",0x00
bootmanagermsgSearch    db  "S",0
bootmanagermsgProgress  db  "*", 0x00
bootmanagermsgOK        db  "#",0
bootmanagermsgCRLF      db  0x0D, 0x0A, 0x00
;; ...



;=================
; Obs: Aqui � o fim do Stage1 do Boot Manager.
;

;;
;; ***************************************************************
;;

;=================
; Obs: Aqui � oome�o do Stage2 do Boot Manager.
;



[bits 16]

    ;Stage 2.
    ;Esse � o segundo setor.
    ;*Daqui pra frente temos c�digo de inicializa��o.	
    ;; ** SEGUNDO SETOR ** ;;

    ;;
    ;; ==========================================
    ;;

    ;;%include "stage2.inc"       ;Inicialisa a arquitetura presente.(setup).


; Gramado Boot Manager - This is the stage 2 for the boot manager.
; It's a 16bit/32bit program to make some basic system initialization and 
; to load the Boot Loader program.
; (c) Copyright 2015-2017 Fred Nora.
;
; File: stage2.inc
;
; It starts on second sector.
;
; *Importante:
; O arquivo stage2.inc faz uma sequ�ncia de inclus�es de m�dulos
; de 16bit que comp�em o stage2. Os promeiros devem ser s2metafile.inc 
; e s2header.inc que servir�o de suporte para todos os outros modulos
; do stage2.
;
; *IMPORTANTE:
;      � IMPRESSIND�VEL A POSSIBILIDADE DE CARREGAR O 'BOOT LOADER' USANDO 
; OS RECURSOS DO BIOS DE 16BIT. Esse arquivo deve chamar a rotina de 
; carregamento de arquivo. Obs: J� est� implementada a rotina de carregar 
; um setor usando fat16 em 16bit usando recursos do BIOS.   
;
; Atribui��es:
;     +1 - Configura o sistema. 
;     +2 - Entra no modo de inicializa��o configurado. 
;
; Modo de v�deo do Boot Manager:
; =============================
;     O Boot Manager usa o modo de texto, mas configura o modo de video
; de acordo com as especifica��es do metafile que est� no segundo setor.
;
; Estado dos registradores:
; ========================
; O 'stage2 e o resto do Boot Manager' s�o carregados em 0000h:1000h pelo 
; stage1 (MBR).
; O stage 2 inicia com os seguintes valores nos registradores:
;
;       ;cs:ip. 
;       CS = 0x0000
;       IP = 0x1000
;
;       ;Segmentos.
;       DS = 0x0000
;       ES = 0x0000
;
;       ;ss:sp. 
;       SS = 0x0000
;       SP = 0x0E00
;
;       SI = Bios Parameter Block
;
;       BX = Magic number (0xF0ED).
;       AX = Number of heads.
;       DL = Drive number.
;       CL = Sectors per track.
;
; Memory map:
; ==========
;     +VBR        = 8000:7c00 (Primeiro setor da parti��o ativa).
;     +FAT        = 6000:0000
;     +ROOT       = 4000:0000
;     +BootLoader = 2000:0000
;
; Informa��es sobre as parti��es:
; ==============================
; Parti��o 0 - (31MB).
;     vbr  - ?    
;     fat1 - ?
;     fat2 - ?
;     root - ?
;     data - ?
; Parti��o 1 - N�o usada.
; Parti��o 2 - N�o usada.
; Parti��o 3 - N�o usada.
;
; OBS: 
; � importante receber bem os par�metros de disco passados pelo stage1. 
; O stage2 salva os par�metros de disco no META$FILE carregado na mem�ria. 
; (vol�til).  
;
; Hist�rico:
;     2015 - Created.
;     2016 - Revision.
;     2017 - Revision.
;     ...  
;



;
; Algumas constantes usadas pelo stage 2.
; Obs: Por conveni�ncia, o desenvolvedor pode manipular essas constantes.
;

;;Tipos de bootloader que poder�o ser carregados pelo boot manager.
;BOOTLOADER_TYPE_NONE      EQU 0  ;Sem tipo definido. Negligenciado.
;BOOTLOADER_TYPE_GRAMADO   EQU 1  ;Boot Loader do sistema operacional Gramado.
;BOOTLOADER_TYPE_MULTIBOOT EQU 1  ;Usando o padr�o multiboot.
;BOOTLOADER_TYPE_UNKNOW    EQU 2  ;Desconhecido.
;;...

;==========================================
; *Importante:
;     nesse momento determinamos a localiza��o, no disco, dos elementos do 
; sistema de arquivos FAT16.
; N�o � isso o que queremos. Essas informa��es precisam ser obtidas atrav�s 
; de rotinas de sondagem. 
;


; stage 2.
CODE_SEGMENT       equ  0
DATA_SEGMENT        equ  0
STACK_SEGMENT      equ  0
STACK_POINTER       equ  0x6000

; vbr.
VBR_SEGMENT         equ  8000H
VBR_OFFSET            equ  7C00H
VBR_LBA                  equ  63

; fat.
FAT_SEGMENT         equ  6000H
FAT_OFFSET            equ  0
FAT_LBA                  equ  67

; root.
ROOT_SEGMENT     equ  4000H
ROOT_OFFSET        equ  0
ROOT_LBA              equ  559


;;========================
;; Aqui est� a localiza��o do bootloader na mem�ria. 
;; A LBAn�o importa, pois ele foi carregado do sistema sistema de 
;; arquivos e a LBA inicial dele estava armazenada na entrada do 
;; diret�rio raiz.
;;

;Boot Loader.
BL_SEGMENT         equ  2000H
BL_OFFSET            equ  0
BL_LBA                  equ  0


;--------------------------------------- 
;Algum suporte para cores no modo texto. 
;BLUE    equ     01f00h
;RED     equ     02f00h        
;GREEN   equ     04f00h


;==================================
; stage2_main:
;
;     In�cio do stage 2. 
;
;     O endere�o do stage 2 � 0000H:1000H.
;     O stage 2 fica no segundo setor do disco.
;-------------------------------------------------

stage2_main:

    PUSH 0 
    PUSH AFTER_DATA 
    RETF

    ;
    ; ========== Includes. =========
    ;

    ; metafile.
    %include "s2metafile.inc"

    ;header.
    %include "s2header.inc"

    ;bpb.
    %include "s2bpb.inc"

    ;dados.
    %include "s2gdt.inc"


    ;;===============================
    ;; #importante
    ;; Foi possivel passar para BL.BIN Os dados de s2vesa.inc
    ;; Vamos tentar passar os dados de s2config16.inc, pois esta
    ;; relativamente proximo.
    %include "s2vesa.inc"  
    %include "s2config16.inc"  
    ;; ================================


    ; lib.
    %include "s2a20.inc"
    %include "s2lib.inc"
    %include "s2fat12.inc"
    %include "s2fat16.inc"
    %include "s2menu16.inc"
    %include "s2modes.inc"
    %include "s2detect.inc"
    %include "lib16.inc"  ;;lib16
    ;; continua ...



;------------------------------------------
; AFTER_DATA:
;     In�cio real do stage 2.
;     A primeira coisa a se fazer � salvar os par�metros de 
; disco passados pelo stage1.
;
; Argumentos recebidos:
;     bx = Magic number. (autoriza��o)
;     ax = Number of heads.
;     dl = Drive number.
;     cl = Sectors per track.
;     si = BPB.
;

AFTER_DATA:


    ; Message.
    ; Boot Manager Splash.

    mov ax, 0 
    mov ds, ax
    mov es, ax 

    mov si, msg_bm_splash
    call DisplayMessage

    ; Debug.
    ; jmp $

;; Checar se a assinatura PE est� na mem�ria, se estiver, pularemos e
;; a etapa de carregamento do arquivo.
;; #todo
;; Rever essa assinatudo, pois tudo no sistema agora usa ELF.

xxx_checkSig:

    mov ax, 0x2000
    mov gs, ax 

    ; Testando o 4C
    xor bx, bx
    mov al, byte [gs:bx]    ; 0x2000:0 
    cmp al, byte 0x4C         ;'L' primeiro byte
    jne .sigNotFound

    ; Testando o 01
    mov bx, 1
    mov al, byte [gs:bx]    ; 0x2000:1 
    cmp al, byte 0x01         ; Segundo byte
    jne .sigNotFound

    ; Se os dois char n�o est�o ausentes, 
    ; significa que o arquivo eta no lugar.
    jmp .sigFound

    ;;
    ;; Not found
    ;;

    ; A assinatura n�o foi encontrada,
    ; o arqui n�o est� na mem�ria.
    
.sigNotFound:
    
    ;; message: 
    ;; O arquivo n�o esta presente na mem�ria.
    
    mov si, stage2_msg_pe_sig
    call DisplayMessage

.sigHalt:
    hlt
    jmp .sigHalt


    ;;
    ;; Found.
    ;;


;; A assinatura foi encontrada ... 
;; prosseguimos com o stage2.

.sigFound:

    ;; message: 
    ;; O arquivo esta presente na mem�ria.

    mov si, stage2_msg_pe_sigOK
    call DisplayMessage

    ;debug
    ;jmp $


xxx_turnoffFDCMotor:

    mov dx, 3F2h 
    mov al, 0 
    out dx, al

xxx_setupRegisters:

    cli
    mov ax, 0 
    mov ds, ax
    mov es, ax
    ;mov fs, ax  
    ;mov gs, ax 
    xor ax, ax
    mov ss, ax
    mov sp, 0x6000 
    xor dx, dx
    xor cx, cx
    xor bx, bx
    xor ax, ax
    sti


    ; Enable a20 line.
xxx_setupA20:

    pusha
    call A20_enable
    mov si, msg_a20
    call DisplayMessage
    popa


    ;;
    ;; Config
    ;;

    ; Configurando o modo de inicializa��o do Boot Manager:
    ; ======================================
    ; Seleciona um modo de inicializa�ao para o Boot Manager.
    ; A op��o est� salva no metafile do Boot Mananger.
    ; Op��es:
    ;     +1 ~ Shell do boot manager.
    ;     +2 ~ GUI

xxx_Config:

    ;
    ; Configura o metafile. META$FILE.INIT_MODE = al
    ;

.setupBootMode:

    ; Message
    mov si, msg_selecting_videomode
    call DisplayMessage

    ; Debug
    ; JMP $


.preSelection:

    ; #important:
    ; It gets a global configurable variable.
    ; See the in the top of this document.
    ; 1=gui 2=text

    mov al, G_START_GUI 

    cmp al, 1
    je .xxxxGUI

    cmp al, 0
    je .xxxxCLI

    jmp .xxxxGUI


; text mode.
;   ## SET UP BOOT MODE ##
.xxxxCLI:

    mov al, byte BOOTMODE_SHELL
    call set_boot_mode
    jmp .xxxxGO


; gui mode.
;   ## SET UP BOOT MODE ##
.xxxxGUI:	

    mov word [META$FILE.VIDEO_MODE], G_VIDEO_MODE

    mov al, byte BOOTMODE_GUI
    call set_boot_mode	    
    jmp .xxxxGO

    ;;
    ;; Go!
    ;;

.xxxxGO:

    ; Ativar o modo escolhido.
    ; (lib16\s2modes.inc)

    JMP s2modesActivateMode  
    JMP $


;; ==================================
;; stage2Shutdown:
;;     Shutdown the machine via APM.
;;     16bit, real mode, using BIOS.
;;

stage2Shutdown:

    ; Connect to APM API
    MOV  AX, 5301h
    XOR  BX, BX
    INT  15h

    ; Try to set APM version (to 1.2)
    MOV  AX, 530Eh
    XOR  BX, BX
    MOV  CX, 0102h
    INT  15h

    ; Turn off the system
    MOV  AX, 5307h
    MOV  BX, 0001h
    MOV  CX, 0003h
    INT  15h

    ; Exit 
    ; (for good measure and in case of failure)
    RET


;;
;; ==== Messages. ====
;;

stage2_msg_pe_sig db "BM:stage2Initializations: *PE SIG",0
stage2_msg_pe_sigOK db "BM:stage2Initializations: SIG OK", 13, 10, 0


;;
;; Switch to protected mode.
;;


    ; pm
    ; Comuta para o modo protegido.

    %include  "pm.inc"



;--------------------------------------------------------
; 32 bits - (Boot Manager 32bit Asm.)
;--------------------------------------------------------

[bits 32]
bootmanager_main:

    ;
    ; Em ordem de prioridade na compila��o.
    ;

    ;14 - Header principal. 
    ;Defini��es globais usadas em 32bit.
    ;Header principal em 32 bits.
    %include "header32.inc"

    ;13 - Headers. 
    %include "system.inc"           ;Arquivo de configura��o do sistema.
    %include "init.inc"                  ;Arquivo de configura��o da inicializa��o.
    %include "sysvar32.inc"         ;Vari�veis do sistema.
    %include "gdt32.inc"              ;Gdt.
    %include "idt32.inc"               ;Idt.
    %include "ldt32.inc"               ;Ldt.
    %include "tss32.inc"               ;Tss.
    %include "stacks32.inc"         ;Stacks.
    %include "ints32.inc"              ;Handles para as interrup��es.
    %include "fat16header.inc"    ;Headers para o sistema de arquivos fat16.

    ;12 - Monitor.
    %include "screen32.inc"     ; Rotinas de screen em 32 bits.
    %include "input32.inc"        ; Rotinas de input 2m 32 bits.
    %include "string32.inc"       ; Rotinas de strings em 32 bits.
    %include "font32.inc"          ; Fonte.

    ;11 - Hardware.
    %include "cpuinfo.inc"         ;Rotinas de detec��o e configura��o de cpu.
    %include "hardware.inc"     ;Rotinas de detec��o e configura��o de hardware.
    ; ...

    ;10 - Irqs.
    %include "timer.inc"           ; Irq 0, Timer.
    %include "keyboard.inc"     ; Irq 1, Keyboard.
    %include "fdc32.inc"           ; Irq 6, Fdc. (@todo: Suspender o suporte.)
    %include "clock.inc"            ; Irq 8, Clock.
    %include "hdd32.inc"          ; Irq 14/15, Hdd.
    ; ...

    ;9 - Tasks. (#no tasks)
    %include "tasks32.inc"     ;Rotinas de inicializa��o do sistema de tarefas.

    ;8 - lib32.
    ;%include "lib32.inc"       ;Rotinas em 32 bits.

    ;7 - setup  
    %include "setup.inc"       ;Inicializa arquitetura.

    ;6 - Disk.
    %include "fat12pm.inc"     ;FAT12 em 32 bits.
    %include "fat16lib.inc"       ;FAT16 (rotinas).
    %include "fat16.inc"           ;FAT16 (fun��es principais).
    %include "ramfs.inc"          ;RamDisk fs.
    %include "format.inc"        ;Formata.
    %include "fs32.inc"            ;fs, (ger�ncia os sistemas de arquivos).

    ;5 - File.
    %include "installer.inc"        ;Instala metafiles em LBAs espec�ficas.
    %include "file.inc"                ;Opera��es com aquivos.
    %include "bootloader.inc"    ;Carrega o Boot Loader (BL.BIN).

    ;4 - Debug.
    %include "debug.inc"       ;System debug.

    ;3 - blconfig.
    %include "blconfig.inc"    ;Ger�ncia a inicializa��o.

    ;2 - Boot Manager Mini-Shell.
    %include "shell.inc"       ;Prompt de comandos.

    ;1 - Start.
    %include "start.inc"

    ;0 - lib32.
    %include "lib32.inc"       ;Rotinas em 32 bits.


;;
;; Buffer.
;;

; ============================

root_buffer:
fat_buffer:
    ; nop


;
; End.
;

