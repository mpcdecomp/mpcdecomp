# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# make mpc60-aztec-check rebuilds parts of the MPC60 images with their own
# compiler (toolchain/check.sh), in a podman image built from Containerfile and
# kept by podman's cache.  Opt-in: no image build needs it.
mpc60-aztec-check: $(foreach v,112 212 214,$(call out,src/mpc60/v$(v)))
	@podman build -q -t mpcdecomp-aztec -f src/mpc60/toolchain/Containerfile src/mpc60/toolchain >/dev/null
	@podman run --rm -v $(CURDIR):/s:ro -v $(abspath $(B)):/r:ro mpcdecomp-aztec sh /s/src/mpc60/toolchain/check.sh

.PHONY: mpc60-aztec-check
