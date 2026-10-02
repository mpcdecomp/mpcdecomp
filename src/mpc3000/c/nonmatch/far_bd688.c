/* differs: 308 at +5, 347 bytes; 311 at +5, 349 bytes; 312 at +5, 351 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_956A;
extern char B_D5DD;
extern char B_D5DE;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern int far far_d7903(void);
extern long far far_d8388(int, int, int, int far *);
extern int far far_d8444(int, int, int);
extern long far far_e4d15(int, int, char far *);
extern long far far_e6006(void);
extern long far fn_bd64d(char far *);
extern long far fn_bd7ce(void far *);
long far fn_bd64d(char far *p0) { return 0; }

long far far_bd688(int arg_0, int arg_2)
{
    int loc_2;
    char loc_3;
    char loc_16[19];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int p28;
    int p30;
    int p32;
    long t1;
    int t10;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)100;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x427c));
    far_b1ad0(1, 0);
    loc_3 = (char)(int)far_e6006();
    t2 = far_b3819(MK_FP(SEG_DATA, 0x4298), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), 2, 1, 99, 10);
    p32 = loc_3;
    t3 = far_e4d15(p32, -1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
    p30 = 0xbd63;
    t4 = fn_bd64d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
    t5 = far_b90dd();
    p28 = 0x42ac;
    ax2 = far_b1b05(MK_FP(SEG_DATA, p28));
    for (;;) {
        t8 = far_b08f7(1);
        if (t8 != 0) {
            break;
        }
        if (B_7B8D == 0) {
            p32 = loc_3;
            t6 = far_e4d15(p32, -1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
            p28 = (int)(unsigned)loc_16;
            p30 = 0xbd63;
            t7 = fn_bd64d(MK_FP(SEG_STACK, p28));
            continue;
        }
    }
    if (t8 != 120) {
        return ((long)t8 << 16 | (unsigned)t8);
    }
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x42b4));
    ax5 = (int)far_d8388(arg_0, arg_2, 3, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    if (ax5 != 0) {
        return (long)MK_FP((int)(far_b3b9f(ax5) >> 16), B_D5DE);
    }
    if (loc_2 < 3) {
        ax6 = (int)fn_bd7ce(MK_FP(SEG_DATA, 0x42c4));
        if (ax6 != 120) {
            return ((long)ax6 << 16 | (unsigned)ax6);
        }
L1:
        B_956A = (char)(B_956A + 1);
        ax7 = far_d8444(arg_0, arg_2, loc_3);
        if (ax7 != 0) {
            t9 = far_b3b9f(ax7);
        }
        t10 = far_d7903();
        B_956A = (char)(B_956A - 1);
        return ((long)UNDEF << 16 | (unsigned)0);
    }
    goto L1;
}
long far fn_bd7ce(void far *p0) { return 0; }
