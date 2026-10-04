# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# make mpc2000-msc-check rebuilds parts of the MPC2000 SYS and XL images with
# their own compiler (toolchain/check.sh), in a podman image built from
# Containerfile and kept by podman's cache.  Opt-in: no image build needs it.
# MSC=2k checks the 2K SYS alone and needs no XL build.  Objects and links
# are cached in $(B)/msc-cache by what went into them; JOBS= DOSBoxes run
# at once (default: one a CPU).
mpc2000-msc-check: $(if $(filter 2k,$(MSC)),,$(foreach v,107 110 111 112 114 120,$(call out,src/mpc2000/xl/v$(v)))) $(foreach v,150 172,$(call out,src/mpc2000/2k/v$(v)/sys))
	@podman build -q -t mpcdecomp-msc -f src/mpc2000/toolchain/Containerfile src/mpc2000/toolchain >/dev/null
	@mkdir -p $(B)/msc-cache
	@podman run --rm -e MSC=$(MSC) -e JOBS=$(JOBS) -v $(CURDIR):/s:ro -v $(abspath $(B)):/r:ro \
		-v $(abspath $(B))/msc-cache:/cache mpcdecomp-msc sh /s/src/mpc2000/toolchain/check.sh

# The same on the host, faster: dosbox-x, and MSVC= the directory holding
# the Containerfile's files (BIN/, LIB/, INCLUDE/).  The container's is the
# reference; this keeps a cache of its own.
mpc2000-msc-check-host: $(if $(filter 2k,$(MSC)),,$(foreach v,107 110 111 112 114 120,$(call out,src/mpc2000/xl/v$(v)))) $(foreach v,150 172,$(call out,src/mpc2000/2k/v$(v)/sys))
	@test -f "$(MSVC)/BIN/CL.EXE" || { echo "MSVC=: no BIN/CL.EXE in '$(MSVC)'" >&2; exit 1; }
	@mkdir -p $(B)/msc-cache-host
	@MSC=$(MSC) JOBS=$(JOBS) S=$(CURDIR) R=$(abspath $(B)) CACHE=$(abspath $(B))/msc-cache-host \
		MSVC=$(abspath $(MSVC)) sh src/mpc2000/toolchain/check.sh

.PHONY: mpc2000-msc-check mpc2000-msc-check-host
