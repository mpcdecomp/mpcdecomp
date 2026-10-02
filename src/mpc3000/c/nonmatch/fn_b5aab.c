/* differs: 308 absent; 311 match; 312 match */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern int far far_b1ad0(int, int);
extern long far far_b1d48(void far *, int);

long far fn_b5aab(int arg_0)
{
    int ax;

    far_b1ad0(1, 29);
    return far_b1d48(MK_FP(SEG_DATA, 0x258a), arg_0);
}
