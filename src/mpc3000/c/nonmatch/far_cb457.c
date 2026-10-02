/* differs: 308 at +5, 369 bytes; 311 at +5, 365 bytes; 312 at +5, 365 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[28];
    char f_1c;
};
extern char TBL_818A[];
extern void far far_cb363(void far *);
extern void far far_cb3de(void far *);
extern long far far_d7805(int, void far *, int, int);
extern long far far_dac45(int);
void far far_cb363(void far *p0) { }
void far far_cb3de(void far *p0) { }

int far far_cb457(int arg_0)
{
    struct s1 far *loc_4;
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int dx;
    int es;
    int es2;
    int si;
    int si2;
    int si3;
    int si4;
    long t1;
    int t2;
    int t3;

    t1 = far_dac45(arg_0);
    *(int *)((char *)&loc_4 + 0) = (int)t1;
    ax = (int)t1 | (int)(t1 >> 16);
    if (ax != 0) {
        di = FP_OFF(loc_4);
        es = FP_SEG(loc_4);
        __movs2(MK_FP(es, di), MK_FP(SEG_DATA, 0x6a0b), 10);
        *(char far *)MK_FP(es, di + 10) = *(char *)(0x6a15);
        ax2 = (int)far_d7805(arg_0 + 1, MK_FP((int)(t1 >> 16), *(int *)((char *)&loc_4 + 0) + 8), 2, 48);
        bx = FP_OFF(loc_4);
        es2 = FP_SEG(loc_4);
        *(char far *)MK_FP(es2, bx + 17) = (char)34;
        *(char far *)MK_FP(es2, bx + 18) = (char)-120;
        *(char far *)MK_FP(es2, bx + 19) = (char)120;
        *(char far *)MK_FP(es2, bx + 20) = (char)12;
        *(char far *)MK_FP(es2, bx + 21) = (char)45;
        *(char far *)MK_FP(es2, bx + 22) = (char)0;
        *(char far *)MK_FP(es2, bx + 23) = (char)20;
        *(char far *)MK_FP(es2, bx + 24) = (char)-50;
        *(char far *)MK_FP(es2, bx + 25) = (char)50;
        *(char far *)MK_FP(es2, bx + 26) = (char)0;
        si = 0;
        di2 = *(int *)((char *)&loc_4 + 0);
        dx = 100;
        cx = *(int *)((char *)&loc_4 + 0) + 34;
        do {
            *(char far *)MK_FP((int)(t1 >> 16), di2 + 28) = (char)0;
            *(char far *)MK_FP((int)(t1 >> 16), di2 + 31) = (char)50;
            *(int far *)MK_FP((int)(t1 >> 16), cx) = dx;
            *(char far *)MK_FP((int)(t1 >> 16), di2 + 46) = (char)0;
            di2 = di2 + 1;
            dx = dx + 100;
            cx = cx + 2;
            si = si + 1;
        } while (dx != 0x190);
        loc_4->f_1c = (char)50;
        si2 = 0;
        di3 = *(int *)((char *)&loc_4 + 0) + 0x73e;
        do {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_818A[si2]);
            *(char far *)MK_FP((int)(t1 >> 16), di3) = (char)ax2;
            di3 = di3 + 1;
            si2 = si2 + 1;
        } while (si2 < 64);
        si3 = 0;
        di4 = *(int *)((char *)&loc_4 + 0) + 62;
        do {
            far_cb363(MK_FP((int)(t1 >> 16), di4));
            di4 = di4 + 24;
            si3 = si3 + 1;
        } while (si3 < 64);
        si4 = 0;
        di5 = *(int *)((char *)&loc_4 + 0) + 0x63e;
        do {
            far_cb3de(MK_FP((int)(t1 >> 16), di5));
            ax = UNDEF;
            di5 = di5 + 4;
            si4 = si4 + 1;
        } while (si4 < 64);
    }
    return ax;
}
