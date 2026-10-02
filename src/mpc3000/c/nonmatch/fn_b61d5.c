/* differs: 308 absent; 311 at +D, 70 bytes; 312 at +D, 70 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_D5DD;
extern unsigned char TBL_b6283[];
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_ebcce(char far *, int, int);
extern long far fn_b628b(void);
extern long far fn_b6353(void);
extern int far fn_b669f(void);
extern long far fn_b6958(void);

long far fn_b61d5(void)
{
    char loc_3;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    unsigned int ax6;
    int dx;
    long t1;
    long t2;

    B_D5DD = (char)9;
    loc_2 = 4;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2861));
    far_b1b05(MK_FP(SEG_DATA, 0x2875));
    far_b1b05(MK_FP(SEG_DATA, 0x2886));
    far_b1b05(MK_FP(SEG_DATA, 0x2899));
    far_b1b05(MK_FP(SEG_DATA, 0x28b4));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    dx = (int)far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), loc_2, 0);
    if (dx != 0) {
        goto L1;
    }
    ax6 = loc_3 - 1;
    if (ax6 > 3) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_b6283 + (ax6 << 1))) {
    case 0:
        goto L2;
    case 1:
        goto L3;
    case 2:
        goto L4;
    case 3:
        goto L5;
    }
L2:
    dx = fn_b669f();
    goto L1;
L3:
    dx = (int)fn_b628b();
    goto L1;
L4:
    dx = (int)fn_b6353();
    goto L1;
L5:
    dx = (int)fn_b6958();
L1:
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6cd3(void far *p0) { return 0; }
long far fn_b628b(void) { return 0; }
long far fn_b6353(void) { return 0; }
int far fn_b669f(void) { return 0; }
long far fn_b6958(void) { return 0; }
