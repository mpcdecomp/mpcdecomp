/* differs: 308 at +3, 59 bytes; 311 at +3, 59 bytes; 312 at +3, 59 bytes */
#define SEG_DATA _DS
#define UNDEF 0
int far far_cad50(int far *arg_0, int far *arg_4, int far *arg_8)
{
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    int t1;

    t1 = __insn("int 0x41", 8, bx, cx, dx, si, di, es, SEG_DATA);
    *arg_0 = UNDEF;
    *arg_4 = UNDEF;
    *arg_8 = UNDEF;
    return t1;
}
