/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
#include "mpc2kxl.h"

extern char C2_B_098BC;
extern char EP_L_48860_OFF[1];
extern char EP_L_48860_SEG[1];

void __far L_487FC(void)
{
	if (!C2_B_098BC) goto br_4882E;
	switch (far_493E4()) { case 0: goto br_4882E; }
	event_cb_set_main(0, 0);
	event_cb_set_main(EP_L_48860_OFF, EP_L_48860_SEG);
	C2_W_REC_STATE = 1;
	return;
br_4882E:
	if (!C2_B_REC_CANCEL_REQ) goto br_4885F;
	event_cb_set_main(0, 0);
	far_493D2();
	far_4EE54(0x32);
	far_49218();
	far_491A8();
	far_487C2();
br_4885F:
	;
}
