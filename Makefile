# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
B       ?= build
T       ?= $(B)/toolchain
ASL     ?= $(T)/asl
P2BIN   ?= $(T)/p2bin

ASL_BLD  = asl-current-142-bld299
ASL_URL ?= http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/$(ASL_BLD).tar.gz
ASL_TAR ?= $(T)/$(ASL_BLD).tar.gz
ASL_SHA  = 800176c4c8c88e0d8b6b41f42915d31f9623a773ec0a504606d5594aec646b15

# target = dir with image.asm; target.mk: IMAGE (output), CHECKS (awk),
# SUM (checksum), BANNER (announces options), SPLIT (the even- and
# odd-byte EPROMs, cut from IMAGE); parents build targets
ALL     := $(sort $(patsubst %/image.asm,%,$(shell find src -name image.asm)))
TARGETS ?= $(ALL)
tag      = $(subst /,-,$(1:src/%=%))
up       = $(if $(filter src,$(1)),,$(1) $(call up,$(patsubst %/,%,$(dir $(1)))))
GROUPS  := $(sort $(foreach t,$(ALL),$(call up,$(t))))
GOALS   := $(strip $(foreach g,$(GROUPS),$(if $(filter $(call tag,$(g)),$(MAKECMDGOALS)),$(g))))
ifneq ($(GOALS),)
TARGETS := $(foreach t,$(ALL),$(if $(filter $(GOALS) $(addsuffix /%,$(GOALS)),$(t)),$(t)))
endif
# A target sees the common/ of every directory above it.
common   = $(foreach d,$(wildcard $(addsuffix /common,$(call up,$(1)))),$(shell find $(d) -type f))
out      = $(B)/$(call tag,$(1))/$(IMAGE_$(call tag,$(1)))

define load
IMAGE :=
CHECKS :=
SUM :=
BANNER :=
SPLIT :=
include $(1)/target.mk
$(foreach v,IMAGE CHECKS SUM BANNER SPLIT,$(v)_$(call tag,$(1)) := $$($(v))
)
endef
$(foreach t,$(TARGETS),$(eval $(call load,$(t))))

# build option declared in feat/*.mk, next to code:
#   $(call feature,OPTION,targets that implement it)
# plus: NOBANNER += OPTION (not stamped), NOCHECK_OPTION := exempt checks,
# SHA256SUMS.OPTION (images match); SUPERSEDES_OPTION (replaces when both)
feature  = $(eval OPTS += $(1))$(foreach t,$(2),$(eval IMPL_$(t) += $(1)))
include $(sort $(shell find src -path '*/feat/*.mk'))

asked    = $(strip $(foreach o,$(OPTS),$(if $($(o)),$(o))))
taken    = $(filter $(IMPL_$(1)),$(asked))
banner   = $(if $(BANNER_$(1)),$(filter-out $(NOBANNER),$(filter $(IMPL_$(BANNER_$(1))),$(asked))))
dropped  = $(filter-out $(IMPL_$(1)) $(call banner,$(1)),$(asked))
changed  = $(strip $(call taken,$(1)) $(call banner,$(1)))
checks   = $(filter-out $(foreach o,$(call taken,$(1)),$(NOCHECK_$(o))),$(CHECKS_$(1)))
DEFS     = $(foreach o,$(sort $(call changed,$(1))),-D $(o)=$($(o))) $(if $(call banner,$(1)),-D FEATURE_BUILD=1)
FEATURED = $(strip $(foreach t,$(TARGETS),$(if $(call changed,$(call tag,$(t))),$(call tag,$(t)))))
STOCKED  = $(strip $(foreach t,$(TARGETS),$(if $(call changed,$(call tag,$(t))),,$(call tag,$(t)))))

ifeq ($(MAKELEVEL)$(if $(asked),,-),0)
$(info options: $(foreach o,$(asked),$(o)=$($(o))))
$(foreach t,$(TARGETS),$(if $(and $(IMPL_$(call tag,$(t))),$(call dropped,$(call tag,$(t)))),\
  $(info   $(call tag,$(t)): no implementation for $(call dropped,$(call tag,$(t))) -- built without)))
$(if $(STOCKED),$(info   stock, implements none of these: $(STOCKED)))
endif

# make 3.81 ignores a -j set inside a makefile, hence the sub-make.
JOBS    ?= $(shell getconf _NPROCESSORS_ONLN)

all:
	@$(MAKE) --no-print-directory -j$(JOBS) TARGETS="$(TARGETS)" images
	@$(MAKE) --no-print-directory TARGETS="$(TARGETS)" verify

$(foreach g,$(GROUPS),$(call tag,$(g))): all

images: $(foreach t,$(TARGETS),$(call out,$(t)))

# A target's -D set, rewritten only when it changes, so flipping an option
# rebuilds just the targets it reaches.
.PHONY: FORCE
FORCE:
$(B)/%/.opts: FORCE
	@mkdir -p $(@D)
	@printf '%s\n' '$(call DEFS,$*)' > $@.tmp
	@cmp -s $@.tmp $@ || mv -f $@.tmp $@
	@rm -f $@.tmp

