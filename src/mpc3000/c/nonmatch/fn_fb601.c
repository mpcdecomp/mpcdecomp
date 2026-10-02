/* differs: 308 at +0, 27 bytes; 311 at +0, 27 bytes; 312 at +0, 27 bytes */
int near fn_fb601(void)
{
    int ax;
    int near *bx;

    _disable();
    ax = *bx;
    if (ax != 0) {
        *bx = *bx - 1;
    }
    return ax;
}
