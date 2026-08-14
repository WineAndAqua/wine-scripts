## configure
cd dxmt-aqua
export PATH="$PATH:$(pwd)/toolchains/llvm-mingw-20231017-ucrt-macos-universal/bin"
INSTALL_PATH=/opt/stuff/wine/dxmt-target-x86
meson setup \
  -Dnative_llvm_path=toolchains/llvm-darwin \
  -Dwine_builtin_dll=true \
  -Dwine_install_path=toolchains/wine \
  -Denable_nvapi=true \
  -Denable_nvngx=true \
  -Denable_d3d12=true \
  --prefix $INSTALL_PATH \
  --cross-file build-win64.txt \
  --buildtype debug \
  build
## build
meson compile -C build
## install
meson install -C build --tags runtime,nvext

## configure
meson setup \
  -Dnative_llvm_path=toolchains/llvm-darwin \
  -Dwine_builtin_dll=true \
  -Dwine_install_path=toolchains/wine \
  -Denable_nvapi=false \
  -Denable_nvngx=false \
  --prefix $INSTALL_PATH \
  --cross-file build-win32.txt \
  --buildtype release \
  build32
## build
meson compile -C build32
## install
meson install -C build32 --tags runtime
