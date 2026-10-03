/* differs: XL v1.20 +0, 20 bytes */
extern int C0_W_03EDA;

int __near fn_3CA58(void)
{
	int si_;
	int di_;

	di_ = 0;
	si_ = 1;
loop_3CA5F:
	if (!(C0_W_03EDA & si_)) goto br_3CA66;
	di_++;
br_3CA66:
	si_ += 2;
	if (si_) goto loop_3CA5F;
	return di_;
}
