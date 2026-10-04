#include "mpc2k.h"

void __near velo_mod_arm_field(void)
{
	char far *v0;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset2)((unsigned char)((char *)&G_PAD_NOTE_BASE)[0]);
	switch (VELO_MOD_CURSOR) { case 0: goto br_05B8C; case 1: goto br_05BD8; case 2: goto br_05BA2; case 3: goto br_05BB4; case 4: goto br_05BC6; }
	VELO_MOD_CURSOR = 1;
	goto br_05BD8;
br_05B8C:
	timer_value_read_1(((char *)&G_PAD_NOTE_BASE), 0x37, 0xb, 0);
	WIN_FIELD_BOX_W = 0xa2;
	return;
br_05BA2:
	status_read_6A_3(v0 + 0x19, 0, 0x64, 3, 0x67, 0x21, 0, 0, 0, 0);
	return;
br_05BB4:
	status_read_6A_3(v0 + 0x17, 0, 0x64, 3, 0x67, 0x2b, 0, 0, 0, 0);
	return;
br_05BC6:
	status_read_6A_3(((char *)&G_VELOCITY_MAX), 1, 0x7f, 3, 0xc7, 0x28, 0, 0, 0, 0);
	return;
br_05BD8:
	status_read_6A_3(v0 + 0x18, 0, 0x64, 3, 0x67, 0x17, 0, 0, 0, 0);
}
