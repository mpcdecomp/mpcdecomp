/* differs: 308 at +0, 56 bytes; 311 at +0, 56 bytes; 312 at +0, 56 bytes */
int near fn_f944e(void)
{
    int flags;

    if (!CC(">=u", flags)) {
        *(int *)0x1c = -1;
    }
    *(int *)0x1c = *(int *)0x1c + 1;
    return *(int *)0x1c;
}
