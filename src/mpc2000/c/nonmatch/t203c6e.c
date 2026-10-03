/* differs: 150 matches; 172 size 72, image 92; +3 image `push di` CL `push si` */
extern char B_980A_V150;
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;

void __far __pascal mpc_port_C1_5E(char far *p0)
{
	int si_;

	if (!p0) goto L_03D4F;
	if (!B_980A_V150) {
		((int (__far __pascal *)(int))p0)((G_PAD_BANK << 4) + G_PAD_INDEX);
		return;
	}
	si_ = 0;
L_1179C:
	((int (__far __pascal *)(int))p0)((G_PAD_BANK << 4) + si_);
	si_++;
	if (si_ < 0x10) goto L_1179C;
L_03D4F:
	;
}
