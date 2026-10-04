extern char B_87E6;
extern char P_0610;
#if FW_VERSION == 172
extern char B_9D8C;
extern char TBL_0C38[1];
extern char TBL_0C39[1];
#endif

void __far dma_018ee(void)
{
#if FW_VERSION == 172
	char i;
#endif

	if (!B_87E6) return;
	outpw(128, 0x600);
	outpw(132, -0x8000);
	outpw(128, 0);
	outpw(134, 0);
	outpw(128, 0x610);
	outpw(132, -0x8000);
	outpw(128, 16);
	outpw(134, 0);
	if (P_0610) {
#if FW_VERSION == 172
		if (!B_9D8C) {
#endif
		outpw(128, 0x700);
		outpw(130, -0x100);
		outpw(132, 0);
		outpw(128, 0x710);
		outpw(130, 255);
		outpw(132, 0);
#if FW_VERSION == 172
		} else {
			i = B_9D8C * 2 - 1;
			outpw(128, 0x700);
			outpw(130, 0);
			outpw(132, TBL_0C38[i] + 0x8000);
			outpw(128, 0x710);
			outpw(130, 0);
			outpw(132, TBL_0C39[i] + 0x8000);
		}
#endif
	} else {
		outpw(128, 0x700);
		outpw(140, 0);
		outpw(128, 0x710);
		outpw(140, 0);
	}
}
