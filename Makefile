# License: BSD License
VERSION = 1
PATCHLEVEL = 35
SUBLEVEL =
EXTRAVERSION = -rc4
NAME = Gramado 1.xx

# Documentation.
# See: docs/
# To see the targets execute "make help"


# That's our default target when none is given on the command line
PHONY := _all
_all: all

	@echo "That's all!"
	


KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)

export KBUILD_IMAGE ?= KERNEL.BIN 


srctree := .
objtree := .
src := $(srctree)
obj := $(objtree)
 
 
# Make variables (CC, etc...)
AS	= as
LD	= ld
CC	= gcc
AR	= ar
MAKE	= make
NASM	= nasm
OBJCOPY	= objcopy
OBJDUMP	= objdump
LEX	= flex
YACC	= bison
PERL	= perl
PYTHON	= python
PYTHON2	= python2
PYTHON3	= python3
RUBY	= ruby



# Verbose.

ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 1
endif

ifeq ($(KBUILD_VERBOSE),1)
  Q =
else
  Q = @
endif


#
# Begin.
#

## ====================================================================
## Step0 build-system-files - Libraries and apps.
## Step1 KERNEL.BIN         - Creating the kernel image.
## Step2 kernel-image-link  - Linking the kernel image.
## Step3 /mnt/gramadovhd    - Creating the directory to mount the VHD.
## Step4 vhd-create         - Creating a VHD in Assembly language.
## Step5 vhd-mount          - Mounting the VHD.
## Step6 vhd-copy-files     - Copying files into the mounted VHD.
## Step7 vhd-unmount        - Unmounting the VHD.
## Step8 clean              - Deleting the object files.           

PHONY := all

all: build-system-files \
KERNEL.BIN \
/mnt/gramadovhd  \
vhd-create \
vhd-mount \
vhd-copy-files \
vhd-unmount \
clean \
clean-system-files


	#Giving permitions to run ./run hahaha
	chmod 755 ./run

#	@echo "Gramado $(VERSION) $(PATCHLEVEL) $(SUBLEVEL) $(EXTRAVERSION) $(NAME) "
#	@echo "Arch x86"
	@echo "Animal 1.0 $(KERNELVERSION) ($(NAME)) "
#	@echo "$(ARCH)"



# Building system files.
# boot, libs, apps and commands.
# #todo: fonts.



PHONY := build-system-files

#Step 0
build-system-files: /usr/local/gramado-build \
build-boot    



/usr/local/gramado-build:
	-sudo mkdir /usr/local/gramado-build
	
build-boot:

	@echo "==================="
	@echo "Compiling BM ... "
	$(Q) $(MAKE) -C boot/x86/bm/ 

	@echo "==================="
	@echo "Compiling BL ... "
	$(Q) $(MAKE) -C boot/x86/bl/ 



## Step1 KERNEL.BIN         - Creating the kernel image.
KERNEL.BIN: 
	@echo "================================="
	@echo "(Step 1) Creating the kernel image ..."

	$(Q) $(MAKE) -C kernel   



## Step3 /mnt/gramadovhd    - Creating the directory to mount the VHD.
/mnt/gramadovhd:
	@echo "================================="
	@echo "(Step 3) Creating the directory to mount the VHD ..."

	sudo mkdir /mnt/gramadovhd


## Step4 vhd-create         - Creating a VHD in Assembly language.
vhd-create:
	@echo "================================="
	@echo "(Step 4) Creating a VHD in Assembly language ..."

	$(NASM) boot/x86/vhd/main.asm -I boot/x86/vhd/ -o ANIMAL.VHD   
	


## Step5 vhd-mount          - Mounting the VHD.
vhd-mount:
	@echo "================================="
	@echo "(Step 5) Mounting the VHD ..."

	-sudo umount /mnt/gramadovhd
#	sudo mount -t vfat -o loop,offset=32256 GRAMADO.VHD /mnt/gramadovhd/
	sudo mount -t vfat -o loop,offset=32256 ANIMAL.VHD /mnt/gramadovhd/

## Step6 vhd-copy-files     - Copying files into the mounted VHD.
vhd-copy-files:
	@echo "================================="
	@echo "(Step 6) Copying files into the mounted VHD ..."

# ======== Files in the root dir. ========

	# First of all
	# bm, bl, kernel, init, gdeshell.

	sudo cp boot/x86/bin/BM.BIN    /mnt/gramadovhd
	sudo cp boot/x86/bin/BL.BIN    /mnt/gramadovhd
	sudo cp kernel/KERNEL.BIN      /mnt/gramadovhd


