/* differs: 308 at +0, 485 bytes; 311 at +0, 486 bytes; 312 at +0, 487 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_B_9780 {
    int f_0;
};
extern char B_713E;
extern unsigned char B_713F;
extern char B_7140;
extern char B_7141;
extern char B_7142;
extern char B_7FC7;
extern struct g_B_9780 B_9780;
extern char B_9781;
extern char B_D4AA;
extern char B_D4AB;
extern char B_E426;
extern char TBL_95EE[];
extern char TBL_966E[];
extern int W_713C;
extern long far far_da7e0(char, int);
extern int far far_dac9a(void);
extern void near tgt_d612d();
void near tgt_d612d(void) { }

long near tgt_d6186(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx10;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int dx;
    int p2;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;

    if ((char)ax == 0) {
        B_713E = (char)-128;
        B_7140 = (char)64;
        if (B_D4AB != 0) {
            B_713F = B_9781;
        }
        TBL_966E[B_713F] = (char)0;
        t1 = far_dac9a();
        t2 = far_dac9a();
        ax2 = far_dac9a();
        dx = UNDEF;
        bx = (int)(unsigned)tgt_d612d;
    } else {
        if (B_D4AA != 0) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)127);
        }
        B_7141 = (char)64;
        if (B_D4AB != 0) {
            bx2 = ((char)(bx3 >> 8) << 8 | (unsigned char)B_7142);
            B_713F = B_9781;
            if (B_7FC7 != 0) {
                if (*(char *)((char *)&B_9780 + 0) != 0) {
                    p2 = ax;
                    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)bx2 + 1));
                    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 << 3));
                    bx3 = UNDEF;
                    B_7141 = (char)(int)far_da7e0((char)((char)ax4 - 1), B_9780.f_0);
                    B_713E = (char)(B_713E | *(char *)((char *)&B_9780 + 0));
                    ax = p2;
                } else {
                    bx4 = ((char)(bx2 >> 8) << 8 | (unsigned char)((char)bx2 + 13));
                    bx5 = ((char)(bx4 >> 8) << 8 | (unsigned char)((char)bx4 - B_E426));
                    bx6 = ((char)bx5 << 8 | (unsigned char)((char)bx5 << 2));
                    bx7 = ((char)(bx6 >> 8) << 8 | (unsigned char)((char)bx6 + (char)(bx6 >> 8)));
                    bx3 = ((char)(bx7 >> 8) << 8 | (unsigned char)((char)bx7 + 4));
                    B_7141 = (char)bx3;
                }
            } else {
                bx8 = ((char)(bx2 >> 8) << 8 | (unsigned char)((char)bx2 + 1));
                bx9 = ((char)(bx8 >> 8) << 8 | (unsigned char)((char)bx8 << 3));
                bx3 = ((char)(bx9 >> 8) << 8 | (unsigned char)((char)bx9 - 1));
                ax = ((char)(ax >> 8) << 8 | (unsigned char)(char)bx3);
            }
        }
        bx10 = ((char)(bx3 >> 8) << 8 | (unsigned char)B_713F);
        B_9781 = (char)bx10;
        B_7140 = (char)ax;
        TBL_95EE[(unsigned char)(char)bx10] = B_7141;
        t3 = far_dac9a();
        t4 = far_dac9a();
        t5 = far_dac9a();
        ax2 = far_dac9a();
        dx = UNDEF;
        bx = (int)(unsigned)tgt_d612d;
    }
    W_713C = bx;
    return ((long)dx << 16 | (unsigned)ax2);
}
