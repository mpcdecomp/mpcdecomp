/* differs: 308 at +5, 580 bytes; 311 at +5, 578 bytes; 312 at +5, 578 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_d4fac[];
extern unsigned char TBL_d51d6[];
extern int far far_d4fb4(void);
extern int near fn_d4fda(void);
extern int near fn_d5050(void);
int far far_d4fb4(void) { return 0; }
int near fn_d4fda(void) { return 0; }
int near fn_d5050(void) { return 0; }

int far far_d50a2(char arg_0)
{
    char loc_2[2];
    char loc_4[2];
    char loc_6[2];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int cx;
    int dx;
    int es;
    int p12;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;

    loc_2[0] = (char)0;
    loc_4[0] = (char)0;
    for (;;) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)inp(170));
        if ((char)ax2 != 0) {
            bx = UNDEF;
            es = UNDEF;
            ax2 = fn_d4fda();
            dx = UNDEF;
            if (!CC("==", UNDEF)) {
                p12 = 0xd581;
                bx = UNDEF;
                es = UNDEF;
                ax = far_d4fb4();
                dx = UNDEF;
                if (UNDEF == 1) {
                    goto L1;
                }
                continue;
            }
            break;
        }
        break;
    }
    outp(168, (char)-1);
    outp(176, (char)0);
    ax4 = ((char)(ax2 >> 8) << 8 | (unsigned char)inp(160));
    bx2 = ((char)(bx >> 8) << 8 | (unsigned char)arg_0) & 7;
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 | *(char far *)MK_FP(0xd581, (unsigned int)(unsigned)(TBL_d4fac + -0x130 + bx2))));
    outp(182, (char)ax5);
    outp(184, (char)17);
    outp(186, (char)48);
    outp(188, (char)4);
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)36);
    outp(164, (char)ax6);
    cx = 30;
    do {
        cx = cx - 1;
    } while (cx != 0);
    for (;;) {
        ax6 = ((char)(ax6 >> 8) << 8 | (unsigned char)inp(168));
        if ((char)ax6 == 0) {
            ax6 = ((char)(ax6 >> 8) << 8 | (unsigned char)inp(172));
            if (((char)ax6 & 32) == 0) {
                break;
            }
            continue;
        }
        break;
    }
    ax3 = ((char)(ax6 >> 8) << 8 | (unsigned char)inp(168));
    if ((char)ax3 != 16) {
        if (((char)ax3 & 4) != 0) {
            ax3 = 0x101;
        } else {
            ax3 = 0x102;
        }
    } else {
        for (;;) {
            ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)inp(170));
            if (((char)ax3 & -128) == 0) {
                if (((char)ax3 & 8) != 0) {
                    continue;
                }
                goto L2;
            }
            switch ((unsigned int)(unsigned)(TBL_d51d6 + ((unsigned char)((char)ax3 & 7) << 1))) {
            case 0:
                outp(176, (char)0);
                t6 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax3 = t6;
                dx = UNDEF;
                goto L3;
            case 1:
                outp(176, (char)1);
                t5 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax3 = t5;
                dx = UNDEF;
                goto L3;
            case 2:
                outp(176, (char)2);
                t4 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax3 = t4;
                dx = UNDEF;
                goto L3;
            case 3:
                outp(176, (char)3);
                p12 = SEG_STACK;
                t3 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax3 = t3;
                dx = UNDEF;
                goto L3;
            case 4:
            case 5:
                goto L4;
            case 6:
                outp(176, (char)6);
                loc_6[0] = (char)-128;
                p12 = SEG_STACK;
                t2 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                ax3 = t2;
                dx = UNDEF;
                goto L3;
            case 7:
                outp(176, (char)7);
                t1 = fn_d5050();
                bx2 = UNDEF;
                cx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
                p12 = t1;
                outp(164, (char)-64);
                ax3 = p12;
L3:
                if (ax3 != 0) {
                    goto L5;
                }
                continue;
            }
        }
L5:
    }
    goto L6;
L1:
    ax3 = 0x106;
    goto L6;
L2:
    ax3 = (unsigned char)loc_2[0];
    if (loc_4[0] != 0) {
        ax3 = (2 << 8 | (unsigned char)loc_4[0]);
    }
    goto L6;
L4:
    ax3 = 0x104;
L6:
    return ax3;
}
