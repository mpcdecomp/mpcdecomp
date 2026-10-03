/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char far *C2_FP_02128;
extern char C2_W_02096[1];
extern long C2_W_08D2E;
void __far handler_set_install(char far *);
int __far sound_list_contains(char far *);
void __far __fastcall __loadds sound_spec_open(void);

void __far far_4C0D8(long p0)
{
	C2_W_08D2E = p0;
	if (!sound_list_contains(C0_W_0D7C2)) {
		sound_spec_open();
		return;
	}
	handler_set_install(C2_W_02096);
	if (C0_W_0D7C2[13] & 1) goto br_4C11D;
	((int (__far *)(void))C2_FP_02128)();
br_4C11D:
	;
}