#
# ======== Creating the all the folders in root dir ========
#		

# Creating standard folders

	-sudo mkdir /mnt/gramadovhd/BOOT
# ...


# ======== Files in the /BOOT/ folder. ========
	sudo cp boot/x86/bin/BM.BIN  /mnt/gramadovhd/BOOT
	sudo cp boot/x86/bin/BL.BIN  /mnt/gramadovhd/BOOT
	sudo cp kernel/KERNEL.BIN    /mnt/gramadovhd/BOOT




## Step7 vhd-unmount        - Unmounting the VHD.
vhd-unmount:
	@echo "================================="
	@echo "(Step 7) Unmounting the VHD ..."

	sudo umount /mnt/gramadovhd


## Step8 clean              - Deleting the object files.           
clean:
	@echo "================================="
	@echo "(Step 8) Deleting the object files ..."

	-rm *.o
	@echo "Success?"

clean2:
	-rm *.ISO
	-rm *.VHD
	
clean3:
	-rm animal/apps/bin/*.BIN
	-rm animal/cmd/bin/*.BIN
	
PHONY := clean-system-files
clean-system-files:
	@echo "==================="
	@echo "Cleaning all system binaries ..."

	-rm -rf boot/x86/bin/*.BIN
	
	-rm -rf kernel/KERNEL.BIN
# ...


clean-all: clean clean2 clean3 clean-system-files  

	@echo "==================="
	@echo "ok ?"


## ====================================================================================
## The extra stuff.
## 1) ISO support.
## 2) HDD support.
## 3) VM support.
## 4) Serial debug support.
## 5) Clean files support.
## 6) Usage support.



#
# ======== HDD ========
#

	
hdd-mount:
	-sudo umount /mnt/gramadohdd
	sudo mount -t vfat -o loop,offset=32256 /dev/sda /mnt/gramadohdd/
#	sudo mount -t vfat -o loop,offset=32256 /dev/sdb /mnt/gramadohdd/
	
hdd-unmount:
	-sudo umount /mnt/gramadohdd
	
hdd-copy-kernel:
	sudo cp bin/boot/KERNEL.BIN /mnt/gramadohdd/BOOT 

danger-hdd-clone-vhd:
	sudo dd if=./ANIMAL.VHD of=/dev/sda
#	sudo dd if=./GRAMADO.VHD of=/dev/sdb




#
# ======== VM ========
#


# Oracle Virtual Box 
oracle-virtual-box-test:
	VBoxManage startvm "Animal"

# qemu 
qemu-test:
	qemu-system-x86_64 -hda ANIMAL.VHD -m 512 -serial stdio 
#	qemu-system-x86_64 -hda GRAMADO.VHD -m 128 -device e1000 -show-cursor -serial stdio -device e1000


test-sda:
	sudo qemu-system-i386 -m 512 -drive file=/dev/sda,format=raw

test-sdb:
	sudo qemu-system-i386 -m 512 -drive file=/dev/sdb,format=raw



#install-kvm-qemu:
#	sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat



#
# ======== SERIAL DEBUG ========
#

serial-debug:
	cat ./docs/sdebug.txt


#
# Image support.
#

kernel-version:
	@echo $(KERNELVERSION)

image-name:
	@echo $(KBUILD_IMAGE)


kernel-file-header:
	-rm docs/KFH.TXT
	readelf -h bin/boot/KERNEL.BIN > docs/KFH.TXT
	cat docs/KFH.TXT
	
kernel-program-headers:
	-rm docs/KPH.TXT
	readelf -l bin/boot/KERNEL.BIN > docs/KPH.TXT
	cat docs/KPH.TXT

kernel-section-headers:
	-rm docs/KSH.TXT
	readelf -S bin/boot/KERNEL.BIN > docs/KSH.TXT
	cat docs/KSH.TXT
	


#
# gcc support
#

gcc-test:
	chmod 755 ./scripts/gcccheck
	./scripts/gcccheck


#
# ======== USAGE ========
#

help:
	@echo " help:"
	@echo " all          - make all"
	@echo " clean        - Remove all .o files"
	@echo " clean2       - Remove .VHD and .ISO files"
	@echo " vhd-mount    - Mount VHD"
	@echo " vhd-unmount  - Unmount VHD"
	@echo " qemu-test    - Run on qemu" 
	@echo " oracle-virtual-box-test - Run on virtual-box"
	@echo " ..."

