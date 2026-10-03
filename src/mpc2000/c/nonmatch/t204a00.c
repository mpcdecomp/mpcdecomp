/* differs: 150 size 152, image 110; +0 image `push bp` CL `enter 4, 0`; 172 size 152, image 110; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[69];
    char f_45;
};
struct s2 {
    char pad_0[1];
    char f_1;
};
extern char B_4FE1;
extern char B_4FE2;
extern char G_STATE_9D8B;
extern long __far channel_get_ptr(int);
extern long __far channel_validate(int);
extern void __far far_04B42(void);
extern void __far fx_redraw(void);

void __far __pascal voice_process_triple(char arg_0)
{
	int ax;
	int ax2;
	int ax3;
	int ax4;
	struct s1 far *t1;
	struct s2 far *t2;
	int t3;
	int t4;

	B_4FE2 = (char)(B_4FE2 & -3);
	B_4FE2 = (char)(B_4FE2 ^ 1);
	if ((B_4FE2 & 1) == 0) {
		goto L1;
	}
	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0);
	ax3 = ((char)(ax >> 8) << 8 | (unsigned char)~(char)ax);
	ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 & -2));
	goto L2;
L1:
	if (G_STATE_9D8B >= 2) {
		goto L3;
	}
	t1 = (struct s1 far *)channel_validate(G_STATE_9D8B);
	ax4 = ((char)(FP_OFF(t1) >> 8) << 8 | (unsigned char)t1->f_45);
	goto L2;
L3:
	t2 = (struct s2 far *)channel_get_ptr(G_STATE_9D8B);
	ax4 = ((char)(FP_OFF(t2) >> 8) << 8 | (unsigned char)t2->f_1);
L2:
	B_4FE1 = (char)ax4;
	if (G_STATE_9D8B >= 2) {
		goto L4;
	}
	fx_redraw();
	return;
L4:
	far_04B42();
	return;
}
