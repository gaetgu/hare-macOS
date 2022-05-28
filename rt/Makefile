libhart_srcs+=\
	rt/abort.ha \
	rt/cstrings.ha \
	rt/compile.ha \
	rt/ensure.ha \
	rt/malloc.ha \
	rt/memcpy.ha \
	rt/memmove.ha \
	rt/memset.ha \
	rt/rtmain.ha \
	rt/strcmp.ha

libhart.a: harec $(libhart_srcs) $(libhart_objs) $(rtstart)
	@printf 'HAREC\t$@\n'
	@mkdir -p $(HARECACHE)/rt
	@./harec -Nrt -t$(HARECACHE)/rt/rt.td -o $@.ssa $(libhart_srcs)
	@$(QBE) -o $@.s $@.ssa
	@arch -x86_64 $(AS) -g -o $@.o $@.s # It is currently necessary, because QBE outputs x64 assembly only. But wait! according to harelang.org, aarch64 (== arm64) is supported! yeah IDK how.
	@$(AR) -csr $@ $@.o $(libhart_objs)
	@rm $@.o $@.s $@.ssa

clean-rt:
	@rm -f libhart.a $(libhart_objs) $(rtstart)

.PHONY: rt clean-rt
