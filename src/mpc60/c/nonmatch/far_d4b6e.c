/* differs: +66 mov word ptr W_9820_,0 | mov dx, 0 */
extern char B_94A6;
extern char B_94A7;
extern char B_981C;
extern char B_981D;
extern char B_9D32;
extern char B_A06C;
extern char TBL_5516[];
extern char TBL_7C26[];
extern char TBL_7C3A[];
extern char TBL_7DA2[];
extern int W_52BA;
extern int W_53A7;
extern long W_8BD5;
extern int W_94A8;
extern int W_94AA;
extern int W_94D4;
extern int W_981E;
extern int W_9820;
extern int W_984A;
extern long W_9B92;
extern long W_9B96;
extern long W_9B9E;
extern int W_9FA5;
long far_d6216();
long far_daa37();

far_d4b6e()
{
	if (W_9B92 == 0L) {
		far_c0338();
		W_9B96 = far_daa37(W_9B96);
		W_9B92 = far_daa37(W_9B92);
	}
	W_9B9E = W_9B96;
	poke(W_9B96, 255);
	W_9820 = 0;
	W_94AA = W_981E = 0;
	W_94A8 = W_981E;
	B_94A6 = B_981C = -1;
	B_94A7 = 0;
	B_981D = -128;
	W_94D4 = 1;
	W_984A = 3;
	B_9D32 = B_A06C = 0;
	setmem(TBL_5516, 0x2710, 0);
	setmem(TBL_7C26, 20, 0);
	setmem(TBL_7C3A, 20, 1);
	setmem(TBL_7DA2, 100, 0);
	far_ecec4();
	W_8BD5 = far_d6216();
	if (W_52BA != 0) {
		W_9FA5 = W_52BA;
		W_53A7 = 0x1000;
		far_d7a0d();
	}
	return;
}
