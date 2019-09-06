#!/bin/bash
rm -f $PREFIX/bin/smux
cp ./smux $PREFIX/bin/
chmod 777 $PREFIX/bin/smux
echo Installed
