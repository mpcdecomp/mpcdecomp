/* differs: 308 absent; 311 at +5, 101 bytes; 312 at +5, 101 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char B_7AA6;
extern unsigned char B_7AA7;
extern char B_9455;
extern char B_96EF;
extern int W_7AA8;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48();
extern int far far_b1f96(int);
extern long far far_b3cdb(int, int, int);
extern long far far_b3dda(void);
extern long far far_c12e7(void);
extern long far far_d7a63(int);
long far far_b3cdb(int p0, int p1, int p2) { return 0; }

long far far_b3d1d(int arg_0, int arg_2, int arg_4)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    long t1;
    long t2;
    int t3;
    long t4;
    long t5;

    B_9455 = (char)1;
    loc_2 = 0;
    if (B_96EF == 0) {
        goto L1;
    }
    t1 = far_c12e7();
    loc_2 = 1;
L1:
    t2 = far_b3cdb(102, arg_0, arg_2);
    far_b1ad0(7, 0);
    ax2 = far_b1b05(MK_FP(SEG_DATA, 0x1de5));
    if (arg_0 != 0) {
        goto L2;
    }
    if (W_7AA8 != 0) {
        goto L3;
    }
    t3 = far_b1f96(22);
    ax3 = far_b1d48(MK_FP(SEG_DATA, 0x1dec), arg_4);
    goto L2;
L3:
    ax4 = far_b1d48(MK_FP(SEG_DATA, 0x1dff), arg_4, W_7AA8, B_7AA7, B_7AA6);
    W_7AA8 = 0;
L2:
    t4 = far_b3dda();
    ax5 = (int)t4;
    dx = (int)(t4 >> 16);
    if (loc_2 == 0) {
        goto L4;
    }
    t5 = far_d7a63(77);
    ax5 = (int)t5;
    dx = (int)(t5 >> 16);
L4:
    B_9455 = (char)0;
    return ((long)dx << 16 | (unsigned)ax5);
}
long far far_b3dda(void) { return 0; }
