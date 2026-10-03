/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_TBL_01FEA[1];
extern char C2_TBL_01FEC[1];
extern int C2_W_SND_PARAMS_CURSOR;
void __far __fastcall __loadds snd_params_refresh(void);

void __far __fastcall __loadds snd_params_open(void)
{
	if (!(*(int *)(C2_TBL_01FEC + C2_W_SND_PARAMS_CURSOR * 42) | *(int *)(C2_TBL_01FEA + C2_W_SND_PARAMS_CURSOR * 42))) goto br_4BE0B;
	snd_params_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_01FEA + C2_W_SND_PARAMS_CURSOR * 42))();
br_4BE0B:
	;
}
