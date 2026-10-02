/* differs: 308 at +5, 161 bytes; 311 at +5, 160 bytes; 312 at +5, 160 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_EFDA;
extern long far far_b133a(long, int, char, int, int);
extern long far fn_c1e8f(char);

int far fn_c18fc(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    int loc_c;
    int ax2;
    int bx;
    int di;
    int es;
    int si;
    long t1;

    loc_4 = arg_4;
    loc_2 = 0;
    di = arg_6;
    goto L1;
L2:
    loc_a = arg_2;
    loc_c = arg_0;
    t1 = fn_c1e8f(*(char far *)MK_FP(arg_8, di));
    arg_4 = (int)t1;
    loc_6 = (int)(t1 >> 16);
    *(int *)((char *)&loc_8 + 0) = arg_4;
    si = 0;
L3:
    ax2 = ((char)(arg_4 >> 8) << 8 | (unsigned char)B_EFDA);
    bx = (int)loc_8;
    es = (int)(loc_8 >> 16);
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
    arg_4 = (int)far_b133a(*(long *)((char *)&loc_c + 0), loc_4, *(char far *)MK_FP(es, bx), 5, ax2);
    loc_c = loc_c + 30;
    si = si + 1;
    if (si < 9) {
        goto L3;
    }
    loc_4 = loc_4 + 6;
    di = di + 1;
    loc_2 = loc_2 + 1;
L1:
    if (*(char far *)MK_FP(arg_8, di) != 0) {
        goto L2;
    }
    return arg_4;
}
long far fn_c1e8f(char p0) { return 0; }
