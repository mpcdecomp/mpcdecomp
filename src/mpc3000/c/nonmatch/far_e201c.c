/* differs: 308 at +3, 449 bytes; 311 at +3, 449 bytes; 312 at +3, 448 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_e201c(int arg_0, long arg_2)
{
    unsigned int ax;
    unsigned int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int bx;
    int di;
    int ds;
    int p10;
    int si;
    int si2;
    int si3;

    di = 0;
    ax = arg_0;
    if (ax < 138) {
        si = (int)arg_2;
        ds = (int)(arg_2 >> 16);
        if (ax >= 9 && ax != 137) {
            p10 = ax;
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 9));
            *(char far *)MK_FP(ds, si) = (char)67;
            si2 = si + 1;
            if (ax2 < 10) {
                *(char far *)MK_FP(ds, si2) = (char)((char)ax2 + 48);
                si3 = si2 + 1;
            } else {
                if (ax2 >= 100) {
                    ax3 = ((char)(ax2 % 100) << 8 | (unsigned char)(char)(ax2 / 100));
                    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 + 48));
                    *(char far *)MK_FP(ds, si2) = (char)ax4;
                    si2 = si2 + 1;
                    ax2 = (unsigned char)(char)(ax4 >> 8);
                }
                ax5 = ((char)(ax2 % 10) << 8 | (unsigned char)(char)(ax2 / 10));
                ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 + 48));
                *(char far *)MK_FP(ds, si2) = (char)ax6;
                *(char far *)MK_FP(ds, si2 + 1) = (char)((char)(ax6 >> 8) + 48);
                si3 = si2 + 2;
            }
            *(char far *)MK_FP(ds, si3) = (char)45;
            si = si3 + 1;
            ax = p10;
        }
        ax7 = ax << 1;
        bx = *(int far *)MK_FP(0xe201, ax7 + 229);
        ax8 = ((char)(ax7 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xe201, bx));
        if ((char)ax8 == 124) {
            di = 1;
            bx = bx + 1;
            ax8 = ((char)(ax8 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xe201, bx));
        }
        if ((char)ax8 != 37) {
            if ((char)ax8 == 94) {
                ax8 = (*(char far *)MK_FP(0xe201, bx + 1) << 8 | (unsigned char)(char)ax8);
                bx = 217;
            }
        } else {
            bx = 207;
        }
        for (;;) {
            ax8 = ((char)(ax8 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xe201, bx));
            if ((char)ax8 != 0) {
                if ((char)ax8 == 126) {
                    ax8 = ((char)(ax8 >> 8) << 8 | (unsigned char)(char)(ax8 >> 8));
                }
                *(char far *)MK_FP(ds, si) = (char)ax8;
                si = si + 1;
                bx = bx + 1;
                continue;
            }
            break;
        }
        if (di != 0) {
            *(char far *)MK_FP(ds, si) = (char)32;
            *(char far *)MK_FP(ds, si + 1) = (char)76;
            *(char far *)MK_FP(ds, si + 2) = (char)83;
            *(char far *)MK_FP(ds, si + 3) = (char)66;
            si = si + 4;
        }
        *(char far *)MK_FP(ds, si) = (char)0;
    }
    return;
}
