/* differs: 308 at +0, 117 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char B_8434[];
extern char B_D5DD;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3819(void far *, unsigned char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);

long far fn_b6958(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx;
    long t1;
    long t2;
    int t3;

    B_D5DD = (char)98;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2a08));
    far_b1ad0(1, 0);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x2a2a), (unsigned char far *)B_8434, 2, 0, 99, 8);
    far_b1ad0(3, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x2a4d));
    ax4 = (int)far_b90dd();
    dx = 0;
    for (;;) {
L1:
        if (dx != 0) {
            break;
        }
        for (;;) {
            t3 = far_b08f7(-128);
            dx = t3;
            if (t3 == 0) {
                continue;
            }
            goto L1;
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6cd3(void far *p0) { return 0; }
