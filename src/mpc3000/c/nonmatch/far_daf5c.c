/* differs: 308 at +0, 133 bytes; 311 at +0, 133 bytes; 312 at +0, 133 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_9457;
extern char TBL_F779;
extern int W_96F6;
extern int W_96F8;
extern int far far_dc29e(void);
extern int far far_dc2b6(void);
extern long far far_dc2bf(char far *, int, int);
extern long far far_e2ce3(void);
extern long far far_e7d89(char far *, int);

long far far_daf5c(void)
{
    int ax;
    long t1;
    long t2;
    long t3;

    far_dc2b6();
    t1 = far_e2ce3();
    W_96F8 = (int)(t1 >> 16);
    W_96F6 = (int)t1;
    if ((int)(t1 >> 16) > 0) {
        goto L1;
    }
    if ((int)(t1 >> 16) < 0) {
        goto L2;
    }
    if ((unsigned int)(int)t1 >= 100) {
        goto L1;
    }
L2:
    B_9457 = (char)(B_9457 | 4);
    goto L3;
L4:
    if (TBL_F779 == -1) {
        goto L1;
    }
    t2 = far_e7d89((char far *)&TBL_F779, (int)t3);
L1:
    t3 = far_dc2bf((char far *)&TBL_F779, 0x640, 1);
    if ((int)t3 != 0) {
        goto L4;
    }
L3:
    return ((long)UNDEF << 16 | (unsigned)far_dc29e());
}
