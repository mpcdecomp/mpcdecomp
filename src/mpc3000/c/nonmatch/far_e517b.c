/* differs: 308 at +4, 90 bytes; 311 at +4, 89 bytes; 312 at +4, 90 bytes */
struct g_W_8C35 {
    long f_0;
};
extern struct g_W_8C35 W_8C35;
extern long far far_e259f(char);

int far far_e517b(char arg_0)
{
    int dx;

    dx = ((char)((int)(far_e259f((char)(arg_0 + 1)) >> 16) >> 8) << 8 | (unsigned char)*(char far *)((char far *)W_8C35.f_0));
    if ((char)dx != -1) {
        goto L1;
    }
    dx = ((char)((int)(far_e259f(0) >> 16) >> 8) << 8 | (unsigned char)*(char far *)((char far *)W_8C35.f_0));
    if ((char)dx == -1) {
        return -1;
    }
L1:
    return (unsigned char)(char)dx & 127;
}
