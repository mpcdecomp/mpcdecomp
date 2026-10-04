extern int C1_W_0D7D0;
extern int C2_W_08B52;
extern int C2_W_08B54;

int __far far_49816(void)
{
	if (C2_W_08B52 >= C1_W_0D7D0) goto br_49828;
	if (C2_W_08B54 < C1_W_0D7D0) {
		return 0;
	}
br_49828:
	return 1;
}
