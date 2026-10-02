/* differs: 308 at +5, 380 bytes; 311 at +5, 381 bytes; 312 at +5, 381 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_8804;
extern char B_8807;
extern char B_8808;
extern char B_901B;
extern char TBL_A5BC[];
extern unsigned int W_9045;
extern int W_9047;
extern long far far_deee8(char far *, int);
extern long far far_e3d12(char far *, long);
extern void far far_e3ddb(char far *);
extern long far far_e5a99(char far *);
extern long far far_eadf4(char far *, int, int, char far *);
extern void far fn_e4147(void);
void far fn_e4147(void) { }

void far fn_e41ef(void)
{
    char loc_8[8];
    char loc_16[14];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int flags;
    int si;
    long t1;
    int t10;
    long t2;
    long t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    if (B_8800 != 0) {
        ax = B_8804 * 0x1f4;
        if (TBL_A5BC[ax] == 0) {
            return;
        }
        goto L1;
    }
    if (B_901B < 0) {
        goto L2;
    }
L1:
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_8808);
    *(int *)((char *)&loc_16 + 12) = (unsigned char)(char)ax2;
    flags = 0 - W_9047;
    if (!CC(">u", flags) && (CC("!=", flags) || (unsigned char)(char)ax2 <= W_9045)) {
        ax3 = *(int *)((char *)&loc_16 + 12);
        cx = W_9045;
        *(int *)((char *)&loc_8 + 6) = (int)(((long)W_9047 << 16 | (unsigned)cx) - (long)(int)ax3 >> 16);
        *(int *)((char *)&loc_8 + 4) = cx - ax3;
        t1 = far_e5a99((char far *)&B_901B);
        t2 = far_eadf4((char far *)&B_901B, *(int *)((char *)&loc_8 + 4), *(int *)((char *)&loc_8 + 6), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
        t3 = far_e3d12((char far *)&B_901B, *(long *)((char *)&loc_8 + 0));
        if (B_8807 != 0) {
            fn_e4147();
            return;
        }
        fn_e4147();
        fn_e4147();
        return;
    }
    dx = W_9045;
    *(int *)((char *)&loc_8 + 6) = W_9047;
    *(int *)((char *)&loc_8 + 4) = dx;
    t7 = far_e5a99((char far *)&B_901B);
    dx2 = (int)(far_deee8((char far *)&B_901B, 1) >> 16);
    if ((*(int *)((char *)&loc_8 + 4) | *(int *)((char *)&loc_8 + 6)) != 0) {
        si = 0;
        *(int *)((char *)&loc_16 + 2) = 0;
        *(int *)((char *)&loc_16 + 0) = 0;
        di = (int)(unsigned)loc_16;
        for (;;) {
            ax4 = *(int *)((char *)&loc_8 + 4);
            dx3 = *(int *)((char *)&loc_8 + 6);
            *(int *)((char *)&loc_8 + 4) = *(int *)((char *)&loc_8 + 4) - 1;
            *(int *)((char *)&loc_8 + 6) = *(int *)((char *)&loc_8 + 6) - (*(int *)((char *)&loc_8 + 4) == 0);
            if ((ax4 | dx3) == 0) {
                break;
            }
            if (B_8807 != 0) {
                dx4 = W_9045;
                *(int far *)MK_FP(SEG_STACK, di + 2) = W_9047;
                *(int far *)MK_FP(SEG_STACK, di) = dx4;
                di = di + 4;
                si = si + 1;
            }
            far_e3ddb((char far *)&B_901B);
        }
        if (si != 0) {
            si = si - 1;
        }
        bx = (int)(unsigned)(loc_16 + (si << 2));
        t8 = far_eadf4((char far *)&B_901B, *(int far *)MK_FP(SEG_STACK, bx), *(int far *)MK_FP(SEG_STACK, bx + 2), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
        t9 = far_e3d12((char far *)&B_901B, *(long *)((char *)&loc_8 + 0));
    }
L2:
    return;
}
