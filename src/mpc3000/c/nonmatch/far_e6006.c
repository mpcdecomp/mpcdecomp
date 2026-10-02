/* differs: 308 at +B, 25 bytes; 311 at +B, 25 bytes; 312 at +B, 25 bytes */
struct g_W_8C35 {
    long f_0;
};
extern struct g_W_8C35 W_8C35;
extern long far far_e259f(char);

void far far_e6006(void)
{
    unsigned char loc_1;
    int ax;

    loc_1 = (unsigned char)1;
    while (loc_1 < 99) {
        ax = (int)far_e259f(loc_1);
        if (loc_1 < (unsigned char)(*(char far *)((char far *)W_8C35.f_0) & 127)) {
            break;
        }
        loc_1 = (unsigned char)(loc_1 + 1);
    }
    return;
}
