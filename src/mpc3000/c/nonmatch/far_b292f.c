/* differs: 308 at +5, 545 bytes; 311 at +5, 545 bytes; 312 at +5, 545 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct g_FP_7B55 {
    long f_0;
};
extern char B_7B87;
extern char B_7B88;
extern char B_7B8B;
extern unsigned char B_901B[];
extern char B_9446;
extern struct g_FP_7B55 FP_7B55;
extern char TBL_79A5[];
extern char TBL_7B5E[];
extern int W_9563;
extern long far far_b0caf(void);
extern long far far_b1015(char);
extern int far far_b1ae0(int);
extern long far far_b2acb(long);
extern long far far_e3c0f(unsigned char far *, long);

long far far_b292f(char arg_0)
{
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int bx;
    int dx;
    unsigned int dx2;
    int dx3;
    int es;
    int flags;
    int si;
    long t1;
    long t2;
    long t3;

    si = 0;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0);
    loc_a = (char)ax;
    if ((TBL_79A5[(char)ax] & 2) != 0) {
        return (long)MK_FP((int)(far_b1015(arg_0) >> 16), 0);
    }
    loc_2 = 1;
    loc_4 = 0;
    ax3 = loc_a;
    flags = ax3 - 46;
    if (CC("==", flags)) {
        dx3 = (int)(far_b1015(arg_0) >> 16);
    } else if (CC(">", flags)) {
        if (ax3 == 60) {
            if (B_7B88 == 0) {
                if (B_7B87 != 0) {
                    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_7B87);
                    ax5 = B_7B8B - 1;
                    if ((char)ax4 != ax5 || TBL_7B5E[(char)ax4] == 32) {
                        ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)B_7B87);
                        ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 - 1));
                        B_7B87 = (char)ax7;
                        TBL_7B5E[(char)ax7] = (char)32;
                        ax8 = far_b1ae0(127);
                        dx3 = UNDEF;
                    } else {
                        dx3 = (int)(far_b1015(32) >> 16);
                    }
                }
            } else {
                si = 0x400;
            }
        } else {
            if (ax3 != 62) {
                goto L1;
            }
            t3 = far_b0caf();
            dx3 = (int)(t3 >> 16);
            si = (int)t3 + 0x800;
        }
    } else if (ax3 != 43) {
        if (ax3 == 45) {
            dx = loc_4;
            loc_2 = -loc_2 - (dx != 0);
            loc_4 = -dx;
            goto L2;
        }
L1:
        if (B_7B88 == 0) {
            bx = (int)FP_7B55.f_0;
            es = (int)(FP_7B55.f_0 >> 16);
            dx3 = (int)(far_b2acb(*(long far *)MK_FP(es, bx)) >> 16);
        }
        si = arg_0;
    } else {
L2:
        t1 = far_b0caf();
        dx2 = loc_4;
        loc_6 = *(int far *)((char far *)FP_7B55.f_0 + 2) + loc_2 + (dx2 < 0) + (dx2 + 0x100 < dx2);
        loc_8 = dx2 + 0x100;
        loc_6 = loc_6 + W_9563;
        if (loc_6 < 1) {
            loc_6 = 1;
        }
        if (loc_6 > 0x3e7) {
            loc_6 = 0x3e7;
        }
        if (B_9446 == 0) {
            t2 = far_e3c0f((unsigned char far *)B_901B, *(long *)((char *)&loc_8 + 0));
            loc_6 = (int)(t2 >> 16);
            loc_8 = (int)t2;
        }
        dx3 = (int)(far_b2acb(*(long *)((char *)&loc_8 + 0)) >> 16);
        si = -0x8000;
    }
    return ((long)dx3 << 16 | (unsigned)si);
}
long far far_b2acb(long p0) { return 0; }
