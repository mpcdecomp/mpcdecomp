/* differs: 308 at +0, 341 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct s1 {
    char pad_0[1];
    char f_1;
    char f_2;
    char f_3;
    char f_4;
};
extern unsigned char TBL_eb638[];

long far far_eb63c(void)
{
    unsigned int ax;
    int ax10;
    unsigned int ax11;
    unsigned int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int dx;
    struct s1 near *si;
    long t1;
    long t2;
    int t3;

    t1 = (unsigned long)(unsigned char)si->f_4 * 0xe10L;
    ax = (int)t1 + ((unsigned char)si->f_3 * 60 + (unsigned char)si->f_2);
    bx = (unsigned char)*(char far *)MK_FP(0xf2c5, (unsigned int)(unsigned)(TBL_eb638 + -192 + (unsigned char)*(char far *)MK_FP(-0x7ff0, 0x73a1)));
    t2 = (unsigned long)(unsigned int)ax * (unsigned long)(unsigned int)bx;
    ax2 = (int)t2 + (unsigned char)si->f_1;
    dx = (int)(t2 >> 16) + ((int)(t1 >> 16) + (ax < (unsigned int)(int)t1)) * bx + (ax2 < (unsigned int)(int)t2);
    if (*(char far *)MK_FP(-0x7ff0, 0x73a1) == 3) {
        bx2 = ax2;
        ax3 = (unsigned char)si->f_4 * 108;
        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)si->f_3);
        t3 = __insn("aam 0xa");
        ax5 = ((char)ax4 << 8 | (unsigned char)((char)ax4 << 1));
        ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 << 1));
        ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 << 1));
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)((char)ax7 << 1));
        ax9 = ((char)(ax8 >> 8) << 8 | (unsigned char)((char)ax8 + (char)ax5));
        ax10 = ((char)(ax9 >> 8) << 1 << 8 | (unsigned char)(char)ax9);
        ax11 = (unsigned char)((char)ax10 + (char)(ax10 >> 8)) + ax3;
        dx = (int)(((long)dx << 16 | (unsigned)bx2) - (unsigned long)(unsigned int)ax11 >> 16);
        ax2 = bx2 - ax11;
    }
    return ((long)dx << 16 | (unsigned)ax2);
}
