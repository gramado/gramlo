
Allocating common symbols
Common symbol       size              file

g_fat16_fat_status  0x4               main.o
timerTicks          0x4               timer.o
prompt              0xfa              main.o
EDITBOX_LARGURA     0x4               main.o
partition           0x10              main.o
system_info         0x8               main.o
dma_addr            0x4               ide.o
g_initialized       0x4               main.o
ata_record_dev      0x1               main.o
bliTesting          0x4               main.o
g_driver_hdd_initialized
                    0x4               main.o
EDITBOX_BG_COLOR    0x4               main.o
shell_status        0x4               shell.o
current_dev         0x4               ide.o
STATUS_X            0x4               main.o
prompt_pos          0x4               main.o
ide_handler_address
                    0x4               main.o
g_fat16_root_status
                    0x4               main.o
current_mmblock     0x4               main.o
STATUS_Y            0x4               main.o
mm_prev_pointer     0x4               heap.o
shell_string_buffer
                    0x400             shell.o
deslocamento        0x4               shell.o
bl_heap_start       0x4               main.o
buffer_dir_entry    0x200             main.o
BootLoaderCR3       0x4               main.o
next_address        0x4               main.o
shift_status        0x4               keyboard.o
ide_dma_prdt        0x20              ide.o
g_available_heap    0x4               main.o
alt_status          0x4               keyboard.o
ata_record_channel  0x1               main.o
heapCount           0x4               main.o
EDITBOX_ALTURA      0x4               main.o
g_lbf_va            0x4               main.o
LegacyCR3           0x4               main.o
g_proc_status       0x4               main.o
g_current_ide_channel
                    0x4               main.o
g_heap_pointer      0x4               main.o
gdefTesting         0x4               main.o
heapList            0x20              main.o
ata_pci             0x34              main.o
ATAFlag             0x4               main.o
procedure_info      0x10              main.o
EDITBOX_TEXT_COLOR  0x4               main.o
____testing_memory_size_flag
                    0x4               main.o
hddError            0x4               hdd.o
ide_ports           0x60              main.o
CURSOR_Y            0x4               main.o
EDITBOX_Y           0x4               main.o
IDE                 0x14              main.o
g_system_color      0x4               main.o
CURSOR_X            0x4               main.o
last_size           0x4               heap.o
useGUI              0x4               main.o
ready_queue_dev     0x4               ide.o
last_valid          0x4               heap.o
ret_string          0x4               shell.o
file_cluster_list   0x800             main.o
vesa_mode           0x10              main.o
escape_status       0x4               keyboard.o
mmblockList         0x400             main.o
ata_identify_dev_buf
                    0x4               main.o
g_next_app          0x4               main.o
bl_heap_end         0x4               main.o
dev_nport           0x20              main.o
__last_valid_address
                    0x4               main.o
ata                 0x18              main.o
tab_status          0x4               keyboard.o
VideoBlock          0x1c              main.o
g_cursor_y          0x4               main.o
idechannelList      0xc0              main.o
g_cmd_status        0x4               main.o
g_current_ide_device
                    0x4               main.o
ShellInitialized    0x4               shell.o
key_status          0x4               keyboard.o
g_file_system_type  0x4               main.o
mmblockCount        0x4               main.o
hddStatus           0x4               hdd.o
g_char_attrib       0x4               main.o
ctrl_status         0x4               keyboard.o
g_next_proc         0x4               main.o
g_lbf_pa            0x4               main.o
winkey_status       0x4               keyboard.o
g_nova_mensagem     0x4               main.o
EDITBOX_X           0x4               main.o
g_cursor_x          0x4               main.o

Memory Configuration

Name             Origin             Length             Attributes
*default*        0x0000000000000000 0xffffffffffffffff

