/* differs: 308 absent; 311 at +5, 41 bytes; 312 at +5, 41 bytes */
extern int W_F290;

long far far_cca3a(void)
{
    long loc_4;
    int loc_2;
    int ax;
    int cx;
    long t1;

    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    if (W_F290 != 0) {
        ax = W_F290;
        t1 = (long)(int)ax << 20;
        loc_2 = (int)(t1 >> 16) - 2 + ((unsigned int)((int)t1 - 0x7d0) < (unsigned int)(int)t1);
        *(int *)((char *)&loc_4 + 0) = (int)t1 - 0x7d0;
    }
    return loc_4;
}
