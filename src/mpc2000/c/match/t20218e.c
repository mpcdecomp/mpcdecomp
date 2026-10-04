#include "mpc2k.h"

#pragma intrinsic(memset)

struct voice { unsigned char note; char rest[17]; };

int __far __pascal voice_alloc(int note)
{
	unsigned char i;
	signed char best;
	unsigned n;
	int d;

	G_VOICE_ALLOC_NEXT++;
	memset(TBL_4F10, 0, sizeof TBL_4F10);
	best = 0;
	n = 0xff;
	d = n;
	i = 0;
	do {
		G_VOICE_ALLOC_NEXT++;
		if (G_VOICE_ALLOC_NEXT >= 0x20) G_VOICE_ALLOC_NEXT = 0;
		if (!P_9A4E[G_VOICE_ALLOC_NEXT]) {
			if ((TBL_VOICE_AGE_SNAP[G_VOICE_ALLOC_NEXT] = VOICE_TIMER[G_VOICE_ALLOC_NEXT]) == 0)
				goto done;
			n = ((struct voice *)VOICE_TABLE)[G_VOICE_ALLOC_NEXT].note;
			if (++TBL_4F10[n] > best) {
				best = TBL_4F10[n];
				d = n;
			}
		}
	} while (++i < 0x20);
	i = 0;
	do {
		if (!P_9A4E[G_VOICE_ALLOC_NEXT]) break;
		G_VOICE_ALLOC_NEXT++;
		if (G_VOICE_ALLOC_NEXT >= 0x20) G_VOICE_ALLOC_NEXT = 0;
	} while (++i < 0x20);
#if FW_VERSION >= 172
	if (TBL_4F10[note] > 1) {
#else
	if (TBL_4F10[note]) {
#endif
		n = 0xffff;
		best = G_VOICE_ALLOC_NEXT;
		i = 0;
		do {
			if (!P_9A4E[i] && ((struct voice *)VOICE_TABLE)[i].note == note && TBL_VOICE_AGE_SNAP[i] < n) {
				n = TBL_VOICE_AGE_SNAP[i];
				best = i;
			}
		} while (++i < 0x20);
	} else if (best >= 3) {
		n = 0xffff;
		best = G_VOICE_ALLOC_NEXT;
		i = 0;
		do {
			if (!P_9A4E[i] && ((struct voice *)VOICE_TABLE)[i].note == d && TBL_VOICE_AGE_SNAP[i] < n) {
				n = TBL_VOICE_AGE_SNAP[i];
				best = i;
			}
		} while (++i < 0x20);
	} else {
		n = 0xffff;
		best = G_VOICE_ALLOC_NEXT;
		i = 0;
		do {
			if (!P_9A4E[i] && TBL_VOICE_AGE_SNAP[i] < n) {
				n = TBL_VOICE_AGE_SNAP[i];
				best = i;
			}
		} while (++i < 0x20);
	}
	G_VOICE_ALLOC_NEXT = best;
done:
	return G_VOICE_ALLOC_NEXT;
}
