/* differs: 308 at +5, 298 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DD;
extern unsigned char TBL_c0f77[];
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b6cd3(int);
extern long far far_b90dd(void);
extern long far far_ebcce(char far *, int);
extern long far fn_c0f81(void);
extern long far fn_c1ebd(void);
extern long far fn_c2187(void);
extern int far fn_c29ef(void);
extern long far fn_c2c73(void);

long far far_c0eeb(void)
{
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int dx;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    t1 = far_b6cd3(0x4b04);
    far_b1b05(0x4b0a);
    t2 = far_b90dd();
    far_b1ad0(7);
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 5);
    dx = ((char)((int)(t3 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t3);
    if ((char)dx != 0) {
        goto L1;
    }
    ax3 = ((char)((int)t3 >> 8) << 8 | (unsigned char)loc_1);
    B_D5DD = (char)ax3;
    ax4 = (char)ax3 - 1;
    if (ax4 > 4) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_c0f77 + (ax4 << 1))) {
    case 0:
        goto L2;
    case 1:
        goto L3;
    case 2:
        goto L4;
    case 3:
        goto L5;
    case 4:
        goto L6;
    }
L2:
    t7 = fn_c0f81();
    dx = ((char)((int)(t7 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t7);
    goto L1;
L3:
    t6 = fn_c1ebd();
    dx = ((char)((int)(t6 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t6);
    goto L1;
L4:
    t5 = fn_c2187();
    dx = ((char)((int)(t5 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t5);
    goto L1;
L5:
    dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)fn_c29ef());
    goto L1;
L6:
    t4 = fn_c2c73();
    dx = ((char)((int)(t4 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t4);
L1:
    return ((long)dx << 16 | (unsigned)(char)dx);
}
long far fn_c0f81(void) { return 0; }
long far fn_c1ebd(void) { return 0; }
long far fn_c2187(void) { return 0; }
int far fn_c29ef(void) { return 0; }
long far fn_c2c73(void) { return 0; }
