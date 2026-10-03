/* differs: 150 size 92, image 90; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 92, image 90; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_STATE_9D8B;
extern long __far channel_get_ptr(int);
extern long __far channel_validate(int);
extern void __far __pascal smem_dma_channel_01(char);
extern void __far __pascal smem_dma_channel_23(char);

void __far __pascal voice_process_setup(char arg_0)
{
	int ax;
	int dx;
	long t1;
	long t2;
	int t3;
	int t4;

	if (G_STATE_9D8B >= 2) {
		goto L1;
	}
	t1 = channel_validate(G_STATE_9D8B);
	dx = (int)(t1 >> 16);
	ax = (int)t1 + 69;
	goto L2;
L1:
	t2 = channel_get_ptr(G_STATE_9D8B);
	dx = (int)(t2 >> 16);
	ax = (int)t2 + 1;
L2:
	*(char far *)MK_FP(dx, ax) = (char)(*(char far *)MK_FP(dx, ax) ^ arg_0);
	if (G_STATE_9D8B < 2) {
		goto L3;
	}
	smem_dma_channel_23(G_STATE_9D8B);
	return;
L3:
	smem_dma_channel_01(G_STATE_9D8B);
	return;
}
