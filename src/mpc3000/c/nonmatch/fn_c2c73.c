/* differs: 308 at +5, 566 bytes; 311 at +5, 566 bytes; 312 at +5, 565 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, void far *, void far *, int);
extern long far far_b3819(void far *, int, int, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_c2b07(void far *);
extern long far far_c2c33(void);
extern long far fn_c2aec(void);
long far far_c2b07(void far *p0) { return 0; }
long far far_c2c33(void) { return 0; }
long far fn_c2aec(void) { return 0; }

long far fn_c2c73(void)
{
    char loc_1;
    char far *loc_6;
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int dx3;
    int es;
    int p12;
    int p14;
    long t1;
    int t10;
    long t11;
    int t12;
    long t13;
    long t14;
    int t15;
    long t2;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    int t9;

    t1 = far_c2c33();
    *(int *)((char *)&loc_6 + 0) = (int)t1;
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x4ce1));
    far_b1ad0(1, 0);
    ax2 = far_b1b05(MK_FP(SEG_DATA, 0x4cf1));
    loc_1 = (char)0;
L1:
    t3 = far_b1ad0(loc_1 + 2, 0);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x4d1a), *(int *)((char *)&loc_6 + 0) + loc_1 + 2, (int)(t1 >> 16), 3, 0, 100, 8);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x4d25), MK_FP((int)(t1 >> 16), *(int *)((char *)&loc_6 + 0) + loc_1 + 5), MK_FP(SEG_DATA, 100), 3);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x4d25), *(int *)((char *)&loc_6 + 0) + (loc_1 << 1) + 8, (int)(t1 >> 16), 4, 1, 0x5ce, 0);
    p14 = 0;
    ax3 = (int)far_b3819(MK_FP(SEG_DATA, 0x4d2b), *(int *)((char *)&loc_6 + 0) + loc_1 + 20, (int)(t1 >> 16), 3, p14, 100, 8);
    loc_1 = (char)(loc_1 + 1);
    if (loc_1 >= 3) {
        goto L2;
    }
    goto L1;
L2:
    far_b1ad0(3, 5);
    far_b1b05(MK_FP(SEG_DATA, 0x4a43));
    far_b1ad0(4, 5);
    far_b1b05(MK_FP(SEG_DATA, 0x4a48));
    t7 = far_b90dd();
    far_b1b05(MK_FP(SEG_DATA, 0x4d32));
    far_b1ad0(7, 4);
    if (*loc_6 == 0) {
        goto L3;
    }
    t8 = far_b1b05(MK_FP(SEG_DATA, 0x4d3b));
    p12 = *(int *)((char *)&loc_6 + 0);
    p14 = 0xca37;
    dx = (int)(far_c2b07(MK_FP((int)(t1 >> 16), p12)) >> 16);
    goto L4;
L3:
    p12 = 0x4d3f;
    ax10 = far_b1b05(MK_FP(SEG_DATA, p12));
    dx = UNDEF;
L4:
    dx2 = ((char)(dx >> 8) << 8 | (unsigned char)0);
    goto L5;
L6:
    bx2 = FP_OFF(loc_6);
    if (*(char far *)MK_FP(FP_SEG(loc_6), bx2) == 0) {
        goto L7;
    }
    p12 = bx2;
    p14 = 0xca37;
    t14 = far_c2b07(MK_FP((int)(t1 >> 16), p12));
L7:
    t15 = far_b08f7(1);
    dx2 = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)t15);
    if ((char)t15 == 0) {
        goto L6;
    }
    if ((char)t15 != 120) {
        goto L5;
    }
    t9 = far_b1ad0(7, 4);
    bx = FP_OFF(loc_6);
    es = FP_SEG(loc_6);
    if (*(char far *)MK_FP(es, bx) == 0) {
        goto L8;
    }
    *(char far *)MK_FP(es, bx) = (char)0;
    p12 = 0x4d3f;
    t10 = far_b1b05(MK_FP(SEG_DATA, p12));
    t11 = fn_c2aec();
    dx3 = (int)(t11 >> 16);
    goto L9;
L8:
    *loc_6 = (char)1;
    t12 = far_b1b05(MK_FP(SEG_DATA, 0x4d3b));
    p12 = *(int *)((char *)&loc_6 + 0);
    p14 = 0xca37;
    t13 = far_c2b07(MK_FP((int)(t1 >> 16), p12));
    dx3 = (int)(t13 >> 16);
L9:
    dx2 = ((char)(dx3 >> 8) << 8 | (unsigned char)0);
L5:
    if ((char)dx2 == 0) {
        goto L7;
    }
    return ((long)dx2 << 16 | (unsigned)(char)dx2);
}
