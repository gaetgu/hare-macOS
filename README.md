# harec

This is the [Hare](https://harelang.org) compiler ported (WIP) to macOS.

## Build status

See [Notes](#Notes).

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

**STATUS: `make`s successfully, `make check` fails**


**Error Fixes**

For those who think that this is comprehensive or even understandable, think again. If anything, this is a whole list of reasons to **not** use this because of the horrible ways that I stumbled to random fixes. Might blow up your computer?

- For the `.section "something"` errors, add `, "ax"` to the end of the line. This couldn't possibly go wrong, right? (I 
  might try changing all of those `"ax"`s to just `"a"` and see what happens)
- For the `.section .text.something` errors, replace the entire line with `.text`. This couldn't possibly go wrong, right?
  (I am actually pretty sure that this one will work out. From what I see, the extra stuff is just for GAS assembly)
- `error: ADR/ADRP relocations must be GOT relative`, `error: unknown AArch64 fixup kind!`: I actually did some stuff to `QBE`
  (nothing massive, see diff [here](https://github.com/gaetgu/qbe-macOS/commit/524497fd68144f79c0e9b61b7f025c4cc4f72594)) to 
  fix this. See [this](https://stackoverflow.com/a/65354324/12252022) SO answer.
- `Undefined symbols for architecture (insert arch)` (on `make check`): Nothing yet. Fixing this is the current priority. It
  might be caused by differences between where FreeBSD keeps stuff and macOS? Who knows.