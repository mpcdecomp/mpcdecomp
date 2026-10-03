/* differs: 150 size 206, image 124; +0 image `mov al, byte ptr [0x4c74]` CL `enter 4, 0`; 172 size 206, image 124; +0 image `mov al, byte ptr [0x4eb0]` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
extern char B_4EB0;
extern unsigned char P_45A4[1];
extern int __far far_01CA2(void);

void __near fn_01CB4(void)
{
	int ax;
	unsigned int ax2;
	int ax3;
	int ax4;
	int ax5;
	int ax6;
	struct s1 __near *bx;
	int dx;
	int t1;

	B_4EB0 = (char)(B_4EB0 + 1 & 3);
	t1 = far_01CA2();
	ax = ((char)t1 << 8 | (unsigned char)((char)t1 - *(char *)(0x0 + UNDEF)));
	if ((unsigned char)(char)ax >= 20) {
		goto L1;
	}
	return;
L1:
	*(char *)(0x0 + UNDEF) = (char)(ax >> 8);
	ax2 = (unsigned char)((char)ax * 2) * (unsigned char)*(char *)(0x1 + UNDEF) + *(int *)(0x4 + UNDEF);
	*(int *)(0x4 + UNDEF) = ax2;
	ax3 = ax2 << 1;
	if (!(ax2 >> 15 & 1)) {
		goto L2;
	}
	ax3 = (~(char)(ax3 >> 8) << 8 | (unsigned char)(char)ax3);
L2:
	ax4 = ((char)(ax3 >> 8) - -128 << 8 | (unsigned char)*(char *)(0x3 + UNDEF));
	ax5 = (char)ax4 * (char)(ax4 >> 8);
	ax6 = ((char)(ax5 >> 8) + *(char *)(0x2 + UNDEF) << 8 | (unsigned char)(char)ax5);
	if ((char)(ax6 >> 8) >= 0) {
		goto L3;
	}
	ax6 = 0;
L3:
	if ((unsigned char)(char)(ax6 >> 8) <= 56) {
		goto L4;
	}
	ax6 = 0x3800;
L4:
	bx = (struct s1 __near *)(P_45A4 + (unsigned char)(char)(ax6 >> 8) * 2);
	dx = (int)((unsigned long)(unsigned int)((char)ax6 << 8 | (unsigned char)0) * (unsigned long)(unsigned int)bx->f_2 >> 16) + (int)((unsigned long)(unsigned int)~((char)ax6 << 8 | (unsigned char)0) * (unsigned long)(unsigned int)bx->f_0 >> 16);
	outpw(162, (2 << 8 | (unsigned char)(B_4EB0 + 56)));
	outpw(160, dx);
	return;
}
