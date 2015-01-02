echo YOU MUST RUN THIS SCRIPT WITH THE SOURCE COMMAND\!\!
echo ex. source compile.sh 3 6
echo THE FIRST ARGUMENT IS FOR THE ANDROID ABI LEVEL\!\!
echo THE SECOND ARGUMENT IS FOR THE ARM ARCH - 6 or 7\!\!
BASEDIR=/home/user/android_stuff
export CC="/home/user/android-ndk-r10c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86/bin/arm-linux-androideabi-gcc --sysroot=/home/user/android-ndk-r10c/platforms/android-$1/arch-arm/"
export CXX="/home/user/android-ndk-r10c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86/bin/arm-linux-androideabi-g++ --sysroot=/home/user/android-ndk-r10c/platforms/android-$1/arch-arm/ -I/home/user/android-ndk-r10c/sources/cxx-stl/gnu-libstdc++/4.9/include -I/home/user/android-ndk-r10c/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include/ -I /home/user/android-ndk-r10c/sources/cxx-stl/stlport/stlport/ "
#export LD="/home/user/android-ndk-r10c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86/bin/arm-linux-androideabi-ld --sysroot=/home/user/android-ndk-r10c/platforms/android-$1/arch-arm/"
export STRIP="/home/user/android-ndk-r10c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86/bin/arm-linux-androideabi-strip"
if test $2 -eq "6"
then
export ARCH_FLAGS="-marm -march=armv6 -mfloat-abi=softfp -L$BASEDIR/armv6_lib -I$BASEDIR/armv6_inc"
export ARCH_LINK="-march=armv6 -flto -Wl,--gc-sections -L$BASEDIR/armv6_lib -I$BASEDIR/armv6_inc"
else
export ARCH_FLAGS="-marm -march=armv7-a -mfpu=neon -mfloat-abi=hard -mhard-float -D_NDK_MATH_NO_SOFTFP=1 -ftree-vectorize -mvectorize-with-neon-quad -ftree-vectorizer-verbose=2 -funsafe-math-optimizations -L$BASEDIR/armv7_lib -I$BASEDIR/armv7_inc"
export ARCH_LINK="-march=armv7-a -flto -Wl,--gc-sections -Wl,-lm_hard -Xlinker --no-warn-mismatch -L$BASEDIR/armv7_lib -I$BASEDIR/armv7_inc -static"
fi
export CPPFLAGS=" ${ARCH_FLAGS} -pipe -fPIE -fomit-frame-pointer -flto -O3 -Wl,--gc-sections -ffunction-sections"
export CXXFLAGS=" ${ARCH_FLAGS} -pipe -fPIE -fomit-frame-pointer -flto -O3 -Wl,--gc-sections -ffunction-sections"
export CFLAGS=" ${ARCH_FLAGS} -pipe -fPIE -fomit-frame-pointer -flto -O3 -Wl,--gc-sections -ffunction-sections"
export LDFLAGS=" ${ARCH_LINK}"
