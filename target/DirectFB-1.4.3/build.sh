#!/bin/sh
#
# http://code.google.com/p/maxwit/
#

#ac_cv_header_asm_page_h=no \
#hardcode_into_libs=no \

TSLIB_CFLAGS=${ROOTFS_PATH}/usr/include \
TSLIB_LIBS=${ROOTFS_PATH}/usr/lib \
ac_cv_path_LIBPNG_CONFIG=${ROOTFS_PATH}/usr/bin/libpng-config \
./configure \
	--prefix=/usr \
	--build=${BUILD_PLAT} \
	--host=${TARGET_PLAT} \
    --with-gfxdrivers=none \
    --disable-x11 \
    --disable-sdl \
    --enable-fbdev \
    --enable-zlib \
    --with-inputdrivers=keyboard,linuxinput,ps2mouse,tslib \
    --disable-video4linux \
    --disable-video4linux2 || exit 1

make || exit
make DESTDIR=${ROOTFS_PATH} install || exit

# sed -i "s:^prefix=/usr$:prefix=${ROOTFS_PATH}/usr:" ${ROOTFS_PATH}/usr/lib/pkgconfig/direct*.pc && \
# sed -i "s:^prefix=/usr$:prefix=${ROOTFS_PATH}/usr:" ${ROOTFS_PATH}/usr/lib/pkgconfig/fusion*.pc || exit 1
