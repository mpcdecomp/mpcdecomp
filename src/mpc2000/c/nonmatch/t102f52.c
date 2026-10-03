/* differs: 150 size 84, image 86; +45 image `add si, si` CL `mov ax, word ptr [si + 0x788]`; 172 size 84, image 86; +45 image `add si, si` CL `mov ax, word ptr [si + 0x7fa]` */
extern char TBL_PITCH_RATIO[1];

void __near __pascal voice_pitch_ratio(char far *p3, int p2, int p1, int p0)
{
	int si_;

	si_ = p3[1] * p0 / 0x7f;
	si_ += p1;
	si_ += p2;
	if (p3[3]) goto br_02EFF;
	si_ += (p3[2] - 0x40) * 2;
br_02EFF:
	if (si_ <= 0xf0) goto br_02F08;
	si_ = 0xf0;
br_02F08:
	if (si_ >= -0xf0) goto br_02F11;
	si_ = -0xf0;
br_02F11:
	si_ += 2;
	*(int far *)(p3 + 14) = *(int *)(TBL_PITCH_RATIO + si_);
}
