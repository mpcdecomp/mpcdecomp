extern char C2_TBL_SDUMP_FIELD_ENTER[1];
extern char C2_W_065DC[1];
extern int C2_W_SAMPLE_DUMP_CURSOR;
void __far __fastcall __loadds sample_dump_refresh(void);

void __far __fastcall __loadds sample_dump_open(void)
{
	if (!(*(int *)(C2_W_065DC + C2_W_SAMPLE_DUMP_CURSOR * 42) | *(int *)(C2_TBL_SDUMP_FIELD_ENTER + C2_W_SAMPLE_DUMP_CURSOR * 42))) goto br_559E1;
	sample_dump_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_SDUMP_FIELD_ENTER + C2_W_SAMPLE_DUMP_CURSOR * 42))();
br_559E1:
	;
}
