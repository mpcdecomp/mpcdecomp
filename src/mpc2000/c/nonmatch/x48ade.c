/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_06474;
extern long C2_FP_REC_SOUND;
extern int C2_W_REC_SOUND_SEG;
extern char EP_L_41188_OFF[1];
extern char EP_L_41188_SEG[1];
void __far event_cb_set_main(char __near *, char __near *);
void __far far_491A8(void);
void __far far_49218(void);
void __far far_493D2(void);
void __far far_4EE54(int);
void __far far_5545E(void);
void __far sound_list_unlink(long);

void __far __fastcall __loadds sample_record_refresh(void)
{
	far_493D2();
	far_4EE54(0x32);
	far_49218();
	far_491A8();
	if (!C2_FP_REC_SOUND) goto br_48B16;
	sound_list_unlink(C2_FP_REC_SOUND);
br_48B16:
	C2_B_06474 = 1;
	far_5545E();
	event_cb_set_main(EP_L_41188_OFF, EP_L_41188_SEG);
}
