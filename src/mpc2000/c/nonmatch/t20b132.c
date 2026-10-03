/* differs: 150 size 66, image 42; +0 image `push bp` CL `enter 2, 0`; 172 size 66, image 42; +0 image `push bp` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far __pascal midi_out_io3(int);

long __far __pascal midi_io_chain(int arg_2, int arg_0)
{
	int dx;
	long t1;

	if (arg_0 != 0) {
		return midi_out_io3(arg_2 * 2);
	}
	t1 = (long)(int)arg_2 * (long)(int)arg_2;
	dx = -((int)t1 + 1 < 0);
	return ((long)dx << 16 | (unsigned)((int)t1 + 1 - dx >> 1));
}
