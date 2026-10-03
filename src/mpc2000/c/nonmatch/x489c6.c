/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_TBL_01446[1];
extern char C2_W_012EA[1];
extern int C2_W_SAMPLE_REC_CURSOR;
void __far far_487C2(void);
void __far far_48F64(void);
void __far far_48FBA(void);
void __far far_496B0(void);
void __far handler_set_install(char far *);

void __far far_489C6(void)
{
	far_48F64();
	far_48FBA();
	handler_set_install(C2_W_012EA);
	if (C2_W_SAMPLE_REC_CURSOR < 0) goto L_4808C;
	if ((unsigned)C2_W_SAMPLE_REC_CURSOR < 6) goto br_489F0;
L_4808C:
	C2_W_SAMPLE_REC_CURSOR = 0;
br_489F0:
	((int (__far *)(void))*(long *)(C2_TBL_01446 + C2_W_SAMPLE_REC_CURSOR * 42))();
	far_487C2();
	far_496B0();
}
