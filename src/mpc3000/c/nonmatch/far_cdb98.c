/* differs: 308 at +3, 467 bytes; 311 at +3, 467 bytes; 312 at +3, 467 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_cdb98(long arg_0)
{
    int ax;
    unsigned int bx;
    int di;
    int ds;
    int dx;
    int dx2;
    int dx3;
    int dx4;

    di = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    ax = (unsigned char)*(char far *)MK_FP(ds, di);
    bx = *(int far *)MK_FP(ds, di + 1);
    dx = *(int far *)MK_FP(ds, di + 3);
    dx2 = ((char)(dx >> 8) << 8 | (unsigned char)((unsigned int)(char)dx >> 1));
    dx3 = ((char)(dx2 >> 8) << 8 | (unsigned char)((unsigned int)(char)dx2 >> 1));
    dx4 = ((char)(dx3 >> 8) << 8 | (unsigned char)((unsigned int)(char)dx3 >> 1));
    outpw(96, ax);
    outpw(102, ((char)(dx4 >> 8) << 8 | (unsigned char)((unsigned int)(char)dx4 >> 1)) | 0x100);
    outpw(100, (((bx >> 1 | ((char)dx & 1) << 15) >> 1 | ((char)dx2 & 1) << 15) >> 1 | ((char)dx3 & 1) << 15) >> 1 | ((char)dx4 & 1) << 15);
    outpw(98, ((char)bx << 4 << 8 | (unsigned char)0));
    outpw(96, ax + 0x100);
    outpw(98, *(int far *)MK_FP(ds, di + 5));
    outpw(96, ax + 0x300);
    outpw(98, 0);
    outpw(100, 0);
    outpw(96, ax + 0x400);
    outpw(98, *(int far *)MK_FP(ds, di + 9));
    outpw(100, *(int far *)MK_FP(ds, di + 7) | -0x8000);
    outpw(96, ax + 0x500);
    outpw(98, *(int far *)MK_FP(ds, di + 11));
    outpw(100, *(int far *)MK_FP(ds, di + 13));
    outpw(96, ax + 0x600);
    outpw(98, *(int far *)MK_FP(ds, di + 17));
    outpw(100, *(int far *)MK_FP(ds, di + 15));
    outpw(96, ax + 0x700);
    outpw(98, (*(char far *)MK_FP(ds, di + 22) << 8 | (unsigned char)*(char far *)MK_FP(ds, di + 21)));
    outpw(100, (*(char far *)MK_FP(ds, di + 20) << 8 | (unsigned char)*(char far *)MK_FP(ds, di + 19)));
    return;
}
