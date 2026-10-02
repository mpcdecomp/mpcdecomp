/* differs: 308 at +3, 45 bytes; 311 at +3, 45 bytes; 312 at +3, 45 bytes */
#define UNDEF 0
extern char B_9457;
extern int far far_dac9a(void);

long far far_dd1c5(long arg_0, int arg_4, char arg_6)
{
    int ax;
    int dx;
    int si;

    if (B_9457 == 0 && (char)(arg_6 - 1) >= 0) {
        si = (int)arg_0;
        do {
            si = si + 1;
            ax = far_dac9a();
            dx = UNDEF;
            arg_4 = arg_4 - 1;
        } while (arg_4 != 1);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
