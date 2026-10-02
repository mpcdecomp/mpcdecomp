/* differs: 308 at +5, 108 bytes; 311 at +5, 106 bytes; 312 at +5, 106 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_EFDA;
extern int TBL_142F[];
extern long far far_b133a(long, int, char, int, int);

long far fn_c1805(int arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int di;
    int es;
    int si;
    long t1;

    ax = TBL_142F[arg_0];
    loc_6 = SEG_DATA;
    *(int *)((char *)&loc_8 + 0) = ax;
    ax2 = arg_2 * 15 + 3;
    di = ax2;
    loc_2 = SEG_DATA;
    loc_4 = 0x1703;
    si = 0;
    do {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_EFDA);
        bx = (int)loc_8;
        es = (int)(loc_8 >> 16);
        *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
        t1 = far_b133a(*(long *)((char *)&loc_4 + 0), di, *(char far *)MK_FP(es, bx), 5, ax3);
        ax2 = (int)t1;
        loc_4 = loc_4 + 30;
        si = si + 1;
    } while (si < 3);
    return (long)MK_FP((int)(t1 >> 16), ax2);
}
