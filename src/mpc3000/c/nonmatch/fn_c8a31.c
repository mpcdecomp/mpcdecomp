/* differs: 308 at +5, 368 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern unsigned char B_7FE4[];
extern char B_7FE5;
extern unsigned char B_7FE6[];
extern unsigned char B_7FE7[];
extern unsigned char B_7FE8[];
extern char B_7FE9;
extern char B_7FEA;
extern char B_D5DD;
extern char B_F224;
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_b362e(void far *, unsigned char far *, void far *, int);
extern long far far_b38d8(char far *);
extern long far far_b6cd3(void far *);
extern long far far_ec03b(void far *);

long far fn_c8a31(void)
{
    char loc_4;
    char loc_3;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int dx;
    int p10;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    long t15;
    int t16;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    loc_3 = B_7FE5;
    B_F224 = B_7FE9;
    loc_4 = B_7FEA;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5cc8));
    B_D5DD = (char)1;
    far_b1b05(MK_FP(SEG_DATA, 0x5cda));
    t2 = far_b38d8((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3));
    far_b1ad0(2, 0);
    t3 = far_b362e(MK_FP(SEG_DATA, 0x5ceb), (unsigned char far *)B_7FE6, MK_FP(SEG_DATA, 36), 3);
    far_b1ad0(3, 0);
    t4 = far_b362e(MK_FP(SEG_DATA, 0x5d0f), (unsigned char far *)B_7FE4, MK_FP(SEG_DATA, 0x5bc8), 12);
    far_b1ad0(4, 0);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x5d2b), (unsigned char far *)B_7FE7, MK_FP(SEG_DATA, 0x5bd4), 13);
    far_b1ad0(5, 0);
    t6 = far_b362e(MK_FP(SEG_DATA, 0x5d45), (unsigned char far *)B_7FE8, MK_FP(SEG_DATA, 0x5be0), 10);
    far_b1ad0(6, 0);
    t7 = far_ec03b(MK_FP(SEG_DATA, 0x5d63));
    t8 = far_b362e(MK_FP(SEG_DATA, 0x5d7c), (char far *)&B_F224, MK_FP(SEG_DATA, 20), 11);
    p10 = (int)(unsigned)&loc_4;
    dx = (int)(far_b38d8(MK_FP(SEG_STACK, p10)) >> 16);
    if (B_F224 == 0) {
        goto L1;
    }
    goto L2;
L1:
    p10 = 7;
    t9 = far_b1ad0(p10, 15);
    t10 = far_b1f96(40);
    goto L2;
L3:
    ax7 = B_7B8D;
    if (ax7 == 0) {
        goto L4;
    }
    if (ax7 == 5) {
        goto L5;
    }
    if (ax7 == 6) {
        goto L6;
    }
    goto L2;
L4:
    B_7FE5 = loc_3;
    goto L2;
L5:
    ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)B_F224);
    B_7FE9 = (char)ax8;
    if ((char)ax8 != 0) {
        goto L7;
    }
    t13 = far_b1ad0(7, 15);
    p10 = 0x5d82;
    t14 = far_b1b05(MK_FP(SEG_DATA, p10));
    goto L2;
L7:
    t15 = far_b1073(6);
    goto L2;
L6:
    if (B_F224 != 0) {
        goto L8;
    }
    t11 = far_b1ad0(7, 15);
    p10 = 0x5d82;
    t12 = far_b1b05(MK_FP(SEG_DATA, p10));
    loc_4 = B_7FEA;
    goto L2;
L8:
    B_7FEA = loc_4;
L2:
    t16 = far_b08f7(0);
    loc_2 = t16;
    if (t16 != 0) {
        goto L9;
    }
    goto L3;
L9:
    return ((long)UNDEF << 16 | (unsigned)t16);
}
