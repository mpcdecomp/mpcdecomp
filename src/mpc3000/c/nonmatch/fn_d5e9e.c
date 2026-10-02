/* differs: 308 at +0, 284 bytes; 311 at +0, 285 bytes; 312 at +0, 285 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_A5BF;
extern long near fn_d5ee3(void);
extern int near fn_d5f43();

long near fn_d5e9e(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int dx;
    int flags;
    int flags2;
    long t1;

    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)B_A5BF);
    B_A5BF = (char)ax;
    ax2 = ((unsigned int)(char)ax >> 4 << 8 | (unsigned char)(char)ax);
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax2 >> 3));
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 & 1));
    bx3 = ((unsigned int)(char)bx >> 4 << 8 | (unsigned char)(char)bx);
    bx4 = ((char)(bx3 >> 8) << 8 | (unsigned char)((unsigned int)(char)bx3 >> 3));
    bx5 = ((char)(bx4 >> 8) << 8 | (unsigned char)((char)bx4 & 1));
    flags = (char)bx5 - (char)ax4;
    if (!CC("==", flags)) {
        if (!CC(">u", flags)) {
            dx = (int)(fn_d5ee3() >> 16);
        } else {
            ax5 = fn_d5f43(bx5);
            dx = UNDEF;
        }
    }
    ax6 = ax4;
    flags2 = (char)(bx5 >> 8) - (char)(ax6 >> 8);
    if (!CC("==", flags2)) {
        if (!CC(">u", flags2)) {
            t1 = fn_d5ee3();
            ax6 = (int)t1;
            dx = (int)(t1 >> 16);
        } else {
            ax6 = fn_d5f43();
            dx = UNDEF;
        }
    }
    return ((long)dx << 16 | (unsigned)ax6);
}
long near fn_d5ee3(void) { return 0; }
int near fn_d5f43(void) { return 0; }
