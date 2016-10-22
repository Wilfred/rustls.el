# rustls.el

Basic Emacs integration for the
[rust language server](https://github.com/jonathandturner/rustls/).

GPLv3 or later license, just like Emacs.

## Installing rustls

You need a recent nightly compiler:

``` bash
$ rustup update
$ cd /path/to/rustls
$ rustup override set nightly
```

Build and start rustls:

``` abap
$ cd /path/to/rustls
$ cargo build
$ SYSROOT=`rustc --print sysroot` cargo run
```

## Specification

rustls implements the Language Server Protocol, which is
[documented here](https://github.com/Microsoft/language-server-protocol/blob/master/protocol.md).
