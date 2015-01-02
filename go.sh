$CC $CFLAGS shell.c sqlite3.c arm-ftruncate64.S arm-pread64.S arm-pwrite64.S libdl.c -DUSE_PREAD64 -static
