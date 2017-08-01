poly:
	nasm poly32.asm -o poly32 && ndisasm -b32 poly32
	nasm poly64.asm -o poly64 && ndisasm -b64 poly64
	cat poly32 > poly && cat poly64 >> poly
	@echo --- 32 bit
	ndisasm -b32 poly
	@echo --- 64 bit
	ndisasm -b64 poly

test: poly
	gcc -m32 tester.c -o tester && ./tester poly; echo $$?
	gcc -m64 tester.c -o tester && ./tester poly; echo $$?

clean:
	rm poly poly32 poly64 tester
