#!/bin/sh
#
# http://maxwit.googlecode.com
#


./configure \
	--prefix=/usr \
	|| exit 1

make || exit 1
make install || exit 1
