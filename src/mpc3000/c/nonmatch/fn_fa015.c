/* differs: 308 at +0, 88 bytes; 311 at +0, 88 bytes; 312 at +0, 88 bytes */
void near fn_fa015(void)
{
    int ax;
    unsigned int cx;
    char t1;
    char t2;
    char t3;

    t1 = inp(-0x3fce);
    ax = inp(-0x3fce);
L1:
    outp(-0x3fcd, (char)-128);
    t2 = inp(-0x3fce);
    t3 = inp(-0x3fce);
    if ((unsigned int)-((t3 << 8 | (unsigned char)t3) - ((char)ax << 8 | (unsigned char)t1)) < cx) {
        goto L1;
    }
    return;
}
