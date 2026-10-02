/* differs: 308 at +5, 157 bytes; 311 at +59, 156 bytes; 312 at +59, 157 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_955B;
extern char B_955C;
extern char B_F2A4;
extern char B_F2AB;
extern char B_F2AC;
extern char TBL_F294[];
extern int W_F2A9;
extern long far far_b6beb(long, char far *);
extern long far far_caade(long);
extern long far far_cad00(int);
extern long far far_deeab(void);
extern long far far_e0031(unsigned char far *);
extern long far far_e1e11(int);
extern void far far_e392e(int);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e546f(int, char far *);
extern int far fn_d8549(int, int, char far *);

int far far_d8444(int arg_0, int arg_2, int arg_4)
{
    char loc_46[70];
    int ax;
    int ax2;
    int si;
    int si2;
    long t1;
    long t2;
    long t3;
    long t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    *(int *)((char *)&loc_46 + 64) = 0;
    ax = (int)far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)TBL_F294);
    si = 0;
    do {
        if (TBL_F294[si] == 46 || *(int *)((char *)&loc_46 + 64) == 1) {
            TBL_F294[si] = (char)32;
            *(int *)((char *)&loc_46 + 64) = 1;
        }
        si = si + 1;
    } while (si < 16);
    B_F2A4 = (char)0;
    if (B_F2AC == 3 && B_F2AB >= 3) {
        si2 = W_F2A9;
        goto L1;
    }
    t1 = far_cad00(0);
    ax2 = (int)far_caade(*(long *)((char *)&arg_0 + 0));
    si2 = ax2;
    if (ax2 < 0) {
        return ax2;
    }
L1:
    *(int *)((char *)&loc_46 + 66) = B_8A9F;
    t2 = far_e0031((unsigned char far *)B_901B);
    t3 = far_e0031((unsigned char far *)B_8C41);
    t4 = far_e1e11(arg_4);
    t5 = fn_d8549(arg_4, si2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46));
    *(int *)((char *)&loc_46 + 68) = t5;
    if (t5 != 0) {
        arg_4 = *(int *)((char *)&loc_46 + 66);
    }
    far_e392e(arg_4);
    if (B_F2AB <= 2) {
        t7 = far_e546f(arg_4, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46));
    }
    t8 = far_e51be((unsigned char far *)B_901B, arg_4, 1);
    t9 = far_deeab();
    B_955B = (char)(B_955B | 64);
    B_955C = (char)(B_955C | -128);
    B_F2AC = (char)0;
    return *(int *)((char *)&loc_46 + 68);
}
int far fn_d8549(int p0, int p1, char far *p2) { return 0; }
