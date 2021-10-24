# harec

This is a [Hare](https://harelang.org) compiler written in C11 for
POSIX-compatible systems.

## Build status

<dl>
  <dt>Linux (x86_64)</dt><dd><a href="https://builds.sr.ht/~sircmpwn/harec/commits/alpine.yml"><img src="https://builds.sr.ht/~sircmpwn/harec/commits/alpine.yml.svg" alt="Build status for Linux" /></a></dd>
  <dt>FreeBSD (x86_64)</dt><dd><a href="https://builds.sr.ht/~sircmpwn/harec/commits/freebsd.yml"><img src="https://builds.sr.ht/~sircmpwn/harec/commits/freebsd.yml.svg" alt="Build status for FreeBSD" /></a></dd>
</dl>

## Building

```
mkdir build
cd build
../configure
make
```

Optionally, build and run the test suite as well:

```
make check
```

## Runtime

harec includes a minimal runtime under `rt` which is suitable for running the
test suite, but not recommended for production use. See `docs/runtime.txt` for
details on how to provide your own runtime implementation, or use the [Hare
standard library](https://git.sr.ht/~sircmpwn/hare).
