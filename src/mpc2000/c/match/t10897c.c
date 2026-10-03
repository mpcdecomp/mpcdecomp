#include "mpc2k.h"

void __near trim_arm_field(void)
{
	if (!((char __far *)SND_CURRENT)) {
		switch (G_TRACK_MODE) {
		case 1:
			break;
		default:
			G_TRACK_MODE = 0;
			break;
		}
	}
	switch (G_TRACK_MODE) {
	case 0:
		X_090B2();
		break;
	case 1:
		L_090D4();
		break;
	default:
		if (sample_check_active(((char __far *)SND_CURRENT))) {
			switch (G_TRACK_MODE) {
			case 2:
				((void (__far __pascal *)(char __far *, unsigned char, unsigned char, int, int, int, long, long))status_read_6A_3)(((char __far *)SND_CURRENT) + 0x11, ((char __far *)SND_CURRENT)[0x11], ((char __far *)SND_CURRENT)[0x11], 3, 0x31, 0x13, 0L, 0L);
				break;
			case 3:
				((void (__far __pascal *)(char __far *, unsigned char, unsigned char, int, int, int, long, long))status_read_6A_3)(((char __far *)SND_CURRENT) + 0x25, ((char __far *)SND_CURRENT)[0x25], ((char __far *)SND_CURRENT)[0x25], 2, 0xd3, 0x11, 0L, 0L);
				break;
			default:
				(*(char *)&G_EDIT_FIELD_VAL) = -0x78;
				((void (__far __pascal *)(char __far *, char, char, int, int, int, int, int, long))field_register_s8)(&(*(char *)&G_EDIT_FIELD_VAL), -0x78, -0x78, 3, 0x2b, 0x23, 0, 0, 0L);
				break;
			}
		} else {
			switch (G_TRACK_MODE) {
			case 2:
				((void (__far __pascal *)(char __far *, unsigned char, unsigned char, int, int, int, long, long))status_read_6A_3)(((char __far *)SND_CURRENT) + 0x11, 0, 0xc8, 3, 0x31, 0x13, 0L, 0L);
				break;
			case 3:
				((void (__far __pascal *)(char __far *, unsigned char, unsigned char, int, int, int, long, long))status_read_6A_3)(((char __far *)SND_CURRENT) + 0x25, 1, 0x20, 2, 0xd3, 0x11, 0L, 0L);
				break;
			default:
				((void (__far __pascal *)(char __far *, char, char, int, int, int, int, int, long))field_register_s8)(((char __far *)SND_CURRENT) + 0x12, -0x78, 0x78, 3, 0x2b, 0x23, 0, 0, 0L);
				break;
			}
		}
		break;
	}
	if (G_TRACK_MODE > 1) ((void (__far __pascal *)(long))install_handler_15)(0L);
}
