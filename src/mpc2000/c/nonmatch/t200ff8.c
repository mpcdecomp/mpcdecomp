/* differs: 150 size 6, image 30; +0 image `push bp` CL `lcall 0, 0`; 172 size 6, image 4; +0 image `push bp` CL `lcall 0, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far sub_004C2(void);

long __far __pascal smem_dma_copy(void)
{
	return sub_004C2();
}
