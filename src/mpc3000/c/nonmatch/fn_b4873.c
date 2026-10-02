/* differs: 308 absent; 311 at +3, 45 bytes; 312 at +3, 45 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far far_e4d15(int, int, long);

long far fn_b4873(int arg_0, int arg_2, long arg_4, int arg_6)
{
    int ax;
    int dx;

    if (arg_2 != 0) {
        return far_e4d15(arg_0, -1, arg_4);
    }
    __movs2(arg_4, MK_FP(SEG_DATA, 0x1f54), 14);
    return;
}
