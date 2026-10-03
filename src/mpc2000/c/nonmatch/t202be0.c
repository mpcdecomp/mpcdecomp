/* differs: 150 size 52, image 44; +0 image `push di` CL `push 0x800`; 172 size 52, image 44; +0 image `push di` CL `push 0x800` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern long __far __pascal flash_write_words(int, int, unsigned char far *, int);

void __far X_02C66(void)
{
	long t1;

	__stos2((unsigned char far *)BUF_XFER, 0, 0x800);
	__stos2((unsigned char far *)BUF_XFER, 0x7fff, 100);
	t1 = flash_write_words(1, 0x2280, (unsigned char far *)BUF_XFER, 0x400);
	return;
}
