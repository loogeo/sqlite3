void *dlopen(const char *filename, int flag) { return 0; }
char *dlerror(void) { return 0; }
void *dlsym(void *handle, const char *symbol) { return 0; }
int dlclose(void *handle) { return 0; }
void *dl_unwind_find_exidx(void *pc, int *pcount) { return 0; }
