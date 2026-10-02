/* differs: 308 at +3, 90 bytes; 311 at +3, 90 bytes; 312 at +3, 90 bytes */
long far fn_e7d62(int arg_0, char near *arg_2)
{
    int ax;
    int ax2;
    int cx;
    unsigned int dx;

    *(int *)(arg_2) = -1;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)0);
    cx = 2;
    dx = 1;
    do {
        if ((arg_0 & dx) == 0) {
            goto L1;
        }
        *arg_2 = (char)ax;
        arg_2 = arg_2 + 1;
        cx = cx - 1;
        if (cx == 0) {
            break;
        }
L1:
        ax = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax + 1));
        dx = dx << 1;
    } while (!(dx >> 15 & 1));
    return ((long)dx << 16 | (unsigned)ax);
}
