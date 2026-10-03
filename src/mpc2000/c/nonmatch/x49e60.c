/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_W_01712[1];
extern int C2_W_KEEP_OR_RETRY_CURSOR;
void __far ui_field_engine(char far *, char far *);
void __far voices_release_all(void);

void __far L_49E60(void)
{
	voices_release_all();
	C2_W_KEEP_OR_RETRY_CURSOR = 0;
	ui_field_engine(C2_W_01712, C0_W_0D7C2 + 0x12);
}