# One assembler run per target.  The target's own directory is on the include
# path, so a shared file includes a version's table by bare name.  A SUM
# program prints "offset was is lo hi" for a stored word that is stale.
define target
$(call out,$(1)): $(shell find $(1) -type f) $(call common,$(1)) $(B)/$(call tag,$(1))/.opts | $$(ASL)
	@mkdir -p $$(@D)
	@$$(ASL) -q -L -lateerrors -i $(1) $$(call DEFS,$(call tag,$(1))) \
	  -olist $$(@D)/image.lst -o $$(@D)/image.p $(1)/image.asm
	@$$(P2BIN) $$(@D)/image.p $$@ -q
	@for c in $$(call checks,$(call tag,$(1))); do awk -f toolchain/$$$$c.awk $$(@D)/image.lst || exit 1; done
	@for s in $(SUM_$(call tag,$(1))); do od -An -tu1 -v $$@ | awk -f toolchain/$$$$s.awk | while read at was is lo hi; do \
	  printf "\\$$$$lo\\$$$$hi" | dd of=$$@ bs=1 seek=$$$$at conv=notrunc status=none && \
	  echo "$$@  checksum $$$$was -> $$$$is"; done; done
	@$(if $(SPLIT_$(call tag,$(1))),od -An -tu1 -v $$@ | LC_ALL=C awk -f toolchain/split.awk \
	  -v even=$$(@D)/$(word 1,$(SPLIT_$(call tag,$(1)))) -v odd=$$(@D)/$(word 2,$(SPLIT_$(call tag,$(1)))),true)
	@echo "$$@  $$$$(wc -c < $$@ | tr -d ' ') bytes"
endef
$(foreach t,$(TARGETS),$(eval $(call target,$(t))))

toolchain: $(ASL)

# ASL_SRC = patched tree (fallback when server fails); patches must not
# change any output byte, so patch rebuild affects toolchain only
$(ASL) $(P2BIN): toolchain/code86.patch toolchain/perf.patch
	@mkdir -p $(T)
	@rm -rf $(T)/src && mkdir -p $(T)/src
ifeq ($(ASL_SRC),)
	@test -s $(ASL_TAR) || curl -fsSL -o $(ASL_TAR) $(ASL_URL) || { \
	    echo "fetch failed ($(ASL_URL)) -- retry as: make ASL_TAR=/path/to/$(ASL_BLD).tar.gz"; \
	    echo "or point at an already-patched tree: make ASL_SRC=/path/to/asl-current"; exit 1; }
	@tar xf $(ASL_TAR) -C $(T)/src --strip-components=1
	@patch -d $(T)/src -p1 --no-backup-if-mismatch < toolchain/code86.patch || { \
	    echo "the patch did not apply -- $(ASL_TAR) is not $(ASL_BLD)"; exit 1; }
	@patch -d $(T)/src -p1 --no-backup-if-mismatch < toolchain/perf.patch || { \
	    echo "perf.patch did not apply -- $(ASL_TAR) is not $(ASL_BLD)"; exit 1; }
else
	@cp -R $(ASL_SRC)/. $(T)/src/
	@patch -d $(T)/src -p1 -R -f -s --dry-run < toolchain/perf.patch >/dev/null 2>&1 || \
	  patch -d $(T)/src -p1 --no-backup-if-mismatch < toolchain/perf.patch || { \
	    echo "perf.patch did not apply to $(ASL_SRC)"; exit 1; }
endif
	@echo "$(ASL_SHA)  $(T)/src/code86.c" | shasum -a 256 -c - || { \
	    echo "not the known-good code86.c -- a fuzzy patch emits wrong bytes"; exit 1; }
	@cp toolchain/Makefile.def $(T)/src/
	@$(MAKE) -C $(T)/src -s asl p2bin > $(T)/build.log 2>&1 || true
	@test -x $(T)/src/asl || { echo "build failed -- see $(T)/build.log"; exit 1; }
	@cp $(T)/src/asl $(T)/src/p2bin $(T)/

# SHA256SUMS for stock images; when option set, image differs, succeeds
# embedded checksums verified where present
verify:
	@cd $(B) && while read sum img; do \
	    case " $(STOCKED) " in *" $${img%%/*} "*) ;; *) continue;; esac; \
	    [ -f "$$img" ] && echo "$$sum  $$img"; \
	  done < $(abspath SHA256SUMS) > .sums; \
	  rc=0; [ -s .sums ] && { shasum -a 256 -q -c .sums || rc=$$?; }; \
	  [ $$rc = 0 ] && echo "verify: $$(wc -l < .sums | tr -d ' ') match SHA256SUMS$(if $(FEATURED), -- skipped: $(FEATURED))"; \
	  rm -f .sums; exit $$rc
	@$(foreach t,$(TARGETS),$(foreach s,$(SUM_$(call tag,$(t))),[ ! -f $(call out,$(t)) ] || \
	  od -An -tu1 -v $(call out,$(t)) | awk -f toolchain/$(s).awk | while read at was is x; do \
	  echo "$(call out,$(t))  checksum $$was, should be $$is -- its loader will refuse it"; exit 1; done || exit 1;)) true
	@$(foreach o,$(filter-out $(foreach a,$(asked),$(SUPERSEDES_$(a))),$(asked)),$(if $(wildcard SHA256SUMS.$(o)),(cd $(B) && shasum -a 256 -q -c $(abspath SHA256SUMS.$(o))) && \
	  echo "verify: $(o) images match SHA256SUMS.$(o)" &&)) true

# clean keeps the toolchain: upstream serves 403, so it may not be re-fetchable.
clean:
	@rm -rf $(filter-out $(T),$(wildcard $(B)/*))

distclean:
	@rm -rf $(B)

.PHONY: all images toolchain verify clean distclean $(foreach g,$(GROUPS),$(call tag,$(g)))
