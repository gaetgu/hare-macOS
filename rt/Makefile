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
	$(QBE) $(QBE_FLAGS) -t arm64 -Gm -o $@.s $@.ssa	# TODO: Remove arm64-specific tags and make /config.sh work
	@$(AS) -g -o $@.o $@.s
	@$(AR) -csr $@ $@.o $(libhart_objs)
	@rm $@.o $@.s $@.ssa

clean-rt:
	@rm -f libhart.a $(libhart_objs) $(rtstart)

.PHONY: rt clean-rt
