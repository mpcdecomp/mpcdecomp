/* differs: 308 at +0, 56 bytes; 311 at +0, 56 bytes; 312 at +0, 56 bytes */
struct g_FP_7B8F {
    long f_0;
};
extern char B_7B8D;
extern struct g_FP_7B8F FP_7B8F;

long far fn_b05ca(void)
{
    int ax;
    int ax2;

    B_7B8D = (char)(B_7B8D - 1);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)((char far *)FP_7B8F.f_0 + -1));
    *(int *)((char *)&FP_7B8F + 0) = *(int *)((char *)&FP_7B8F + 0) - (char)ax;
    return ((long)(char)ax << 16 | (unsigned)(char)ax);
}
