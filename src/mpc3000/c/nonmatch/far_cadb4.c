/* differs: 308 at +3, 253 bytes; 311 at +3, 253 bytes; 312 at +3, 253 bytes */
#define SEG_DATA _DS
#define UNDEF 0
long far far_cadb4(int arg_0, int arg_2, int arg_4, int arg_6, unsigned long arg_8, int arg_10)
{
    int ax;
    int bx;
    unsigned int bx2;
    unsigned int bx3;
    unsigned int bx4;
    unsigned int bx5;
    unsigned int cx;
    int di;
    int ds;
    int dx;
    unsigned int dx2;
    unsigned int dx3;
    unsigned int dx4;
    unsigned int dx5;
    unsigned int dx6;
    unsigned int dx7;
    unsigned int dx8;
    int es;
    int si;

    ds = SEG_DATA;
    for (;;) {
        ax = arg_10 | *(int *)((char *)&arg_8 + 0);
        if (ax == 0) {
            break;
        }
        cx = -0x1000;
        if (arg_10 == 0 && (unsigned int)*(int *)((char *)&arg_8 + 0) < cx) {
            cx = *(int *)((char *)&arg_8 + 0);
        }
        ax = __insn("int 0x41", arg_0, ((char)(bx >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_6 + 0)), cx, arg_2, si, di, es, arg_4);
        dx = UNDEF;
        es = UNDEF;
        ds = ds;
        if (ax != 0 || UNDEF == 0) {
            goto L1;
        }
        *(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) - UNDEF;
        arg_10 = (int)(arg_8 - (unsigned long)(unsigned int)UNDEF >> 16);
        dx2 = arg_4;
        dx3 = dx2 << 1;
        dx4 = dx3 << 1;
        dx5 = dx4 << 1;
        dx6 = dx5 << 1;
        dx7 = dx6 + arg_2;
        dx8 = dx7 + UNDEF;
        bx2 = ((((dx2 >> 15 & 1) << 1 | dx3 >> 15 & 1) << 1 | dx4 >> 15 & 1) << 1 | dx5 >> 15 & 1) + (dx7 < dx6) + (dx8 < dx7);
        bx3 = bx2 >> 1;
        bx4 = bx3 >> 1;
        bx5 = bx4 >> 1;
        bx = bx5 >> 1;
        dx = (((dx8 >> 1 | (bx2 & 1) << 15) >> 1 | (bx3 & 1) << 15) >> 1 | (bx4 & 1) << 15) >> 1 | (bx5 & 1) << 15;
        arg_4 = dx;
        arg_2 = dx8 & 15;
    }
L1:
    return ((long)dx << 16 | (unsigned)ax);
}
