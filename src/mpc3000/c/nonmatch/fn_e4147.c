/* differs: 308 at +5, 137 bytes; 311 at +5, 137 bytes; 312 at +5, 138 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_8804;
extern char B_8807;
extern char B_901B;
extern char TBL_A5BC[];
extern int W_9045;
extern int W_9047;
extern int W_9053;
extern int W_9055;
extern void far far_d99a2(char far *, char far *, int);
extern long far far_deee8(void far *, int);
extern void far far_e3ddb(char far *);
extern long far far_e7073(int, int);
extern long far far_e723d(char far *, int, int);

void far fn_e4147(void)
{
    char loc_6[6];
    int p14;
    long t1;
    long t2;
    int t3;
    int t4;
    long t5;
    long t6;

    if (B_8800 != 0) {
        t1 = (long)(int)B_8804 * 0x1f4L;
        if (TBL_A5BC[(int)t1] == 0) {
            return;
        }
        goto L1;
    }
    if (B_901B >= 0) {
        do {
L1:
            far_e3ddb((char far *)&B_901B);
            if (UNDEF != 0) {
                if (B_8800 != 0) {
                    p14 = (int)(unsigned)&B_901B;
                    t2 = far_deee8(MK_FP(SEG_DATA, p14), W_9053);
                } else {
                    B_8807 = (char)1;
                }
            }
        } while (B_8807 == 0);
        if (W_9055 == 0) {
            far_d99a2((char far *)&B_901B, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 5);
            if (loc_6[0] == -88) {
                t5 = far_e723d((char far *)&B_901B, (unsigned char)loc_6[3], (unsigned char)loc_6[4]);
            }
        }
        t6 = far_e7073(W_9045, W_9047);
    }
    return;
}
