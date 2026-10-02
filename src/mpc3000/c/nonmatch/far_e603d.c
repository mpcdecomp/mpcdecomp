/* differs: 308 at +5, 184 bytes; 311 at +5, 185 bytes; 312 at +5, 185 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern long far far_e49dd(int);

long far far_e603d(int arg_0)
{
    int loc_2;
    int loc_4;
    unsigned long loc_6;
    int ax;
    int di;
    int dx;
    int flags;
    int si;
    long t1;
    long t2;

    loc_4 = 0;
    *(int *)((char *)&loc_6 + 0) = 0;
    di = 0;
    t1 = (long)(int)arg_0 * 0x1f4L;
    dx = (int)(t1 >> 16);
    si = (int)t1;
    for (;;) {
        ax = (unsigned char)TBL_A7B0[si];
        loc_2 = ax;
        if (ax != 0) {
            t2 = (long)(int)(int)far_e49dd((unsigned char)TBL_A7AF[si]) * (long)(int)loc_2;
            dx = -((int)t2 < 0);
            *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + (int)t2;
            loc_4 = (int)(loc_6 + ((long)dx << 16 | (unsigned)(int)t2) >> 16);
            si = si + 2;
            di = di + 1;
            if (di >= 250) {
                break;
            }
            continue;
        }
        break;
    }
    flags = loc_4;
    if (!CC("<u", flags) && (CC(">u", flags) || (unsigned int)*(int *)((char *)&loc_6 + 0) > 0x7fff)) {
        return ((long)dx << 16 | (unsigned)0x7fff);
    }
    return ((long)dx << 16 | (unsigned)*(int *)((char *)&loc_6 + 0));
}
