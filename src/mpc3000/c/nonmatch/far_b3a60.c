/* differs: 308 at +5, 129 bytes; 311 at +5, 129 bytes; 312 at +5, 129 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_FP_7B8F {
    long f_0;
};
extern char B_7B8E;
extern struct g_FP_7B8F FP_7B8F;
extern int W_7B91;

void far far_b3a60(int arg_0, char arg_2)
{
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int dx;
    int es;

    ax = W_7B91;
    dx = *(int *)((char *)&FP_7B8F + 0);
    loc_2 = ax;
    *(int *)((char *)&loc_4 + 0) = dx;
    *(char far *)((char far *)FP_7B8F.f_0) = (char)5;
    bx = (int)loc_4;
    es = (int)(loc_4 >> 16);
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_0 + 0));
    *(char far *)MK_FP(es, bx + 1) = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_2);
    *(char far *)MK_FP(es, bx + 2) = (char)ax3;
    *(char far *)MK_FP(es, bx + 3) = (char)7;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&loc_4 + 0)));
    *(char far *)MK_FP(es, bx + 4) = (char)ax4;
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + (char)ax4;
    *(char far *)((char far *)FP_7B8F.f_0) = (char)0;
    B_7B8E = (char)0;
    return;
}
