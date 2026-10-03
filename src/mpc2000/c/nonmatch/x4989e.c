/* differs: XL v1.20 +1, 271 bytes */
extern char C2_B_REC_MODE;
extern char far *C2_FP_REC_SOUND;
extern unsigned C2_W_08B5E;
extern unsigned C2_W_095F4;
extern int C2_W_095F6;
void __far far_3E3B8(unsigned long, long, unsigned long);

void __far far_4989E(void)
{
	char far *l4;
	long l8;
	long l12;
	unsigned si_;
	unsigned di_;

	if (!(C2_W_095F6 | C2_W_095F4)) goto br_499C8;
	di_ = C2_W_08B5E;
	si_ = C2_W_095F4;
	l12 = *(long far *)(C2_FP_REC_SOUND + 14) / 2L;
	l8 = *(long far *)(C2_FP_REC_SOUND + 10);
	l4 = l8 + l12;
	if (C2_W_08B5E < C2_W_095F4) goto br_49946;
	far_3E3B8(l8, (unsigned long)di_ - (unsigned long)si_ + 0x10000L, (unsigned long)si_);
	if (C2_B_REC_MODE != 2) goto br_499C8;
	far_3E3B8(l4, (unsigned long)di_ - (unsigned long)si_ + 0x11140L, (unsigned long)si_);
	goto br_499C8;
br_49946:
	si_ -= di_;
	far_3E3B8(l8, 0x11140L - (unsigned long)si_, (unsigned long)si_);
	far_3E3B8((unsigned long)si_ + *(long far *)(C2_FP_REC_SOUND + 10), 0x10000L, (unsigned long)di_);
	if (C2_B_REC_MODE != 2) goto br_499C8;
	far_3E3B8(l4, 0x12280L - (unsigned long)si_, (unsigned long)si_);
	far_3E3B8((unsigned long)si_ + l4, 0x11140L, (unsigned long)di_);
br_499C8:
	;
}
