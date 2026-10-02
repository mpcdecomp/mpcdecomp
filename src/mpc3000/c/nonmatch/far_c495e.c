/* differs: 308 at +5, 386 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_9562;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char TBL_c4a55[];
extern int far L_c280b(void);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_c2e5b(void);
extern long far far_e7069(void);
extern long far far_ebcce(char far *, int, int);
extern int far far_f07e8(void);
extern long far far_fba0a(void);
extern long far fn_c4a67(void);
extern long far fn_c5334(void);
extern long far fn_c5852(void);
extern long far fn_c5c76(void);

long far far_c495e(void)
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
    long t10;
    long t11;
    long t12;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    far_b1aac();
    B_D5DD = (char)0;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x53d9));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x53f6));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 8, 0);
    dx = ((char)((int)(t3 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t3);
    if ((char)dx == 0) {
        goto L1;
    }
    goto L2;
L1:
    ax5 = ((char)((int)t3 >> 8) << 8 | (unsigned char)loc_1);
    B_D5DD = (char)ax5;
    ax6 = (char)ax5 - 1;
    if (ax6 > 7) {
        goto L2;
    }
    switch ((unsigned int)(unsigned)(TBL_c4a55 + (ax6 << 1))) {
    case 0:
        goto L3;
    case 1:
        goto L4;
    case 2:
        goto L5;
    case 3:
        goto L6;
    case 4:
        goto L7;
    case 5:
        goto L8;
    case 6:
        goto L9;
    case 7:
        goto L10;
    }
L3:
    t12 = fn_c4a67();
    dx = ((char)((int)(t12 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t12);
    goto L2;
L4:
    t11 = fn_c5334();
    dx = ((char)((int)(t11 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t11);
    goto L2;
L5:
    t10 = fn_c5852();
    dx = ((char)((int)(t10 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t10);
    goto L2;
L6:
    t9 = fn_c5c76();
    dx = ((char)((int)(t9 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t9);
    goto L2;
L7:
    t7 = far_e7069();
    if (B_9562 == 0) {
        goto L11;
    }
    dx = ((char)((int)(far_b3b9f(-40) >> 16) >> 8) << 8 | (unsigned char)B_D5DE);
    goto L2;
L11:
    t8 = far_c2e5b();
    dx = ((char)((int)(t8 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t8);
    goto L2;
L8:
    t5 = far_e7069();
    t6 = far_fba0a();
    dx = ((char)((int)(t6 >> 16) >> 8) << 8 | (unsigned char)(char)(int)t6);
    goto L2;
L9:
    dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)L_c280b());
    goto L2;
L10:
    t4 = far_e7069();
    dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)far_f07e8());
L2:
    return ((long)dx << 16 | (unsigned)(char)dx);
}
long far fn_c4a67(void) { return 0; }
long far fn_c5334(void) { return 0; }
long far fn_c5852(void) { return 0; }
long far fn_c5c76(void) { return 0; }
