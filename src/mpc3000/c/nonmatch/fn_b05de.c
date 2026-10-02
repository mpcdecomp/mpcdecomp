/* differs: 308 at +0, 65 bytes; 311 at +0, 65 bytes; 312 at +0, 65 bytes */
struct g_FP_7B8F {
    long f_0;
};
extern char B_7B8D;
extern struct g_FP_7B8F FP_7B8F;
extern long far fn_b05ca(void);
long far fn_b05ca(void) { return 0; }

long far fn_b05de(void)
{
    int ax;
    int dx;

    B_7B8D = (char)(B_7B8D + 1);
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) + *(char far *)((char far *)FP_7B8F.f_0);
    ax = *(char far *)((char far *)FP_7B8F.f_0);
    if (ax == 0) {
        dx = (int)(fn_b05ca() >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
