# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# make mpc2000-msc-check rebuilds parts of the MPC2000 SYS and XL images with
# their own compiler (toolchain/check.sh), in a podman image built from
# Containerfile and kept by podman's cache.  Opt-in: no image build needs it.
mpc2000-msc-check: $(foreach v,107 110 111 112 114 120,$(call out,src/mpc2000/xl/v$(v))) $(foreach v,150 172,$(call out,src/mpc2000/2k/v$(v)/sys))
	@podman build -q -t mpcdecomp-msc -f src/mpc2000/toolchain/Containerfile src/mpc2000/toolchain >/dev/null
	@podman run --rm -v $(CURDIR):/s:ro -v $(abspath $(B)):/r:ro mpcdecomp-msc sh /s/src/mpc2000/toolchain/check.sh

.PHONY: mpc2000-msc-check
