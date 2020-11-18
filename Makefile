all:
	nasm -f elf htat.asm
	ld -m elf_i386 -s -o htat htat.o
