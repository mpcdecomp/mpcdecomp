/* differs: 308 at +3, 37 bytes; 311 at +3, 37 bytes; 312 at +3, 37 bytes */
#define UNDEF 0
extern char B_9457;
extern int far far_dac9a(void);

long far fn_dd1a4(int arg_2)
{
    int ax;
    int dx;

    if (B_9457 == 0 && arg_2 - 1 >= 0) {
        ax = far_dac9a();
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
