/* differs: 308 at +0, 286 bytes; 311 at +0, 288 bytes; 312 at +0, 289 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5EE;
extern int TBL_7144[];
extern char TBL_D5EF;
extern long far far_dc8ae(void);
extern int near fn_d6963(void);
extern long near tgt_d651f();
long near tgt_d651f(void) { return 0; }

int near tgt_d6831(void)
{
    int ax;
    int bx;
    int bx2;
    int flags;
    int p2;
    int si;

    flags = B_D5EE;
    if (!CC("!=", flags)) {
        if (((char)ax & -16) == 0) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax & 15));
            TBL_D5EF = (char)ax;
            B_D5EE = (char)(B_D5EE - 1);
        }
    } else if (!CC(">", flags)) {
        if (((char)ax & -16) != 0) {
            if (-((unsigned int)(char)ax >> 4) != B_D5EE) {
                B_D5EE = (char)0;
            } else {
                ax = fn_d6963();
                B_D5EE = (char)(B_D5EE - 1);
            }
        } else {
            ax = (int)far_dc8ae();
            B_D5EE = (char)1;
        }
    } else {
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax >> 4));
        if ((char)bx != B_D5EE) {
            p2 = __flags(B_D5EE & 3);
            B_D5EE = (char)bx;
            B_D5EE = (char)(B_D5EE + 1);
            ax = fn_d6963();
            __insn("popf", p2);
            if (!CC("!=", UNDEF)) {
                ax = (int)far_dc8ae();
            }
        } else {
            B_D5EE = (char)(B_D5EE + 1);
            ax = fn_d6963();
            if (((char)ax & 48) == 0) {
                ax = (int)far_dc8ae();
            }
        }
    }
    TBL_7144[si] = (int)(unsigned)tgt_d651f;
    return ax;
}
