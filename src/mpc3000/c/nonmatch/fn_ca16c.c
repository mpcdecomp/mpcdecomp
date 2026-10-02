/* differs: 308 at +B9, 100 bytes; 311 at +6, 267 bytes; 312 at +6, 267 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7FCB[];
extern char B_D5DD;
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, unsigned char far *, void far *, int);
extern long far far_b3819(void far *, void far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_eb845(int);
extern long far fn_ca2e7(void far *);

long far fn_ca16c(void)
{
    char loc_1;
    char loc_2;
    int ax;
    int ax2;
    int p10;
    int p8;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_eb845(0);
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x610d));
    B_D5DD = (char)2;
    far_b1ad0(2, 0);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x611c), MK_FP(SEG_DATA, -0x1d87), 2, 0, 23, 10);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x5f63), MK_FP(SEG_DATA, -0x1d88), 2, 0, 59, 10);
    t5 = far_b3819(MK_FP(SEG_DATA, 0x5f63), MK_FP(SEG_DATA, -0x1d89), 2, 0, 59, 10);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x5f63), MK_FP(SEG_DATA, -0x1d8a), 2, 0, 29, 10);
    p10 = 0x214;
    t7 = far_b362e(MK_FP(SEG_DATA, 0x6123), (unsigned char far *)B_7FCB, MK_FP(SEG_DATA, p10), 10);
    t8 = far_b90dd();
    p8 = 0x6131;
    ax2 = far_b1b05(MK_FP(SEG_DATA, p8));
    loc_2 = (char)0;
    while (loc_2 == 0) {
        do {
            t14 = far_b08f7(1);
            loc_1 = (char)t14;
        } while ((char)t14 == 0);
        if ((char)t14 == 120) {
            p8 = -0x1d8b;
            p10 = 0xd288;
            t9 = fn_ca2e7(MK_FP(SEG_DATA, p8));
            t10 = far_b1073(9);
            t11 = far_b1073(10);
            t12 = far_b1073(11);
            t13 = far_b1073(12);
            continue;
        }
        loc_2 = (char)1;
    }
    return (long)MK_FP((int)(far_eb845(1) >> 16), loc_1);
}
long far fn_ca2e7(void far *p0) { return 0; }
