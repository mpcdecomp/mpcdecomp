/* differs: 308 absent; 311 at +5, 162 bytes; 312 at +5, 162 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_7AC3;
extern long far fn_bab60(long);
extern long far fn_bb003(char far *, long);
extern long far fn_bb06a(long);
extern long far fn_bb0c5(long, int, char far *, int, int);
long far fn_bab60(long p0) { return 0; }
long far fn_bb003(char far *p0, long p1) { return 0; }
long far fn_bb06a(long p0) { return 0; }
long far fn_bb0c5(long p0, int p1, char far *p2, int p3, int p4) { return 0; }

int far fn_bb829(long arg_0, int arg_2, int arg_4, int arg_6)
{
    char loc_16[14];
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int dx;
    int es;
    long t1;
    long t2;
    long t3;

    es = (int)(arg_0 >> 16);
    bx = (int)arg_0 + (arg_6 << 2);
    ax = *(int far *)MK_FP(es, bx + 2);
    dx = *(int far *)MK_FP(es, bx);
    loc_2 = ax;
    loc_4 = dx;
    t1 = fn_bab60(((long)ax << 16 | (unsigned)dx));
    loc_6 = (int)(t1 >> 16);
    loc_8 = (int)t1;
    if ((int)fn_bb06a(*(long *)((char *)&loc_4 + 0)) == 0) {
        return -1;
    }
    t2 = fn_bb003((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), *(long *)((char *)&loc_4 + 0));
    t3 = fn_bb0c5(arg_0, arg_4, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), loc_8, loc_6);
    if ((int)t3 >= 0) {
        return (int)t3;
    }
    if (B_7AC3 != 0) {
        ax2 = -1;
    } else {
        ax2 = -2;
    }
    return ax2;
}
