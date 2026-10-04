#include "mpc2k.h"

typedef struct SND __far *SP;

void __far __fastcall __loadds zone_edit_do_it(void)
{
	int r;

	r = 1;
	voice_release_all_if((long)SND_CURRENT);
	disp_list_run(PTR_DL_PROCESSING);
	switch (ZONE_EDIT_ACTION) {
	case 0:
		r = ((int (__near __pascal *)(SP, long, long, char __far *))zone_action_new_sample)(SND_CURRENT, G_ZONE_START, G_ZONE_END, TBL_SOUND_NAMES);
		break;
	case 1:
		r = zone_action_insert_start(SND_CURRENT, G_ZONE_START, *(void __far **)&FP_SND_SECONDARY);
		break;
	case 2:
		r = zone_action_delete(SND_CURRENT, G_ZONE_START, G_ZONE_END);
		zone_range_clamp();
		break;
	case 3:
		r = ((int (__near __pascal *)(SP, long, long))zone_action_silence)(SND_CURRENT, G_ZONE_START, G_ZONE_END);
		break;
	case 4:
		r = ((int (__near __pascal *)(SP, long, long))zone_action_reverse)(SND_CURRENT, G_ZONE_START, G_ZONE_END);
		break;
	}
	if (!r) err_msg_report();
	voice_buffer_init((char __far *)SND_CURRENT);
	disp_list_run(P_3AE4);
	zone_edit_cancel();
}
