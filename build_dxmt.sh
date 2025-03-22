## configure
cd dxmt-aqua
export PATH="$PATH:$(pwd)/toolchains/llvm-mingw-20231017-ucrt-macos-universal/bin"
INSTALL_PATH=/opt/stuff/wine/dxmt-target
meson setup \
  -Dnative_llvm_path=toolchains/llvm-darwin \
  -Dwine_install_path=/opt/stuff/wine/target \
  -Dwine_builtin_dll=true \
  -Denable_nvapi=true \
  -Denable_nvngx=true \
  --prefix $INSTALL_PATH \
  --cross-file build-win64.txt \
  --native-file build-osx.txt \
  --buildtype release build
## build
meson compile -C build
## install
meson install -C build
