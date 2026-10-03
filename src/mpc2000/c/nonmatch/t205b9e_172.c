/* differs: 172 size 96, image 98 */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

void __far __pascal far_memop_str_2(int arg_2, long arg_0)
{
    long loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int dx;

    ax = *(int *)((char *)&arg_0 + 0);
    dx = arg_2;
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 12;
    *(int *)((char *)&loc_4 + 0) = ax;
    loc_2 = dx;
    __movs2(loc_4, MK_FP(SEG_DATA, 82), 12);
    ax2 = *(int *)((char *)&arg_0 + 0);
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 12;
    *(int *)((char *)&loc_8 + 0) = ax2;
    loc_6 = dx;
    __movs2(loc_8, MK_FP(SEG_DATA, 82), 12);
    ax3 = *(int *)((char *)&arg_0 + 0);
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 12;
    *(int *)((char *)&loc_c + 0) = ax3;
    loc_a = dx;
    __movs2(loc_c, MK_FP(SEG_DATA, 82), 12);
    __movs2(arg_0, MK_FP(SEG_DATA, 82), 12);
    return;
}
