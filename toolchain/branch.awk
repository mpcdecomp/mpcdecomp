# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f branch.awk image.lst -- fail on a branch whose target is a number.
#
# A near call or jump encodes its target relative to itself, so `call 31ah`
# assembles to wherever 31Ah is in the part being assembled: grow anything ahead
# of the routine that lives there and the branch still lands on 31Ah, short of
# it.  The target wants its label.

/ : [0-9A-F][0-9A-F] / {
    s = substr($0, index($0, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s)
    if (s ~ /^(call|jmp|j[a-z]+|loop[a-z]*)[ \t]+(short[ \t]+|near[ \t]+)?[0-9][0-9a-fA-F]*h?$/) {
        printf "%s:%d: branch target is a number: %s\n", FILENAME, FNR, s; rc = 1
    }
}
END {
    if (rc) print "branch: name the target (a label)"
    exit rc
}
