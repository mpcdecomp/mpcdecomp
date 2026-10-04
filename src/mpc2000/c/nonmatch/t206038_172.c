/* differs: 172 size 62, image 56; +3 image `push si` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int FP_2602;
extern int FP_2602_SEG;
extern long __far __pascal sample_validate_ptr(long);

long __far __pascal smem_addr_dma_read3(int arg_2, int arg_0)
{
	int dx;

	if (arg_0 != FP_2602) {
		goto L1;
	}
	if (arg_2 != FP_2602_SEG) {
		goto L1;
	}
	dx = *(int far *)MK_FP(arg_2, arg_0 + 46);
	FP_2602 = *(int far *)MK_FP(arg_2, arg_0 + 44);
	FP_2602_SEG = dx;
L1:
	return (long)MK_FP((int)(sample_validate_ptr(((long)arg_2 << 16 | (unsigned)arg_0)) >> 16), 1);
}
