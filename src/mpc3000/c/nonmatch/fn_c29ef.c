/* differs: 308 at +5, 217 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_7B8D;
extern unsigned char B_E422[];
extern unsigned char B_E423[];
extern unsigned char B_E424[];
extern unsigned char B_E425[];
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b362e(void far *, unsigned char far *, void far *);
extern long far far_b6cd3(int);
extern long far far_b90dd(void);
extern long far far_c2b07(int);
extern long far far_c2c33(void);

int far fn_c29ef(void)
{
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int p10;
    int p8;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    t1 = far_b6cd3(0x4c51);
    far_b1ad0(1);
    t2 = far_b362e(MK_FP(SEG_DATA, 0x4c65), (unsigned char far *)B_E422, MK_FP(SEG_DATA, 72));
    far_b1ad0(2);
    t3 = far_b362e(MK_FP(SEG_DATA, 0x4c71), (unsigned char far *)B_E423, MK_FP(SEG_DATA, 72));
    far_b1ad0(3);
    t4 = far_b362e(MK_FP(SEG_DATA, 0x4c89), (unsigned char far *)B_E424, MK_FP(SEG_DATA, 72));
    far_b1ad0(4);
    far_b1b05(0x4c92);
    far_b1ad0(5);
    p10 = 36;
    t5 = far_b362e(MK_FP(SEG_DATA, 0x4cbb), (unsigned char far *)B_E425, MK_FP(SEG_DATA, p10));
    far_b1ad0(5);
    p8 = 0x4ccf;
    far_b1b05(p8);
    t6 = far_b90dd();
    for (;;) {
        t9 = far_b08f7();
        loc_1 = (char)t9;
        if ((char)t9 != 0) {
            break;
        }
        if (B_7B8D != 2) {
            continue;
        }
        t7 = far_c2c33();
        p8 = (int)t7;
        p10 = 0xca37;
        t8 = far_c2b07(p8);
    }
    return (char)t9;
}
long far far_c2b07(int p0) { return 0; }
long far far_c2c33(void) { return 0; }