Linker script and memory map

                0x0000000000400000                __image_base__ = 0x400000
                0x0000000000000000                __dll__ = 0x0
                0x0000000000400000                ___ImageBase = 0x400000
                0x0000000000001000                __section_alignment__ = 0x1000
                0x0000000000000200                __file_alignment__ = 0x200
                0x0000000000000004                __major_os_version__ = 0x4
                0x0000000000000000                __minor_os_version__ = 0x0
                0x0000000000000001                __major_image_version__ = 0x1
                0x0000000000000000                __minor_image_version__ = 0x0
                0x0000000000000004                __major_subsystem_version__ = 0x4
                0x0000000000000000                __minor_subsystem_version__ = 0x0
                0x0000000000000003                __subsystem__ = 0x3
                0x0000000000200000                __size_of_stack_reserve__ = 0x200000
                0x0000000000001000                __size_of_stack_commit__ = 0x1000
                0x0000000000100000                __size_of_heap_reserve__ = 0x100000
                0x0000000000001000                __size_of_heap_commit__ = 0x1000
                0x0000000000000000                __loader_flags__ = 0x0
                0x0000000000000000                __dll_characteristics__ = 0x0

.text           0x0000000000021000     0x7000
                0x0000000000021000                code = .
                0x0000000000021000                _code = .
                0x0000000000021000                __code = .
 *(.head_x86)
 .head_x86      0x0000000000021000     0x140e head.o
                0x0000000000021000                bootloader_entry_point
                0x00000000000211fd                SavedBootBlock
                0x0000000000021201                SavedLFB
                0x0000000000021205                SavedX
                0x0000000000021209                SavedY
                0x000000000002120d                SavedBPP
                0x0000000000021211                SavedBootMode
                0x0000000000021b99                task0_stack
                0x0000000000021b9d                task1_stack
                0x0000000000021ba1                task2_stack
                0x0000000000021bd9                setup_idt_vector
                0x0000000000021e71                irq0
                0x0000000000021e77                timer_test
                0x0000000000021e7f                irq1
                0x0000000000021eab                fault_N0
                0x0000000000021eb5                fault_N1
                0x0000000000021ebf                fault_N2
                0x0000000000021ec9                fault_N3
                0x0000000000021ed3                fault_N4
                0x0000000000021edd                fault_N5
                0x0000000000021ee7                fault_INTRUCAO_INVALIDA
                0x0000000000021ef1                fault_N7
                0x0000000000021efb                fault_DOUBLE
                0x0000000000021f05                fault_N9
                0x0000000000021f0f                fault_N10
                0x0000000000021f19                fault_N11
                0x0000000000021f23                fault_STACK
                0x0000000000021f2d                fault_GP
                0x0000000000021f37                fault_N14
                0x0000000000021f41                fault_N15
                0x0000000000021f4b                fault_N16
                0x0000000000021f55                fault_N17
                0x0000000000021f5f                fault_N18
                0x0000000000021f69                fault_N19
                0x0000000000021f73                fault_N20
                0x0000000000021f7d                fault_N21
                0x0000000000021f87                fault_N22
                0x0000000000021f91                fault_N23
                0x0000000000021f9b                fault_N24
                0x0000000000021fa5                fault_N25
                0x0000000000021faf                fault_N26
                0x0000000000021fb9                fault_N27
                0x0000000000021fc3                fault_N28
                0x0000000000021fcd                fault_N29
                0x0000000000021fd7                fault_N30
                0x0000000000021fe1                fault_N31
                0x0000000000021feb                hd_buffer
                0x0000000000021fef                hd_lba
                0x0000000000021ff3                test_write
                0x0000000000022003                os_read_sector
                0x000000000002201c                os_write_sector
                0x000000000002212b                reset_ide0
                0x00000000000221ca                int48
                0x00000000000221cf                int49
                0x00000000000221d4                int50
                0x00000000000221d9                int51
                0x00000000000221de                int52
                0x00000000000221e3                int53
                0x00000000000221e8                int54
                0x00000000000221ed                int55
                0x00000000000221f2                int56
                0x00000000000221f7                int57
                0x00000000000221fc                int58
                0x0000000000022201                int59
                0x0000000000022206                int100
                0x000000000002220b                int200
                0x000000000002222a                int201
                0x000000000002222f                int213
                0x0000000000022236                my_buffer_load_bitmap_16x16
                0x00000000000222c8                background
                0x000000000002231d                gui_buffer_putpixel
                0x00000000000223ab                refresh_screen
                0x00000000000223fc                softwarelibReboot
                0x000000000002240a                asm_shut_down
 *(.text)
 .text          0x000000000002240e      0x264 main.o
                0x000000000002240e                BlMain
                0x00000000000224bf                BlLoadKernel
                0x00000000000224f2                BlSetupPaging
                0x0000000000022500                BlAbort
                0x000000000002250e                BlKernelModuleMain
                0x000000000002252c                init_testing_memory_size
                0x0000000000022653                die
 .text          0x0000000000022672      0x127 loader.o
                0x0000000000022672                load_kernel
 .text          0x0000000000022799      0x107 init.o
                0x0000000000022799                set_up_color
                0x00000000000227a7                set_up_text_color
                0x00000000000227d3                init_globals
                0x000000000002280b                init
 .text          0x00000000000228a0       0xd5 ports.o
                0x00000000000228a0                bloutportb
                0x00000000000228ad                outb
                0x00000000000228ba                inportb
                0x00000000000228cf                outportb
                0x00000000000228dc                inport8
                0x00000000000228eb                outport8
                0x00000000000228f8                inport16
                0x0000000000022908                outport16
                0x0000000000022916                inport32
                0x0000000000022925                outport32
                0x0000000000022932                inb
                0x0000000000022954                inportl
                0x0000000000022968                outportl
 .text          0x0000000000022975       0xc5 x86.o
                0x0000000000022975                enable
                0x000000000002297c                disable
                0x0000000000022983                stopCpu
                0x000000000002298b                intReturn
                0x0000000000022992                farReturn
                0x0000000000022999                getFlags
                0x00000000000229a4                setFlags
                0x00000000000229af                BlProcessorInPort8
                0x00000000000229be                BlProcessorOutPort8
                0x00000000000229cb                BlProcessorInPort16
                0x00000000000229db                BlProcessorOutPort16
                0x00000000000229e9                BlProcessorInPort32
                0x00000000000229f8                BlProcessorOutPort32
                0x0000000000022a05                Push
                0x0000000000022a0b                Pop
                0x0000000000022a11                pushRegs
                0x0000000000022a17                popRegs
                0x0000000000022a1d                pushFlags
                0x0000000000022a23                popFlags
                0x0000000000022a29                getStackPointer
                0x0000000000022a34                setStackPointer
 .text          0x0000000000022a3a      0xb7d stdio.o
                0x0000000000022a3a                panic
                0x0000000000022a5b                scroll
                0x0000000000022ae6                bl_clear
                0x0000000000022b40                kprintf
                0x0000000000022f93                printf
                0x0000000000022fb0                sprintf
                0x0000000000023005                putchar
                0x000000000002301e                outbyte
                0x0000000000023185                _outbyte
                0x000000000002325b                printf_main
                0x0000000000023265                input
                0x0000000000023394                my_buffer_horizontal_line
                0x00000000000233be                my_buffer_put_pixel
                0x0000000000023490                my_buffer_char_blt
                0x000000000002350c                vsync
                0x0000000000023549                gui_inb
                0x000000000002356e                get_cursor_x
                0x0000000000023583                get_cursor_y
                0x0000000000023598                carrega_bitmap_16x16
 .text          0x00000000000235b7       0x5b stdlib.o
                0x00000000000235b7                malloc
                0x00000000000235f3                free
 .text          0x0000000000023612      0x258 string.o
                0x0000000000023612                strcmp
                0x0000000000023677                strncmp
                0x00000000000236da                str_cmp
                0x0000000000023757                memcpy
                0x0000000000023794                strlen
                0x00000000000237bb                strcpy
                0x00000000000237ef                strcat
                0x000000000002381e                bcopy
                0x000000000002384a                bzero
 .text          0x000000000002386a      0x1d6 keyboard.o
                0x000000000002386a                keyboardHandler
 .text          0x0000000000023a40      0x252 pci.o
                0x0000000000023a40                pciConfigReadWord
                0x0000000000023ae7                pciCheckDevice
                0x0000000000023b41                pciCheckVendor
                0x0000000000023b81                pciGetClassCode
                0x0000000000023bb2                pciInfo
                0x0000000000023c88                pciInit
 .text          0x0000000000023c92      0x455 hdd.o
                0x0000000000023cc8                hdd_ata_pio_write
                0x0000000000023cfe                hdd_ata_status_read
                0x0000000000023d2c                hdd_ata_wait_not_busy
                0x0000000000023d6c                hdd_ata_cmd_write
                0x0000000000023dbc                hdd_ata_wait_no_drq
                0x0000000000023e02                pio_rw_sector
                0x0000000000024067                my_read_hd_sector
                0x0000000000024090                my_write_hd_sector
                0x00000000000240b9                init_hdd
 .text          0x00000000000240e7     0x1c2d ide.o
                0x00000000000240e7                disk_get_ata_irq_invoked
                0x00000000000240f1                disk_reset_ata_irq_invoked
                0x0000000000024101                ata_wait
                0x0000000000024133                ata_wait_not_busy
                0x0000000000024161                ata_wait_busy
                0x000000000002418f                ata_wait_no_drq
                0x00000000000241c3                ata_wait_drq
                0x00000000000241f7                ata_wait_irq
                0x000000000002426e                ata_soft_reset
                0x00000000000242c7                ata_status_read
                0x00000000000242e3                ata_cmd_write
                0x0000000000024318                ata_assert_dever
                0x00000000000243bd                ide_identify_device
                0x0000000000024811                set_ata_addr
                0x0000000000024867                ide_mass_storage_initialize
                0x000000000002490c                ide_dev_init
                0x0000000000024cd1                nport_ajuste
                0x0000000000024d29                ata_pio_read
                0x0000000000024d4e                ata_pio_write
                0x0000000000024d73                ide_dma_data
                0x0000000000024e47                ide_dma_start
                0x0000000000024e81                ide_dma_stop
                0x0000000000024eec                ide_dma_read_status
                0x0000000000024f0b                diskReadPCIConfigAddr
                0x0000000000024f6a                diskWritePCIConfigAddr
                0x0000000000024fce                diskATAPCIConfigurationSpace
                0x00000000000256a5                diskPCIScanDevice
                0x00000000000257b2                diskATAInitialize
                0x0000000000025b13                diskATADialog
                0x0000000000025b57                diskATAIRQHandler1
                0x0000000000025b67                diskATAIRQHandler2
                0x0000000000025b77                show_ide_info
                0x0000000000025c9a                disk_ata_wait_irq
 .text          0x0000000000025d14       0x48 timer.o
                0x0000000000025d14                timer
                0x0000000000025d40                BltimerInit
 .text          0x0000000000025d5c      0x588 pages.o
                0x0000000000025d5c                SetUpPaging
 .text          0x00000000000262e4      0x3b7 heap.o
                0x00000000000262e4                heapAllocateMemory
                0x00000000000264bf                FreeHeap
                0x000000000002657f                init_heap
 .text          0x000000000002669b       0x95 procedure.o
                0x000000000002669b                bl_procedure
 .text          0x0000000000026730      0xb56 fs.o
                0x0000000000026730                fatClustToSect
                0x0000000000026757                fatLoadCluster
                0x0000000000026793                fs_format
                0x0000000000026799                fs_search_empty_entry
                0x00000000000267a3                fs_find_not_empty_entry
                0x00000000000267ad                fs_test_fat_vector
                0x00000000000267b3                fs_get_fat_entry
                0x00000000000267bd                fs_create_entry
                0x00000000000267c3                fsCreateFileName
                0x00000000000267c9                fsSaveFileName
                0x00000000000267cf                fs_save_entry_on_disc
                0x00000000000267d5                fs_set_structures
                0x00000000000267db                fs_set_entry
                0x00000000000267e1                fs_get_entry
                0x00000000000267e7                fs_show_dir_entry
                0x00000000000267ed                fs_show_dir
                0x00000000000267f3                fs_check_cluster
                0x00000000000267fd                fsSaveRootDir
                0x0000000000026803                fs_load_dir
                0x0000000000026809                fs_save_dir
                0x000000000002680f                fs_save_structure
                0x0000000000026815                fs_save_entry_on_root
                0x000000000002681b                fs_show_entry
                0x0000000000026821                fs_delete_entry
                0x0000000000026827                fs_init_bootfile_struct
                0x000000000002682d                fs_get_entry_status
                0x0000000000026837                fs_set_entry_status
                0x000000000002683d                fs_makeboot
                0x0000000000026847                fs_set_fat_entry
                0x000000000002684d                fs_find_empty_entry
                0x0000000000026857                fs_install
                0x000000000002685d                fs_relood_dir
                0x0000000000026863                fsLoadFile
                0x0000000000026a48                path_count
                0x0000000000026a9b                load_path
                0x0000000000026db9                fsSearchFile
                0x0000000000026e8b                fsSearchFileName
                0x0000000000026ea1                fs_load_rootdirEx
                0x0000000000026ef2                fs_load_fatEx
                0x0000000000026f40                fs_put_list_on_fat
                0x0000000000027003                fs_find_n_empty_entries
                0x0000000000027084                fs_load_rootdir
                0x0000000000027092                read_lba
                0x00000000000270ad                write_lba
                0x00000000000270c8                fsSaveFile
                0x00000000000270d2                fsCreateDir
                0x00000000000270eb                fsCreateFile
                0x00000000000271e6                fsClearFat
                0x00000000000271f4                fsCheckFat
                0x0000000000027266                fsInitFat
                0x000000000002726c                fsInitStructures
                0x0000000000027272                fsInit
 .text          0x0000000000027286      0x607 shell.o
                0x0000000000027286                blShellMain
                0x00000000000272f1                shellProcedure
                0x0000000000027362                shellInitializePrompt
                0x00000000000273f1                shellWaitCmd
                0x000000000002740b                shellCompare
                0x00000000000277bf                shellHelp
                0x00000000000277d8                boot
                0x00000000000277de                debug
                0x00000000000277f9                testa_mbr
                0x000000000002782a                testa_root
                0x000000000002785e                reboot
                0x000000000002786c                shellInit
 .text          0x000000000002788d       0x17 services.o
                0x000000000002788d                blServices
                0x000000000002789e                system_services
 .text          0x00000000000278a4       0x1f abort.o
                0x00000000000278a4                abort
 .text          0x00000000000278c3      0x10c faults.o
                0x00000000000278c3                cpu_faults
                0x00000000000279c9                faultsShowRegisters
                0x0000000000028000                . = ALIGN (0x1000)
 *fill*         0x00000000000279cf      0x631 

