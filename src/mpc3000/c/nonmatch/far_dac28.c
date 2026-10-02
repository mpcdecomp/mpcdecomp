/* differs: 308 at +3, 22 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_dac28(unsigned int arg_0)
{
    *(int far *)MK_FP(0x9d15 /* SEG_9751 */, (unsigned int)(unsigned)((char *)0x0)) = arg_0;
    *(int far *)MK_FP(0x9d15 /* SEG_9751 */, (unsigned int)(unsigned)((char *)0x2)) = (unsigned int)-0x4c30 / arg_0;
    return;
}
