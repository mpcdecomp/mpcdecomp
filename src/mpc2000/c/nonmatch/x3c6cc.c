/* differs: XL v1.20 +D, 10 bytes */
extern char C0_B_0D7C1;
extern int C0_W_03EDA;

void __near fn_3C6CC(char far *p0)
{
	int l2;
	int si_;
	int di_;

	if (!p0) goto br_3C6FF;
	l2 = C0_B_0D7C1 & 0xf0;
	si_ = 1;
	di_ = 0;
loop_3C6E8:
	if (!(C0_W_03EDA & si_)) goto br_3C6FA;
	((int (__far *)(int))p0)(l2 + di_);
br_3C6FA:
	di_++;
	si_ += 2;
	if (si_) goto loop_3C6E8;
br_3C6FF:
	;
}
