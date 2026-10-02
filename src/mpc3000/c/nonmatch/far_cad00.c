/* differs: 308 absent; 311 at +3, 130 bytes; 312 at +3, 130 bytes */
#define SEG_DATA _DS
#define UNDEF 0
extern long far far_d5bc3(void);

long far far_cad00(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int es;
    int si;

    if (arg_0 != 12) {
        goto L1;
    }
    bx = arg_2;
    dx = arg_4;
    cx = arg_6;
    goto L2;
L1:
    if (arg_0 != 0) {
        goto L3;
    }
    ax2 = __insn("int 0x41", 0, UNDEF, UNDEF, (int)(far_d5bc3() >> 16), si, di, UNDEF, SEG_DATA);
    dx2 = UNDEF;
    goto L4;
L3:
    dx = arg_2;
    bx = arg_4;
    cx = arg_6;
L2:
    ax3 = __insn("int 0x41", arg_0, bx, cx, dx, si, di, es, SEG_DATA);
    dx2 = UNDEF;
    if (ax3 != 0) {
        goto L5;
    }
    ax4 = arg_0;
    if ((char)ax4 == 4) {
        goto L6;
    }
    if ((char)ax4 != 5) {
        goto L4;
    }
L6:
    ax3 = -0xb00;
    if (UNDEF != arg_6) {
        goto L5;
    }
L4:
    ax3 = 0;
L5:
    _enable();
    return ((long)dx2 << 16 | (unsigned)ax3);
}
