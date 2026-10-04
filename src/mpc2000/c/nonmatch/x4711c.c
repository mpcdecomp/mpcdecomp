/* differs: XL v1.20 +4, 36 bytes */
extern char C2_B_CONV_MPC60_PAD;
char far * __far int4D_sample_wrapper(void);

void __far far_467C6(char p0)
{
	char far *v0;

	v0 = int4D_sample_wrapper();
	*(char far *)MK_FP(FP_SEG(v0), C2_B_CONV_MPC60_PAD + *(int *)&v0) = p0;
}
