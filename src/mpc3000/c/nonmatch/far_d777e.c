/* differs: 308 at +0, 106 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_7178;
extern char B_D5FD;
extern char B_D5FE;
extern int W_7174;
extern int W_7176;

void far far_d777e(void)
{
    int ax;
    char t1;

    B_D5FD = (char)0;
    B_D5FE = (char)0;
    t1 = inp(-0x3fef);
    B_7178 = t1;
    ax = (unsigned char)(t1 | 121);
    outp(-0x3fef, (char)ax);
    W_7174 = *(int far *)MK_FP(0, 0x24);
    W_7176 = *(int far *)MK_FP(0, 0x26);
    _disable();
    *(int far *)MK_FP(0, 0x24) = 2;
    *(int far *)MK_FP(0, 0x26) = 0xe055;
    __insn("popf", __flags((char)ax));
    return;
}
