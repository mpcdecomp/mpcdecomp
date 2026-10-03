/* differs: 150 size 60, image 58; +4 image `push si` CL `push di`; 172 size 60, image 58; +4 image `push si` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __far flash_vpp_on(void);
extern void __far __pascal mem_op_wrapper_3(int, int, char __near *);

void __far __pascal mem_op_handler(int arg_4, int arg_2, int arg_0)
{
	int loc_4;
	char loc_2[2];
	int si;
	int t1;
	int t2;

L1:
	mem_op_wrapper_3(arg_4, arg_2, loc_2);
	loc_4 = *(int far *)MK_FP(SEG_STACK, UNDEF);
	if ((*(char *)((char *)&loc_4 + 0) & 8) != 0) {
		goto L1;
	}
	si = arg_0;
	flash_vpp_on();
	*(int far *)MK_FP(SEG_STACK, si) = loc_4;
	return;
}