.rodata         0x0000000000028000      0xeb8
 .rodata        0x0000000000028000      0x14b main.o
 *fill*         0x000000000002814b        0x1 
 .rodata        0x000000000002814c       0xa3 loader.o
 .rodata        0x00000000000281ef       0x11 init.o
 .rodata        0x0000000000028200       0x3f stdio.o
 *fill*         0x000000000002823f        0x1 
 .rodata        0x0000000000028240       0x44 pci.o
 .rodata        0x0000000000028284       0x33 hdd.o
 *fill*         0x00000000000282b7        0x1 
 .rodata        0x00000000000282b8      0x46b ide.o
 *fill*         0x0000000000028723        0x1 
 .rodata        0x0000000000028724      0x1b1 heap.o
 .rodata        0x00000000000288d5        0xc procedure.o
 *fill*         0x00000000000288e1        0x3 
 .rodata        0x00000000000288e4      0x324 fs.o
 .rodata        0x0000000000028c08      0x196 shell.o
 .rodata        0x0000000000028d9e        0xd abort.o
 *fill*         0x0000000000028dab        0x1 
 .rodata        0x0000000000028dac      0x10c faults.o

.eh_frame       0x0000000000029000     0x1c60
 .eh_frame      0x0000000000029000       0xf4 main.o
 .eh_frame      0x00000000000290f4       0x38 loader.o
 .eh_frame      0x000000000002912c       0x98 init.o
 .eh_frame      0x00000000000291c4      0x1b8 ports.o
 .eh_frame      0x000000000002937c      0x2b8 x86.o
 .eh_frame      0x0000000000029634      0x32c stdio.o
 .eh_frame      0x0000000000029960       0x58 stdlib.o
 .eh_frame      0x00000000000299b8      0x138 string.o
 .eh_frame      0x0000000000029af0       0x38 keyboard.o
 .eh_frame      0x0000000000029b28       0xe0 pci.o
 .eh_frame      0x0000000000029c08      0x160 hdd.o
 .eh_frame      0x0000000000029d68      0x494 ide.o
 .eh_frame      0x000000000002a1fc       0x58 timer.o
 .eh_frame      0x000000000002a254       0x38 pages.o
 .eh_frame      0x000000000002a28c       0x78 heap.o
 .eh_frame      0x000000000002a304       0x38 procedure.o
 .eh_frame      0x000000000002a33c      0x698 fs.o
 .eh_frame      0x000000000002a9d4      0x198 shell.o
 .eh_frame      0x000000000002ab6c       0x58 services.o
 .eh_frame      0x000000000002abc4       0x34 abort.o
 .eh_frame      0x000000000002abf8       0x58 faults.o

