/* differs: 308 at +46, 50 bytes; 311 at +46, 50 bytes; 312 at +46, 51 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_D612;
extern char B_F74E;
extern char B_F74F;
extern char B_F750;
extern int W_F746;
extern int W_F748;
extern int W_F74A;
extern int W_F74C;
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e5612(int, int);

int far far_e59bd(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;

    if (B_F74F != -1) {
        ax = (int)far_e51be((unsigned char far *)B_8C41, W_F74A, 1);
    } else {
        ax2 = far_e0031((unsigned char far *)B_8C41);
    }
    if (B_F750 == 0) {
        ax3 = 0;
    } else {
        ax3 = 1;
    }
    ax4 = (int)far_e51be((unsigned char far *)B_901B, W_F74C, ax3);
    if (B_F750 >= 0) {
        ax4 = (int)far_e5612(W_F746, W_F748);
    }
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_F74E);
    B_D612 = (char)ax5;
    return ax5;
}
