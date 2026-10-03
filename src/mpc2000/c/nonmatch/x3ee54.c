/* differs: XL v1.20 +6, 10 bytes */
int __far far_3E8C8(void);

void __far L_3DF44(unsigned p0)
{
	int di_;

	di_ = far_3E8C8();
loop_3EE64:
	if ((unsigned)(far_3E8C8() - di_) < p0) goto loop_3EE64;
}
