/* differs: 150 size 130, image 94; +0 image `push si` CL `enter 6, 0`; 172 size 130, image 94; +0 image `push si` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int FP_LOADED_SND;
extern int FP_LOADED_SND_SEG;
extern unsigned char G_PAD_NOTE_BASE;
extern long PGM_CURRENT;
extern int W_509C;
extern int W_509E;
extern void __near X_08D48(void);
extern int __far __pascal int43_wrapper(int);
extern long __far __pascal sample_data_load_2(int, int);

void __near fn_08C4C(void)
{
	int ax;
	int bx;
	int dx;
	int es;
	int si;
	char far *t1;
	int t2;

	t1 = sample_data_load_2(FP_LOADED_SND_SEG, FP_LOADED_SND);
	W_509C = (int)FP_OFF(t1);
	W_509E = (int)FP_SEG(t1);
	if (((int)FP_SEG(t1) | W_509C) == 0) {
		goto L1;
	}
	X_08D48();
	return;
L1:
	if (G_PAD_NOTE_BASE - 35 > 63) {
		goto L2;
	}
	dx = FP_LOADED_SND_SEG;
	si = G_PAD_NOTE_BASE * 29;
	bx = (int)PGM_CURRENT;
	es = (int)(PGM_CURRENT >> 16);
	*(int far *)MK_FP(es, bx - 0x3d9 + si) = FP_LOADED_SND;
	*(int far *)MK_FP(es, bx - 0x3d7 + si) = dx;
L2:
	FP_LOADED_SND_SEG = 0;
	FP_LOADED_SND = 0;
	int43_wrapper(5);
	return;
}
