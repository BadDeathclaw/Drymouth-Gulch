#!/usr/bin/env bash

set -e

source dependencies.sh

if [ $BUILD_TOOLS = false ] && [ $BUILD_TESTING = false ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-host i686-unknown-linux-gnu
    source ~/.profile

    mkdir rust-g
    cd rust-g
    git init
    git remote add origin https://github.com/tgstation/rust-g
    git fetch --depth 1 origin $RUST_G_VERSION
    git checkout FETCH_HEAD
    cargo build --release
    cmp target/rust_g.dm ../code/__DEFINES/rust_g.dm

    mkdir -p ~/.byond/bin
    ln -s $PWD/target/release/librust_g.so ~/.byond/bin/rust_g
	#no bsql yet
fi
