/* differs: 308 at +3, 201 bytes; 311 at +3, 200 bytes; 312 at +3, 201 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_W_903D {
    long f_0;
};
struct g_W_9039 {
    long f_0;
};
extern struct g_W_9039 W_9039;
extern int W_903B;
extern struct g_W_903D W_903D;
extern int W_903F;

long far fn_ebba8(unsigned int arg_0, int arg_2, long arg_4)
{
    int ax2;
    unsigned int ax3;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int flags;
    long t1;

    flags = arg_2 - W_903F;
    if (!CC(">u", flags) && (CC("!=", flags) || arg_0 <= (unsigned int)*(int *)((char *)&W_903D + 0))) {
        bx = (int)arg_4;
        es = (int)(arg_4 >> 16);
        ax2 = arg_2;
        dx = arg_0;
        *(int far *)MK_FP(es, bx + 2) = ax2;
        *(int far *)MK_FP(es, bx) = dx;
        return ((long)dx << 16 | (unsigned)ax2);
    }
    dx2 = *(int *)((char *)&W_903D + 0);
    dx3 = arg_0;
    t1 = (unsigned long)MK_FP((int)(((long)arg_2 << 16 | (unsigned)dx3) - W_903D.f_0 >> 16), dx3 - *(int *)((char *)&W_903D + 0)) % (unsigned long)MK_FP((int)(((long)W_903F << 16 | (unsigned)dx2) - W_9039.f_0 >> 16), dx2 - *(int *)((char *)&W_9039 + 0));
    ax3 = (int)t1 + *(int *)((char *)&W_9039 + 0);
    dx4 = (int)(t1 >> 16) + W_903B + (ax3 < (unsigned int)(int)t1);
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    *(int far *)MK_FP(es2, bx2 + 2) = dx4;
    *(int far *)MK_FP(es2, bx2) = ax3;
    return ((long)dx4 << 16 | (unsigned)ax3);
}
