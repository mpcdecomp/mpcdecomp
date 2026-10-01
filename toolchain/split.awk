# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# od -An -tu1 -v IMAGE | LC_ALL=C awk -v even=LO -v odd=HI -f split.awk --
# cuts a 16-bit bus image into its two byte-wide EPROMs.  Not p2bin -m even:
# it misplaces a record that starts at an odd address.
{ for (i = 1; i <= NF; i++) printf "%c", $i > ((n++ % 2) ? odd : even) }
