#include "mpc2krec.h"

extern unsigned char STR_NO_SOUND_PADDED[21];
extern unsigned char STR_OFF_PADDED[21];
extern unsigned char STR_ST_SUFFIX[5];
extern unsigned char STR_ST_SUFFIX_BLANK[5];
void __far __pascal cmd_dispatch_1E(int, int, char __far *);
long __far far_078E4(void);

#define S(x) ((char __far *)(x))

void __far __pascal timer_value_read_4(struct SND __far *s, int x, int y)
{
	if (far_078E4()) {
		if (s) {
			cmd_dispatch_1E(x, y, (char __far *)s);
			cmd_dispatch_1E(x + 0x60, y, S(s->stereo ? STR_ST_SUFFIX : STR_ST_SUFFIX_BLANK));
		} else
			cmd_dispatch_1E(x, y, S(STR_OFF_PADDED));
	} else
		cmd_dispatch_1E(x, y, S(STR_NO_SOUND_PADDED));
}
