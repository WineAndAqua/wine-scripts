#!/bin/sh

TOP=$(pwd)

cd d8vk

WINE_LIBS=/opt/stuff/wine/libs/target

PATH=${WINE_LIBS}/bin:${PATH}

meson setup --reconfigure \
  -Denable_d3d8=true \
  -Denable_d3d9=true \
  -Denable_dxgi=false \
  -Denable_d3d10=false \
  -Denable_d3d11=false \
  --prefix /opt/stuff/wine/dxvk-target \
  --cross-file build-win32.txt \
  --buildtype release \
  build.w32
meson compile -C build.w32

mkdir -p ${TOP}/dxvk-target/i386-windows
cp build.w32/src/d3d8/d3d8.dll ${TOP}/dxvk-target/i386-windows
cp build.w32/src/d3d9/d3d9.dll ${TOP}/dxvk-target/i386-windows
