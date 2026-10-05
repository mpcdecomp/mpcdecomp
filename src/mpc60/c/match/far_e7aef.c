extern unsigned char TBL_8E65[];

far_e7aef()
{
	int v2;

	far_cbe16();
	for (; ; ) {
		if ((v2 = far_cbe28(TBL_8E65, 0x640, 1)) == 0)
			break;
		if (TBL_8E65[0] != 255)
			far_f170e(TBL_8E65, v2);
	}
	far_cbdf5();
	return;
}
