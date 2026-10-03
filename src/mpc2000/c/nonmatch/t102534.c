/* differs: 150 size 146, image 142; +1 image `enter 2, 0` CL `enter 4, 0`; 172 size 146, image 142; +1 image `enter 2, 0` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int SMEM_POOL_FREE;
extern int SMEM_POOL_NEXT[1];
extern int SMEM_POOL_USED;

int __near __pascal smem_pool_remove(int arg_0)
{
	int __near *loc_2;
	int ax;
	int bx;
	int __near *si;

	if (SMEM_POOL_USED != arg_0) {
		goto L1;
	}
	loc_2 = (int __near *)((char __near *)SMEM_POOL_NEXT + ((arg_0 << 2) + arg_0) * 2);
	SMEM_POOL_USED = *loc_2;
	goto L2;
L1:
	bx = SMEM_POOL_USED;
	ax = SMEM_POOL_USED;
	if (SMEM_POOL_NEXT[(SMEM_POOL_USED << 2) + ax] == arg_0) {
		goto L3;
	}
L4:
	if (bx >= 130) {
		goto L5;
	}
	bx = SMEM_POOL_NEXT[(bx << 2) + bx];
	if (SMEM_POOL_NEXT[(bx << 2) + bx] != arg_0) {
		goto L4;
	}
L3:
	si = (int __near *)((char __near *)SMEM_POOL_NEXT + ((arg_0 << 2) + arg_0) * 2);
	loc_2 = si;
	SMEM_POOL_NEXT[(bx << 2) + bx] = *si;
L2:
	ax = SMEM_POOL_FREE;
	*loc_2 = ax;
	SMEM_POOL_FREE = arg_0;
L5:
	return ax;
}
