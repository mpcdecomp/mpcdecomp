/* differs: 308 at +0, 232 bytes; 311 at +0, 232 bytes; 312 at +0, 232 bytes */
#define UNDEF 0
extern long near fn_d4ff8(void);
long near fn_d4ff8(void) { return 0; }

int near fn_d5050(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int cx;

    outp(168, (char)-1);
    ax = ((char)((int)fn_d4ff8() >> 8) << 8 | (unsigned char)0);
    outp(184, (char)ax);
    outp(188, (char)UNDEF);
    outp(186, (char)(UNDEF >> 8));
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)-127);
    outp(164, (char)ax2);
    cx = 0;
L1:
    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)(inp(172) & -2));
    if ((char)ax2 != -80) {
        goto L2;
    }
    cx = cx - 1;
    if (cx != 0) {
        goto L1;
    }
    ax3 = 0x103;
    goto L3;
L2:
    ax4 = ((char)(ax2 >> 8) << 8 | (unsigned char)inp(168));
    if (((char)ax4 & 8) == 0) {
        goto L4;
    }
L5:
    ax4 = ((char)(ax4 >> 8) << 8 | (unsigned char)(inp(172) & -16));
    if ((char)ax4 != -112) {
        goto L5;
    }
    if ((inp(176) & 1) != 0) {
        goto L6;
    }
    outp(168, (char)8);
L4:
    if ((inp(168) & 39) == 0) {
        goto L6;
    }
    ax3 = 0x103;
    goto L3;
L6:
    ax3 = 0;
L3:
    return ax3;
}
