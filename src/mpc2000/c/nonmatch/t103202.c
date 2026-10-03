/* differs: 150 size 70, image 62; +0 image `push bp` CL `enter 4, 0`; 172 size 70, image 62; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

long __near __pascal mpc_status_wait(int arg_6, int arg_4, int arg_2, int arg_0)
{
	char far *t1;

	t1 = ((long)(((*(char far *)MK_FP(arg_6, arg_4 + 1) - 127) * arg_0 + 0x319c) / 100 * arg_2) << 16 | (unsigned)0) / 0xc671L;
	*(int far *)MK_FP(arg_6, arg_4 + 16) = (int)FP_OFF(t1);
	return t1;
}
