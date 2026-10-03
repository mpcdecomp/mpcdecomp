/* differs: XL v1.20 +4, 113 bytes */
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
void __far __fastcall __loadds far_48782(void);
void __far __fastcall __loadds far_49D2A(void);
char far * __far ivt_get_vector(int);

void __far __fastcall __loadds keep_or_retry_f5(void)
{
	int dx_;
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	far_49D2A();
	if (C2_B_PAD_NOTE < 0x23) goto br_49CE2;
	if (C2_B_PAD_NOTE > 0x62) goto br_49CE2;
	dx_ = 1;
	goto br_49CE4;
br_49CE2:
	dx_ = 0;
br_49CE4:
	if (!dx_) goto br_49D07;
	*(long far *)((char far *)MK_FP(FP_SEG(v0), C2_B_PAD_NOTE * 4 + *(int *)&v0) + 1874) = C0_W_0D7C2;
br_49D07:
	far_48782();
}
