/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char EP_L_3D724_OFF[1];
extern char EP_L_3D724_SEG[1];
void __far far_4C0D8(char __near *, char __near *);

void __far L_55C24(void)
{
	far_4C0D8(EP_L_3D724_OFF, EP_L_3D724_SEG);
}
