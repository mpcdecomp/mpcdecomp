extern char C2_TBL_MIXER_FIELD_ENTER[1];
extern char C2_TBL_MIXER_FIELD_ENTER_SEG[1];
extern int C2_W_MIXER_CURSOR;
void __far __fastcall __loadds mixer_refresh(void);

void __far __fastcall __loadds mixer_open(void)
{
	if (!(*(int *)(C2_TBL_MIXER_FIELD_ENTER_SEG + C2_W_MIXER_CURSOR * 42) | *(int *)(C2_TBL_MIXER_FIELD_ENTER + C2_W_MIXER_CURSOR * 42))) goto br_52093;
	mixer_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_MIXER_FIELD_ENTER + C2_W_MIXER_CURSOR * 42))();
br_52093:
	;
}
