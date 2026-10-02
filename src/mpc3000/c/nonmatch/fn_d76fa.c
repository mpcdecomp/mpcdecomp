/* differs: 308 at +0, 268 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_TBL_D5FF {
    char f_0;
    char f_1;
    char f_2;
    char f_3;
};
extern char B_7FCB;
extern struct g_TBL_D5FF TBL_D5FF;
extern int W_7170;
extern int W_7172;

int near fn_d76fa(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int es;
    int flags;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;

    if (B_7FCB == 3 && TBL_D5FF.f_1 == 0) {
        flags = TBL_D5FF.f_0 - 1;
        if (!CC(">u", flags)) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_D5FF.f_2);
            t1 = __insn("aam 0xa");
            if (!CC("==", flags)) {
                TBL_D5FF.f_0 = (char)2;
            }
        }
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_D5FF.f_0);
    __insn("aam 0xa");
    if (B_7FCB == 3) {
        ax2 = (((char)(ax2 >> 8) | 4) << 8 | (unsigned char)(char)ax2);
    }
    *(int far *)MK_FP(es, 0x69f0) = ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_D5FF.f_1);
    __insn("aam 0xa");
    *(int far *)MK_FP(es, 0x69f2) = ax3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)TBL_D5FF.f_2);
    __insn("aam 0xa");
    *(int far *)MK_FP(es, 0x69f4) = ax4;
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)TBL_D5FF.f_3);
    __insn("aam 0xa");
    *(int far *)MK_FP(es, 0x69f6) = ax5;
    *(int far *)MK_FP(es, 0x69f8) = -0x4004;
    W_7172 = 0x69f0;
    W_7170 = 1;
    return -0x4004;
}
