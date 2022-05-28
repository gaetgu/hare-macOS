# harec

This is the [Hare](https://harelang.org) compiler translated (WIP) for macOS.

## Build status

No idea. Might build on linux/bsd, it might not. It sort of works on macOS for now (see [notes](#Notes)).

## Building

```
make
sudo make install
```

Optionally, build and run the test suite as well:

```
make check
```

## Runtime

harec includes a minimal runtime under `rt` which is suitable for running the
test suite, but not recommended for production use. See `docs/runtime.txt` for
details on how to provide your own runtime implementation, or use the [Hare
standard library](https://git.sr.ht/~sircmpwn/hare) (Not compiling on macOS yet).

## Notes

**Status: Generates assembly, assembly may or may not compile and may or may not run.**

**This port doesn't work** (yet).

Specifically, harec-generated assembly compiles but does not run. I am pretty sure (though I don't really know assembly so I am not sure really) that this is due to the fact that there are some differences between FreeBSD and macOS that the assembler does not catch, but the OS doesn't want or know how to run. Right now

**Some other stuff:**

- Doesn't work on the BSDs/Linuxes right now since I hardcoded some mac-only arguments. I will change that soon so that it
  will work on other platforms

- `make check` fails. Tons of stuff about "`Undefined symbols for architecture arm64:`". Fixing this is the current priority

**Errors I ran into and what I did**

For those who think that this is comprehensive or even understandable, think again. If anything, this is a whole list of reasons to **not** use this because of the horrible ways that I stumbled to random fixes. Might blow up your computer?

- For the `.section "something"` errors, add `, "ax"` to the end of the line. This couldn't possibly go wrong, right?
- For the `.section .text.something` errors, replace the entire line with `.text`. This couldn't possibly go wrong, right?
  (This one and the last one are caused due to the difference between the GAS and Mach-O assemblers.)
- `error: ADR/ADRP relocations must be GOT relative`, `error: unknown AArch64 fixup kind!`: I actually did some stuff to `QBE`  (nothing massive, see diff [here](https://github.com/gaetgu/qbe-macOS/commit/524497fd68144f79c0e9b61b7f025c4cc4f72594)) to 
  fix this.
- `Undefined symbols for architecture arm64` (on `make check`): Nothing yet. Fixing this is the current priority.