ifeq ($(shell arch), i686)
  TARGET=X86
  TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64
endif
ifeq ($(shell arch), ppc64)
  TARGET=PPC64
  TARGET_CFLAGS=-m64
endif
ifeq ($(shell arch), ia64)
  TARGET=IA64
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), x86_64)
  TARGET=X86_64
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), s390x)
  TARGET=S390X
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), s390)
  TARGET=S390
  TARGET_CFLAGS=
endif

INCDIR=/usr/include/crash

all: trace.so
	
trace.so: $(INCDIR)/defs.h trace.c 
	gcc $(RPM_OPT_FLAGS) -Wall -I$(INCDIR) -nostartfiles -shared -rdynamic -o trace.so trace.c -fPIC -D$(TARGET) $(TARGET_CFLAGS)
