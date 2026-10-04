/* differs: 172 matches */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ERRNO;
extern int __far _longjmp(void far *, int);
extern int __far __pascal bcd_display_calc(int, int, int);

void __near __pascal int2F_fn14_setup(int arg_4, int arg_2, int arg_0)
{
	long t1;

	if (bcd_display_calc(arg_4, arg_2, arg_0) != 0) {
		goto L1;
	}
	t1 = _longjmp(MK_FP(SEG_DATA, -0x709e), G_ERRNO);
L1:
	return;
}
