/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
#include "mpc2kxl.h"

extern char EP_SAMPLE_ERROR_HANDLER_OFF[1];
extern char EP_SAMPLE_ERROR_HANDLER_SEG[1];

void __far __fastcall __loadds sample_record_refresh(void)
{
	far_493D2();
	far_4EE54(0x32);
	((void (__far *)(void))far_49218)();
	((void (__far *)(void))far_491A8)();
	if (!(*(long *)&C2_FP_REC_SOUND)) goto br_48B16;
	((void (__far *)(long))sound_list_unlink)((*(long *)&C2_FP_REC_SOUND));
br_48B16:
	C2_B_06474 = 1;
	((void (__far *)(void))far_5545E)();
	((void (__far *)(char __near *, char __near *))event_cb_set_main)(EP_SAMPLE_ERROR_HANDLER_OFF, EP_SAMPLE_ERROR_HANDLER_SEG);
}
