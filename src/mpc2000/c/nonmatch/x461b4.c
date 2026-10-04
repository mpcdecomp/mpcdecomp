/* differs: XL v1.20 +4, 145 bytes */
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_B_PAD_DRUM;
extern char C2_B_PAD_NOTE;
void __far far_3E99C(void);
int __far far_3FF18(long, long);
void __far __fastcall __loadds far_46178(void);
void __far far_46340(void);
char far * __far ivt_get_vector(int);

void __far __fastcall __loadds load_sound_keep(void)
{
	int dx_;
	char far *v0;

	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	far_46178();
	if (C2_B_PAD_NOTE < 0x23) goto br_461F0;
	if (C2_B_PAD_NOTE > 0x62) goto br_461F0;
	dx_ = 1;
	goto br_461F2;
br_461F0:
	dx_ = 0;
br_461F2:
	if (!dx_) goto br_46215;
	*(long far *)((char far *)MK_FP(FP_SEG(v0), C2_B_PAD_NOTE * 4 + *(int *)&v0) + 1874) = C0_W_0D7C2;
br_46215:
	switch (far_3FF18(0L, C0_W_0D7C2)) { case 0: goto br_46236; }
	far_46340();
	return;
br_46236:
	far_3E99C();
}
