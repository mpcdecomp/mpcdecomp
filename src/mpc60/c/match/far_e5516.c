extern char B_5174;
extern char B_5175;

far_e5516()
{
	if (B_5174 == 0)
		return 1;
	if (B_5174 == 1 && B_5175 != 0)
		return 1;
	if (B_5174 == 2 && B_5175 == 0)
		return 1;
	return 0;
}
