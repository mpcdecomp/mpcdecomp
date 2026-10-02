/* differs: 308 at +3, 7 bytes; 311 at +3, 7 bytes; 312 at +3, 7 bytes */
struct g_FP_E40C {
    long f_0;
};
extern char B_7FC7;
extern struct g_FP_E40C FP_E40C;

long far fn_ba607(int arg_0)
{
    int dx;

    dx = 4;
    if (B_7FC7 != 0) {
        dx = (unsigned char)*(char far *)((char far *)FP_E40C.f_0 + -755 + arg_0 * 24);
    }
    return ((long)dx << 16 | (unsigned)dx);
}
