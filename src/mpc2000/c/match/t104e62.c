#include "mpc2k.h"

typedef void (__far *FN)(void);

void __near fx_mixer_arm_field(void)
{
	char __far *p;

	if (!G_FLAG_1589) {
		G_FLAG_1589++;
		p = (char __far *)channel_get_ptr(G_STATE_9D8B);
		switch (FX_MIXER_CURSOR) {
		default:
			FX_MIXER_CURSOR = 0;
			goto c0;
		case 1:
			((void (__far __pascal *)(char __far *, int, int, int, int, int, long, FN))field_register_s8)(p + 0xb, -0x32, 0x32, 2, 0xbb, 0x1f, 0L, far_04B42);
			break;
		case 0:
		c0:
			((void (__far __pascal *)(char __far *, int, int, int, int, int, long, FN))status_read_6A_3)(p + 0xa, 0, 0x63, 2, 0xa9, 0x1f, 0L, far_04B42);
		}
		G_FLAG_1589--;
	}
}
