/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_06474;
extern long C2_FP_REC_SOUND;
extern long C2_W_REC_STATE;
void __far asic_reg1_bank_clear(void);
void __far event_cb_set_main(int, int);
void __far far_489C6(void);
void __far far_5545E(void);
void __far smem_compact(void);
void __far voices_release_all(void);

void __far __fastcall __loadds far_48782(void)
{
	voices_release_all();
	event_cb_set_main(0, 0);
	C2_B_06474 = 0;
	far_5545E();
	asic_reg1_bank_clear();
	smem_compact();
	C2_FP_REC_SOUND = 0L;
	C2_W_REC_STATE = 0L;
	far_489C6();
}
