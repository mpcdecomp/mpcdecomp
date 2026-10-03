/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_098B8[1];
extern char C2_B_0D7CC;
extern char C2_W_01438[1];
extern int C2_W_SAMPLE_REC_CURSOR;
void __far ui_field_engine(char far *, char far *);

void __far sample_record_focus_field0(void)
{
	C2_W_SAMPLE_REC_CURSOR = 0;
	C0_B_098B8[0] = C2_B_0D7CC;
	ui_field_engine(C2_W_01438, C0_B_098B8);
}