.data           0x000000000002ac60     0x13a0
                0x000000000002ac60                data = .
                0x000000000002ac60                _data = .
                0x000000000002ac60                __data = .
 *(.data)
 .data          0x000000000002ac60        0x2 head.o
                0x000000000002ac60                data_start
 .data          0x000000000002ac62        0x0 main.o
 .data          0x000000000002ac62        0x0 loader.o
 .data          0x000000000002ac62        0x0 init.o
 .data          0x000000000002ac62        0x0 ports.o
 .data          0x000000000002ac62        0x0 x86.o
 .data          0x000000000002ac62        0x0 stdio.o
 .data          0x000000000002ac62        0x0 stdlib.o
 .data          0x000000000002ac62        0x0 string.o
 *fill*         0x000000000002ac62       0x1e 
 .data          0x000000000002ac80      0x1a0 keyboard.o
                0x000000000002ac80                destroy_window
                0x000000000002ac84                quit_message
 .data          0x000000000002ae20        0x0 pci.o
 .data          0x000000000002ae20        0x0 hdd.o
 .data          0x000000000002ae20      0x440 ide.o
                0x000000000002ae3c                dev_type
                0x000000000002ae60                pci_classes
 .data          0x000000000002b260        0x0 timer.o
 .data          0x000000000002b260        0x0 pages.o
 .data          0x000000000002b260        0x0 heap.o
 .data          0x000000000002b260        0x0 procedure.o
 .data          0x000000000002b260        0x0 fs.o
 .data          0x000000000002b260       0x2c shell.o
                0x000000000002b260                help_string
 .data          0x000000000002b28c        0x0 services.o
 .data          0x000000000002b28c        0x0 abort.o
 .data          0x000000000002b28c        0x0 faults.o
                0x000000000002c000                . = ALIGN (0x1000)
 *fill*         0x000000000002b28c      0xd74 

