/* differs: 150 size 66, image 54; +0 image `push bp` CL `enter 2, 0`; 172 size 66, image 54; +0 image `push bp` CL `enter 2, 0` */
extern char VOICE_HOLD[1];
void __far __pascal voice_timer_expire(int);

void __far __pascal voice_timer_tick(int p0)
{
	int si_;
	int di_;
	unsigned ax_;

	di_ = 0;
	si_ = VOICE_HOLD;
loop_021BE:
	if (!*(int __near *)(char __near *)si_) goto L_021D9;
	if (*(int __near *)(char __near *)si_ == -1) goto L_021D9;
	ax_ = *(int __near *)(char __near *)si_ - p0;
	if (ax_ > 0) goto L_021D7;
	voice_timer_expire(di_);
	ax_ = 0;
L_021D7:
	*(int __near *)(char __near *)si_ = ax_;
L_021D9:
	si_ += 2;
	di_++;
	if (di_ < 0x80) goto loop_021BE;
}
