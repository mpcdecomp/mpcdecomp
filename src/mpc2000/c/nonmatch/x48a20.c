/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern long C0_W_0D7C2;
extern long C2_FP_REC_SOUND;
extern int C2_W_REC_SOUND_SEG;
void __far disp_request_flush(void);
void __far far_4982C(void);
void __far far_49C2C(void);
void __far __fastcall __loadds sample_record_refresh(void);

void __far far_48A20(void)
{
	far_4982C();
	C0_W_0D7C2 = C2_FP_REC_SOUND;
	C2_FP_REC_SOUND = 0L;
	sample_record_refresh();
	far_49C2C();
	disp_request_flush();
}
