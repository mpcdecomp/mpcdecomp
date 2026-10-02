/* differs: 308 at +3, 73 bytes; 311 at +3, 73 bytes; 312 at +3, 73 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_3C54[];
extern long far fn_babc8(long);
long far fn_babc8(long p0) { return 0; }

long far fn_babfb(long arg_0, int arg_2)
{
    int bx;
    int dx;
    int es;
    int si;

    dx = 0;
    si = *(int *)((char *)&arg_0 + 0);
    do {
        es = arg_2;
        *(char far *)MK_FP(es, si) = TBL_3C54[*(char far *)MK_FP(es, si)];
        si = si + 1;
        dx = dx + 1;
    } while (dx < 12);
    bx = (int)arg_0;
    *(char far *)MK_FP((int)(arg_0 >> 16), bx + 12) = (char)0;
    return fn_babc8(((long)arg_2 << 16 | (unsigned)bx));
}
