ASM=nasm

SRCDIR=src
BUILDDIR=build

$(BUILDDIR)/main_floppy.img: $(BUILDDIR)/main.bin
	cp $(BUILDDIR)/main.bin $(BUILDDIR)/main_floppy.img
	truncate -s 1440k $(BUILDDIR)/main_floppy.img

$(BUILDDIR)/main.bin: $(SRCDIR)/main.asm
	$(ASM) $(SRCDIR)/main.asm -f bin -o $(BUILDDIR)/main.bin
