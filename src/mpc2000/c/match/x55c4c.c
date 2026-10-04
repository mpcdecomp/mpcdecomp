#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_W_06686[1];

void __far sample_dump_field5_thunk(void)
{
	switch (((int (__far *)(char __far *))sound_list_contains)(C0_W_0D7C2)) { case 0: goto br_55C86; }
	if (C0_W_0D7C2[37]) {
		C2_W_SAMPLE_DUMP_CURSOR = 5;
		((void (__far *)(char __far *, long))ui_field_engine)(C2_W_06686, (*(long *)&C2_FP_MIDI_IN_BLOCK));
		return;
	}
br_55C86:
	sample_dump_field3_thunk();
}
