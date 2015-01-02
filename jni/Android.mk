LOCAL_PATH := /home/user/android_stuff/sqlite-amalgamation-3080704

#########################

include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES :=  shell.c sqlite3.c arm-pwrite64.S arm-pread64.S arm-ftruncate64.S

LOCAL_MODULE := sqlite3

LOCAL_CFLAGS := -march=armv6 -mfloat-abi=softfp -pipe -fPIE -fomit-frame-pointer -flto -O3 -Wl,--gc-sections -ffunction-sections -static -DUSE_PREAD64

LOCAL_LDFLAGS := -march=armv6 -mfloat-abi=softfp -pipe -fPIE -fomit-frame-pointer -flto -O3 -Wl,--gc-sections -ffunction-sections -static -DUSE_PREAD64

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -ldl

include $(BUILD_EXECUTABLE)