.bss            0x000000000002c000     0x2000
                0x000000000002c000                bss = .
                0x000000000002c000                _bss = .
                0x000000000002c000                __bss = .
 *(.bss)
 .bss           0x000000000002c000        0x0 head.o
                0x000000000002c000                bss_start
 .bss           0x000000000002c000        0x0 main.o
 .bss           0x000000000002c000        0x0 loader.o
 .bss           0x000000000002c000        0x0 init.o
 .bss           0x000000000002c000        0x0 ports.o
 .bss           0x000000000002c000        0x0 x86.o
 .bss           0x000000000002c000        0x1 stdio.o
 .bss           0x000000000002c001        0x0 stdlib.o
 .bss           0x000000000002c001        0x0 string.o
 *fill*         0x000000000002c001        0x3 
 .bss           0x000000000002c004        0x4 keyboard.o
                0x000000000002c004                ambiente
 .bss           0x000000000002c008        0x0 pci.o
 .bss           0x000000000002c008        0x0 hdd.o
 .bss           0x000000000002c008       0x20 ide.o
                0x000000000002c008                dev_next_pid
 .bss           0x000000000002c028        0x0 timer.o
 .bss           0x000000000002c028        0x0 pages.o
 .bss           0x000000000002c028        0x0 heap.o
 .bss           0x000000000002c028        0x0 procedure.o
 .bss           0x000000000002c028        0x0 fs.o
 .bss           0x000000000002c028        0x0 shell.o
 .bss           0x000000000002c028        0x0 services.o
 .bss           0x000000000002c028        0x0 abort.o
 .bss           0x000000000002c028        0x0 faults.o
 *(COMMON)
 *fill*         0x000000000002c028       0x18 
 COMMON         0x000000000002c040     0x1268 main.o
                0x000000000002c040                g_fat16_fat_status
                0x000000000002c060                prompt
                0x000000000002c15c                EDITBOX_LARGURA
                0x000000000002c160                partition
                0x000000000002c170                system_info
                0x000000000002c178                g_initialized
                0x000000000002c17c                ata_record_dev
                0x000000000002c180                bliTesting
                0x000000000002c184                g_driver_hdd_initialized
                0x000000000002c188                EDITBOX_BG_COLOR
                0x000000000002c18c                STATUS_X
                0x000000000002c190                prompt_pos
                0x000000000002c194                ide_handler_address
                0x000000000002c198                g_fat16_root_status
                0x000000000002c19c                current_mmblock
                0x000000000002c1a0                STATUS_Y
                0x000000000002c1a4                bl_heap_start
                0x000000000002c1c0                buffer_dir_entry
                0x000000000002c3c0                BootLoaderCR3
                0x000000000002c3c4                next_address
                0x000000000002c3c8                g_available_heap
                0x000000000002c3cc                ata_record_channel
                0x000000000002c3d0                heapCount
                0x000000000002c3d4                EDITBOX_ALTURA
                0x000000000002c3d8                g_lbf_va
                0x000000000002c3dc                LegacyCR3
                0x000000000002c3e0                g_proc_status
                0x000000000002c3e4                g_current_ide_channel
                0x000000000002c3e8                g_heap_pointer
                0x000000000002c3ec                gdefTesting
                0x000000000002c400                heapList
                0x000000000002c420                ata_pci
                0x000000000002c454                ATAFlag
                0x000000000002c458                procedure_info
                0x000000000002c468                EDITBOX_TEXT_COLOR
                0x000000000002c46c                ____testing_memory_size_flag
                0x000000000002c480                ide_ports
                0x000000000002c4e0                CURSOR_Y
                0x000000000002c4e4                EDITBOX_Y
                0x000000000002c4e8                IDE
                0x000000000002c4fc                g_system_color
                0x000000000002c500                CURSOR_X
                0x000000000002c504                useGUI
                0x000000000002c520                file_cluster_list
                0x000000000002cd20                vesa_mode
                0x000000000002cd40                mmblockList
                0x000000000002d140                ata_identify_dev_buf
                0x000000000002d144                g_next_app
                0x000000000002d148                bl_heap_end
                0x000000000002d160                dev_nport
                0x000000000002d180                __last_valid_address
                0x000000000002d184                ata
                0x000000000002d19c                VideoBlock
                0x000000000002d1b8                g_cursor_y
                0x000000000002d1c0                idechannelList
                0x000000000002d280                g_cmd_status
                0x000000000002d284                g_current_ide_device
                0x000000000002d288                g_file_system_type
                0x000000000002d28c                mmblockCount
                0x000000000002d290                g_char_attrib
                0x000000000002d294                g_next_proc
                0x000000000002d298                g_lbf_pa
                0x000000000002d29c                g_nova_mensagem
                0x000000000002d2a0                EDITBOX_X
                0x000000000002d2a4                g_cursor_x
 COMMON         0x000000000002d2a8       0x1c keyboard.o
                0x000000000002d2a8                shift_status
                0x000000000002d2ac                alt_status
                0x000000000002d2b0                escape_status
                0x000000000002d2b4                tab_status
                0x000000000002d2b8                key_status
                0x000000000002d2bc                ctrl_status
                0x000000000002d2c0                winkey_status
 COMMON         0x000000000002d2c4        0x8 hdd.o
                0x000000000002d2c4                hddError
                0x000000000002d2c8                hddStatus
 *fill*         0x000000000002d2cc       0x14 
 COMMON         0x000000000002d2e0       0x44 ide.o
                0x000000000002d2e0                dma_addr
                0x000000000002d2e4                current_dev
                0x000000000002d300                ide_dma_prdt
                0x000000000002d320                ready_queue_dev
 COMMON         0x000000000002d324        0x4 timer.o
                0x000000000002d324                timerTicks
 COMMON         0x000000000002d328        0xc heap.o
                0x000000000002d328                mm_prev_pointer
                0x000000000002d32c                last_size
                0x000000000002d330                last_valid
 *fill*         0x000000000002d334        0xc 
 COMMON         0x000000000002d340      0x42c shell.o
                0x000000000002d340                shell_status
                0x000000000002d360                shell_string_buffer
                0x000000000002d760                deslocamento
                0x000000000002d764                ret_string
                0x000000000002d768                ShellInitialized
 *(.bss_heap)
 .bss_heap      0x000000000002d76c      0x400 head.o
                0x000000000002d76c                bootloader_heap_start
                0x000000000002db6c                bootloader_heap_end
 *(.bss_stack)
 .bss_stack     0x000000000002db6c      0x400 head.o
                0x000000000002db6c                bootloader_stack_end
                0x000000000002df6c                bootloader_stack_start
                0x000000000002e000                . = ALIGN (0x1000)
 *fill*         0x000000000002df6c       0x94 
                0x000000000002e000                end = .
                0x000000000002e000                _end = .
                0x000000000002e000                __end = .
                0x000000000002e000                _bootloader_end = .
