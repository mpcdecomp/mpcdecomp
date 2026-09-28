# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# make mpc3000-borland-check rebuilds parts of the MPC3000 images with their
# own compiler (toolchain/check.sh), in a podman image built from Containerfile
# and kept by podman's cache.  Opt-in: no image build needs it.
mpc3000-borland-check: $(foreach v,308 311 312,$(call out,src/mpc3000/v$(v)))
	@podman build -q -t mpcdecomp-borland -f src/mpc3000/toolchain/Containerfile src/mpc3000/toolchain >/dev/null
	@podman run --rm -v $(CURDIR):/s:ro -v $(abspath $(B)):/r:ro mpcdecomp-borland sh /s/src/mpc3000/toolchain/check.sh

.PHONY: mpc3000-borland-check
