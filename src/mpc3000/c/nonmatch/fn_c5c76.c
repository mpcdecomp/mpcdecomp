/* differs: 308 absent; 311 at +5, 206 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern unsigned char TBL_c5d13[];
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_ebcce(char far *, int, int);
extern long far fn_c5d1b(void);
extern long far fn_c60d7(void);
extern long far fn_c6379(void);
extern long far fn_c64c5(void);

long far fn_c5c76(void)
{
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    unsigned int ax6;
    int dx;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    far_b1aac();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5bd0));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x5be9));
    far_b1ad0(6, 0);
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 4, 0);
    dx = ((char)((int)(t3 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t3);
    if ((char)dx != 0) {
        goto L1;
    }
    ax6 = loc_1 - 1;
    if (ax6 > 3) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_c5d13 + (ax6 << 1))) {
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
    t7 = fn_c5d1b();
    dx = ((char)((int)(t7 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t7);
    goto L1;
L3:
    t6 = fn_c60d7();
    dx = ((char)((int)(t6 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t6);
    goto L1;
L4:
    t5 = fn_c6379();
    dx = ((char)((int)(t5 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t5);
    goto L1;
L5:
    t4 = fn_c64c5();
    dx = ((char)((int)(t4 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t4);
L1:
    return ((long)dx << 16 | (unsigned)(char)dx);
}
long far fn_c5d1b(void) { return 0; }
long far fn_c60d7(void) { return 0; }
long far fn_c6379(void) { return 0; }
long far fn_c64c5(void) { return 0; }
