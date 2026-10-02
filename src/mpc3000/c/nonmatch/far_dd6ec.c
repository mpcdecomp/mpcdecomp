/* differs: 308 at +0, 26 bytes; 311 at +0, 26 bytes; 312 at +0, 26 bytes */
extern int far far_dac6a();

int far far_dd6ec(void)
{
    int ax;
    int cx;
    int dx;

    if (1) {
        ax = far_dac6a();
    }
    return far_dac6a(dx, cx);
}
