/* differs: 150 size 378, image 250; +1 image `enter 0xc, 0` CL `enter 0x1a, 0`; 172 size 378, image 250; +1 image `enter 0xc, 0` CL `enter 0x1a, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_BUF_XFER {
    int f_0;
    int f_2;
};
extern struct g_BUF_XFER BUF_XFER;
extern int G_ERRNO;
extern long __far __pascal flash_write_words();
extern int __far int2F_call_fn6();
extern long __far timing_calc_rate();
extern long __far __pascal x_aFldiv();

long __far __pascal sample_data_load_12bit(int arg_6, int arg_4, int arg_2, int arg_0)
{
    char loc_c;
    char loc_b[3];
    long loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int bx;
    int dx;
    int flags;
    int flags2;
    int p26;
    int p28;
    int si;
    long t1;
    long t2;
    int t3;
    long t4;

    t1 = x_aFldiv(0, 2, arg_2, arg_0);
    dx = (int)(t1 >> 16);
    loc_4 = (int)t1;
    loc_2 = dx;
    bx = arg_6;
    *(int *)((char *)&loc_8 + 0) = arg_4;
    loc_6 = bx;
    si = 0;
    flags = dx;
    if (CC(">=", flags)) {
        goto L1;
    }
    goto L2;
L1:
    if (CC(">", flags)) {
        goto L3;
    }
    if ((int)t1 != 0) {
        goto L3;
    }
    goto L2;
L3:
    t3 = int2F_call_fn6((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 3);
    if (t3 == 3) {
        goto L4;
    }
    goto L5;
L4:
    *(int *)((char *)&BUF_XFER + 0 + si + si) = (int)timing_calc_rate((((char)(t3 >> 8) << 8 | (unsigned char)loc_b[0]) & 15) << 4 | (loc_c << 8 | (unsigned char)0));
    t4 = timing_calc_rate();
    dx = (int)(t4 >> 16);
    *(int *)((char *)&BUF_XFER + 2 + si + si) = (int)t4;
    si = si + 2;
    if (si <= 0x400) {
        goto L6;
    }
    arg_0 = (int)(unsigned)&BUF_XFER;
    p26 = si;
    p28 = 0x0b50;
    t2 = flash_write_words(loc_6, *(int *)((char *)&loc_8 + 0), MK_FP(SEG_DATA, arg_0), p26);
    dx = -(si < 0);
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + si;
    loc_6 = (int)(loc_8 + ((long)dx << 16 | (unsigned)si) >> 16);
    si = 0;
L6:
    loc_4 = loc_4 - 1;
    loc_2 = loc_2 - (loc_4 == 0);
    flags2 = loc_2;
    if (CC("<=", flags2)) {
        goto L7;
    }
    goto L3;
L7:
    if (CC("<", flags2)) {
        goto L2;
    }
    if (loc_4 == 0) {
        goto L8;
    }
    goto L3;
L8:
    goto L2;
L5:
    G_ERRNO = 4;
    return ((long)UNDEF << 16 | (unsigned)0);
L2:
    if (si == 0) {
        goto L9;
    }
    dx = (int)(flash_write_words(loc_6, *(int *)((char *)&loc_8 + 0), (struct g_BUF_XFER far *)&BUF_XFER, si) >> 16);
L9:
    return ((long)dx << 16 | (unsigned)1);
}
