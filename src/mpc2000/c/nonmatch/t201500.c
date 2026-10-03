/* differs: 150 size 86, image 90; +4 image `push si` CL `push di`; 172 size 86, image 90; +4 image `push si` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __far __pascal io_delay_wait2();
extern void __far __pascal mem_op_handler();
extern void __far __pascal mem_op_wrapper_4();
extern void __far __pascal mem_op_wrapper_5();

void __far __pascal system_call_handler(int arg_8, int arg_6, int arg_4, int arg_2, int arg_0)
{
    int loc_4;
    char loc_2[2];
    int si;
    int t1;
    int t2;
    int t3;
    int t4;

L1:
    mem_op_handler(arg_8, arg_6, loc_2);
    loc_4 = *(int far *)MK_FP(SEG_STACK, UNDEF);
    if ((*(char *)((char *)&loc_4 + 0) & 2) == 0) {
        goto L1;
    }
    if ((*(char *)((char *)&loc_4 + 0) & 4) == 0) {
        goto L1;
    }
    si = arg_0;
    mem_op_wrapper_4(arg_8, arg_6, arg_4, arg_2, si);
    mem_op_wrapper_5(arg_8, arg_6, si);
    io_delay_wait2(arg_8, arg_6);
    return;
}
