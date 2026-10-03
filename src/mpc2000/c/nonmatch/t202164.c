/* differs: 150 size 60, image 42; +0 image `push bp` CL `enter 4, 0`; 172 size 60, image 42; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int W_0C44;
extern void __far L_01CA7(void);
extern int __far __pascal voice_timer_tick(int);

void __far sample_error_handler(int arg_0)
{
	unsigned int ax;
	int ax2;
	int ax3;
	int t1;

	ax = arg_0 - W_0C44;
	ax2 = ax / 10;
	if (ax2 == 0) {
		goto L1;
	}
	W_0C44 = arg_0 - ax % 10;
	ax3 = voice_timer_tick(ax2);
L1:
	L_01CA7();
	return;
}
