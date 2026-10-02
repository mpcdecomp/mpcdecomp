/* differs: 308 at +3, 12 bytes; 311 at +3, 12 bytes; 312 at +3, 12 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_dac12(int arg_0, int arg_2)
{
    return *(long far *)MK_FP(arg_2, arg_0);
}
