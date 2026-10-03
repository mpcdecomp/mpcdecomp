/* differs: 150 size 16, image 90; +10 image `push ds` CL `nop` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far __pascal int43_wrapper(int);

void __far __fastcall __loadds L_0CE10(void)
{
	int ax;

	int43_wrapper(3);
	return;
}
