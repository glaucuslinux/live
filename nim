#!/bin/sh

# SPDX-License-Identifier: MPL-2.0

# Copyright © 2025 Firas Khana

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

exec nim compile \
  -d:release \
  -d:useMalloc \
  -d:lto \
  -d:strip \
  -o:../rad/rad-x86-64-v3-glaucus-linux-musl \
  --os:linux \
  --cpu:amd64 \
  --passC:"-O2 -fgraphite-identity -floop-nest-optimize -flto=auto -flto-compression-level=3 -fuse-linker-plugin -fstack-protector-strong -fstack-clash-protection -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-plt -march=x86-64-v3 -malign-data=cacheline -mtls-dialect=gnu2" \
  --passL:"-Wl,-O1,-s,-z,noexecstack,-z,now,-z,pack-relative-relocs,-z,relro,-z,x86-64-v3,--as-needed,--gc-sections,--sort-common,--hash-style=gnu -Wno-stringop-overflow -O2 -fgraphite-identity -floop-nest-optimize -flto=auto -flto-compression-level=3 -fuse-linker-plugin -fstack-protector-strong -fstack-clash-protection -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-plt -march=x86-64-v3 -malign-data=cacheline -mtls-dialect=gnu2" \
  --gcc.exe:../toolchain/usr/bin/x86_64-glaucus-linux-musl-gcc \
  --gcc.linkerexe:../toolchain/usr/bin/x86_64-glaucus-linux-musl-gcc \
  ../rad/src/rad.nim
