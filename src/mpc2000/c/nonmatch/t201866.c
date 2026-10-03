/* differs: 150 size 56, image 62; +9 image `je +26` CL `je +34`; 172 size 56, image 62; +9 image `je +26` CL `je +34` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char P_0610;

void __far __pascal asic_reg1_write(int arg_2, int arg_0)
{
	if (P_0610 == 0) {
		goto L1;
	}
	outpw(162, (1 << 8 | (unsigned char)(char)arg_2));
	outpw(160, ((char)(arg_2 >> 8) << 8 | (unsigned char)(char)(arg_2 >> 8)) & 3 | ((char)(arg_0 >> 8) << 8 | (unsigned char)((char)arg_0 & -4)));
L1:
	return;
}
