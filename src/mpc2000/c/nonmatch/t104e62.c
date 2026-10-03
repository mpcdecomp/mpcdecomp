/* differs: 150 size 142, image 118; +0 image `push si` CL `enter 8, 0`; 172 size 142, image 118; +0 image `push si` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char FX_MIXER_CURSOR;
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern long __far channel_get_ptr(int);
extern void __far far_04B42();
extern long __far __pascal field_register_s8(int, int, int, int, int, int, int, int, int, void far *);
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, void far *);

long __near fx_mixer_arm_field(void)
{
	int ax;
	int dx;
	long t1;
	long t2;
	long t3;

	if (G_FLAG_1589 != 0) {
		goto L1;
	}
	G_FLAG_1589 = (char)(G_FLAG_1589 + 1);
	t1 = channel_get_ptr(G_STATE_9D8B);
	if (FX_MIXER_CURSOR == 0) {
		goto L2;
	}
	if (FX_MIXER_CURSOR == 1) {
		goto L3;
	}
	FX_MIXER_CURSOR = (unsigned char)0;
	goto L2;
L3:
	t2 = field_register_s8((int)(t1 >> 16), (int)t1 + 11, -50, 50, 2, 187, 31, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	ax = (int)t2;
	dx = (int)(t2 >> 16);
	goto L4;
L2:
	t3 = status_read_6A_3((int)(t1 >> 16), (int)t1 + 10, 0, 99, 2, 169, 31, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	ax = (int)t3;
	dx = (int)(t3 >> 16);
L4:
	G_FLAG_1589 = (char)(G_FLAG_1589 - 1);
L1:
	return ((long)dx << 16 | (unsigned)ax);
}
