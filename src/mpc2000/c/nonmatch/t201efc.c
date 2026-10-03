/* differs: 150 size 114, image 106; +10 image `ja +63` CL `ja +6B`; 172 size 114, image 106; +10 image `ja +63` CL `ja +6B` */
extern char VOICE_TABLE[1];
extern char VOICE_TIMER[1];
void __far __pascal voice_release(unsigned);

void __far __pascal note_off_voices(int p0)
{
	unsigned l2;
	int si_;
	int di_;

	if ((unsigned)(p0 - 0x23) > 0x3f) goto br_01FE5;
	l2 = 0;
	si_ = VOICE_TABLE;
	di_ = VOICE_TIMER;
loop_01F9E:
	if (!*(int __near *)(char __near *)di_) goto br_01FD6;
	if (p0 != (unsigned char)((char __near *)si_)[0]) goto br_01FD6;
	if (((char __near *)si_)[1] != 2) goto br_01FD6;
	if (((char __near *)si_)[3] == (char)((unsigned char)((char __near *)si_)[0] >> 8)) goto br_01FCE;
	if (((char __near *)si_)[2] != (char)((unsigned char)((char __near *)si_)[0] >> 8)) goto br_01FCE;
	if (*(int __near *)((char __near *)di_ + -64) != -1) goto br_01FD6;
	*(int __near *)(char __near *)di_ = *(int __near *)((char __near *)si_ + 8);
	*(int __near *)((char __near *)di_ + -64) = 1;
	goto br_01FD6;
br_01FCE:
	voice_release(l2);
br_01FD6:
	si_ += 0x12;
	di_ += 2;
	l2++;
	if (l2 < 0x20) goto loop_01F9E;
br_01FE5:
	;
}
