/* differs: 308 match; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern int far far_b1f96(int);
extern long far far_b3819(void far *, int, int, int, int, int, int);

void far fn_c916e(int arg_0, int arg_2)
{
    int ax;
    long t1;

    far_b1f96(33);
    t1 = far_b3819(MK_FP(SEG_DATA, 0x5e4d), arg_0, arg_2, 3, 0, 127, 8);
    return;
}
