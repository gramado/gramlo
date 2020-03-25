# Compiling KERNEL.BIN
# 2020 - Fred Nora.

ARCH ?= x86
#ARCH ?= x86_64



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



ifeq ($(ARCH),x86)

CFLAGS = -m32 \
	-std=gnu89 \
	-nodefaultlibs \
	-nostdinc \
	-nostdlib \
	-static \
	-fgnu89-inline \
	-ffreestanding \
	-fno-builtin \
	-fno-pie \
	-fleading-underscore \
	-fno-stack-protector \
	-s \
	-Werror=strict-prototypes    

LDFLAGS = -m elf_i386 

endif



KINCLUDE = -I include/


##
## Objects
##

ifeq ($(ARCH),x86)

	OBJECTS := main.o   

endif



all: all-c link-kernel clean

all-c:

	#
	# init/
	#

	# main (Architechture independent)
	$(CC) -c main.c $(KINCLUDE) $(CFLAGS) -o main.o

	

## Step2 link-kernel-image  - Linking the kernel image.
#kernel-image-link:

link-kernel:
	@echo "================================="
	@echo "(Step 2) Linking the kernel image ..."

	$(LD) $(LDFLAGS) -T link.ld -o KERNEL.BIN $(OBJECTS)  

clean:
	rm -rf *.o   
	
	



