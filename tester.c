#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>

#define MAX_SIZE 2048

char buf[MAX_SIZE];

int main(int argc, char** argv) {
  char* filename = argv[1];

  int f = open(filename, O_RDONLY);  
  int size = read(f, buf, MAX_SIZE);

  size_t pagesize = getpagesize();
  size_t start = ((size_t) buf) & -pagesize;
  
  mprotect((void*) start, MAX_SIZE, PROT_WRITE | PROT_EXEC);

  size_t bits = sizeof(void*) * CHAR_BIT;
  printf("Compiled for x86-%d\n", bits);
  printf("Loaded %d bytes of code\n", size);

  void (*fun)(void) = (void (*)(void)) buf;
  
  fun();
  
  return 0;
}
