/* differs: 308 at +5, 163 bytes; 311 at +5, 163 bytes; 312 at +5, 163 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char TBL_159B[];

void far fn_c1977(int arg_0)
{
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int cx;
    int di;
    unsigned int dx;
    int es;
    int si;

    ax = (int)(unsigned)(TBL_159B + arg_0 * 30);
    loc_2 = SEG_DATA;
    *(int *)((char *)&loc_4 + 0) = ax;
    di = arg_0;
    while (di < 64) {
        si = 0;
        dx = 12;
        while (si < 15) {
            ax2 = dx >> 3;
            es = (int)(loc_4 >> 16);
            arg_0 = (int)loc_4 + ax2;
            ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)dx & 7));
            cx = ((char)(cx >> 8) << 8 | (unsigned char)(7 - (char)ax3));
            ax = ((char)(ax3 >> 8) << 8 | (unsigned char)(1 << (char)cx));
            *(char far *)MK_FP(es, arg_0) = (char)(*(char far *)MK_FP(es, arg_0) | (char)ax);
            si = si + 1;
            dx = dx + 15;
        }
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 30;
        di = di + 1;
    }
    return;
}
