/* differs: 150 size 18, image 42; +0 image `enter 4, 0` CL `push bp`; 172 size 18, image 42; +0 image `enter 4, 0` CL `push bp` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far _div(int, int);

void __far __pascal voice_ratio_calc(int arg_0)
{
	int loc_4;
	int loc_2;
	long t1;

	t1 = _div(arg_0, 100);
	loc_4 = (int)t1;
	loc_2 = (int)(t1 >> 16);
	return;
}
