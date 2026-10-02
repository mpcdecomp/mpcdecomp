/* differs: 308 at +0, 33 bytes; 311 at +0, 33 bytes; 312 at +0, 33 bytes */
extern char B_96F0;
extern int W_D4B2;

void far far_e68b0(void)
{
    int dx;

    dx = W_D4B2;
    do {
    } while (B_96F0 != 0 && W_D4B2 - dx <= 20);
    return;
}