LOAD head.o
LOAD main.o
LOAD loader.o
LOAD init.o
LOAD ports.o
LOAD x86.o
LOAD stdio.o
LOAD stdlib.o
LOAD string.o
LOAD keyboard.o
LOAD pci.o
LOAD hdd.o
LOAD ide.o
LOAD timer.o
LOAD pages.o
LOAD heap.o
LOAD procedure.o
LOAD fs.o
LOAD shell.o
LOAD services.o
LOAD abort.o
LOAD faults.o
OUTPUT(BL.BIN pe-i386)

.comment        0x0000000000000000      0x374
 .comment       0x0000000000000000       0x2a main.o
 .comment       0x000000000000002a       0x2a loader.o
 .comment       0x0000000000000054       0x2a init.o
 .comment       0x000000000000007e       0x2a ports.o
 .comment       0x00000000000000a8       0x2a x86.o
 .comment       0x00000000000000d2       0x2a stdio.o
 .comment       0x00000000000000fc       0x2a stdlib.o
 .comment       0x0000000000000126       0x2a string.o
 .comment       0x0000000000000150       0x2a keyboard.o
 .comment       0x000000000000017a       0x2a pci.o
 .comment       0x00000000000001a4       0x2a hdd.o
 .comment       0x00000000000001ce       0x2a ide.o
 .comment       0x00000000000001f8       0x2a timer.o
 .comment       0x0000000000000222       0x2a pages.o
 .comment       0x000000000000024c       0x2a heap.o
 .comment       0x0000000000000276       0x2a procedure.o
 .comment       0x00000000000002a0       0x2a fs.o
 .comment       0x00000000000002ca       0x2a shell.o
 .comment       0x00000000000002f4       0x2a services.o
 .comment       0x000000000000031e       0x2a abort.o
 .comment       0x0000000000000348       0x2a faults.o

