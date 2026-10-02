/* differs: 308 at +0, 291 bytes; 311 at +0, 291 bytes; 312 at +0, 291 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_716E;
extern char B_716F;
extern unsigned char B_7FCB;
extern char B_D5FD;
extern char B_D5FE;
extern unsigned char TBL_d761d[];
extern int W_7170;
extern int W_7172;
extern int near fn_d76fa(void);
extern void near fn_d7747(void);

void near fn_d7625(void)
{
    int ax;
    int ax2;
    int ax3;
    int near *si;
    int t1;

    if ((B_D5FE & 1) == 0) {
        if ((B_D5FD & 1) != 0) {
            B_716F = (char)0;
            outp(246, (char)-112);
            B_716E = (char)0;
            ax = *(int far *)MK_FP(0xe055, (unsigned int)(unsigned)(TBL_d761d + (B_7FCB << 1)));
            outp(-0x3fcf, (char)ax);
            outp(-0x3fcf, (char)(ax >> 8));
            B_D5FE = (char)(B_D5FE + 1);
            B_716F = (char)(B_716F + 1);
            ax2 = fn_d76fa();
L1:
            if ((B_716F & 1) != 0) {
                if (B_716F == 3) {
                    outp(246, (char)-112);
                    B_D5FE = (char)0;
                } else {
                    B_716E = (char)(B_716E ^ 1);
                    if ((B_716E ^ 1) != 0) {
                        outp(244, (char)1);
                    } else {
                        outp(246, (char)-112);
                    }
                    B_716F = (char)(B_716F + 1);
                }
            } else {
                si = (int near *)W_7172;
                if ((*si & W_7170) != 0) {
                    B_716E = (char)(B_716E ^ 1);
                    if ((B_716E ^ 1) != 0) {
                        outp(244, (char)1);
                    } else {
                        outp(246, (char)-112);
                    }
                }
                W_7170 = W_7170 << 1;
                if (W_7170 << 1 == 0) {
                    W_7170 = 1;
                    if ((unsigned int)(unsigned)si == 0x69f8) {
                        if (B_D5FD == 0) {
                            B_716F = (char)(B_716F + 1);
                        } else {
                            fn_d7747();
                            ax3 = fn_d76fa();
                            goto L2;
                        }
                    } else {
                        W_7172 = (int)(unsigned)(si + 1);
L2:
                        B_716F = (char)(B_716F - 1);
                    }
                } else {
                    goto L2;
                }
            }
        }
    } else {
        goto L1;
    }
    return;
}
int near fn_d76fa(void) { return 0; }
void near fn_d7747(void) { }
