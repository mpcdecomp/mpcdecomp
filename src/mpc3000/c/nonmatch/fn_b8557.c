/* differs: 308 at +4B, 6 bytes; 311 at +17, 10 bytes; 312 at +17, 10 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_92B8 {
    char f_0;
};
struct g_TBL_92B7 {
    char f_0;
};
extern struct g_TBL_92B7 TBL_92B7;
extern struct g_TBL_92B8 TBL_92B8;
extern unsigned char TBL_92B9[];
extern int far far_b1ad0(int, int);
extern int far far_b1d48(void far *, int, int);

long far fn_b8557(unsigned int arg_0)
{
    int ax;
    int di;
    int near *si;
    int t1;

    di = 0;
    si = (int near *)TBL_92B9;
    for (;;) {
        if ((unsigned int)*si <= arg_0) {
            si = si + 2;
            di = di + 1;
            if ((unsigned int)(unsigned)si == -0x7832) {
                break;
            }
            continue;
        }
        break;
    }
    t1 = far_b1ad0(2, 5);
    far_b1d48(MK_FP(SEG_DATA, 0x2bfc), *(char *)((char *)&TBL_92B7 + 0 + (di << 2)), *(char *)((char *)&TBL_92B8 + 0 + (di << 2)));
    return ((long)UNDEF << 16 | (unsigned)di);
}