.note.GNU-stack
                0x0000000000000000        0x0
 .note.GNU-stack
                0x0000000000000000        0x0 main.o
 .note.GNU-stack
                0x0000000000000000        0x0 loader.o
 .note.GNU-stack
                0x0000000000000000        0x0 init.o
 .note.GNU-stack
                0x0000000000000000        0x0 ports.o
 .note.GNU-stack
                0x0000000000000000        0x0 x86.o
 .note.GNU-stack
                0x0000000000000000        0x0 stdio.o
 .note.GNU-stack
                0x0000000000000000        0x0 stdlib.o
 .note.GNU-stack
                0x0000000000000000        0x0 string.o
 .note.GNU-stack
                0x0000000000000000        0x0 keyboard.o
 .note.GNU-stack
                0x0000000000000000        0x0 pci.o
 .note.GNU-stack
                0x0000000000000000        0x0 hdd.o
 .note.GNU-stack
                0x0000000000000000        0x0 ide.o
 .note.GNU-stack
                0x0000000000000000        0x0 timer.o
 .note.GNU-stack
                0x0000000000000000        0x0 pages.o
 .note.GNU-stack
                0x0000000000000000        0x0 heap.o
 .note.GNU-stack
                0x0000000000000000        0x0 procedure.o
 .note.GNU-stack
                0x0000000000000000        0x0 fs.o
 .note.GNU-stack
                0x0000000000000000        0x0 shell.o
 .note.GNU-stack
                0x0000000000000000        0x0 services.o
 .note.GNU-stack
                0x0000000000000000        0x0 abort.o
 .note.GNU-stack
                0x0000000000000000        0x0 faults.o
