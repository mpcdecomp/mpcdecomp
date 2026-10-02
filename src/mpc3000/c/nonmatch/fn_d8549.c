/* differs: 308 at +5, 49 bytes; 311 at +5, 51 bytes; 312 at +5, 51 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_F2AB;
extern char B_F2AC;
extern char far *W_8C35;
extern int far far_cad6d(char far *, int, int);
extern long far far_d85fa(int, int, int, char far *, char far *, long);
extern long far far_e259f(char);

int far fn_d8549(int arg_0, int arg_2, int arg_4, int arg_6)
{
    char loc_4[4];
    char loc_6[2];
    char loc_8[2];
    int ax;
    int ax2;
    long t1;

    if ((int)far_e259f(*(char *)((char *)&arg_0 + 0)) == 0) {
        return -2;
    }
    if (B_F2AC == 3 && B_F2AB >= 3) {
        loc_8[0] = B_F2AC;
        loc_8[1] = B_F2AB;
        goto L1;
    }
    ax2 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), arg_2, 2);
    if (ax2 != 0) {
        return ax2;
    }
L1:
    if (loc_8[0] != 3) {
        return -33;
    }
    B_F2AB = loc_8[1];
    if (loc_8[1] >= 1 && loc_8[1] <= 3) {
        t1 = far_d85fa(arg_2, B_F2AB, 1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), *(long *)((char *)&arg_4 + 0));
        if ((int)t1 != 0) {
            return (int)t1;
        }
        *(char far *)((char far *)*(long *)((char *)&W_8C35 + 0)) = *(char *)((char *)&arg_0 + 0);
        return 0;
    }
    return -32;
}
long far far_d85fa(int p0, int p1, int p2, char far *p3, char far *p4, long p5) { return 0; }
