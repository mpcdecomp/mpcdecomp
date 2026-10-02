/* differs: 308 at +7, 32 bytes; 311 at +7, 32 bytes; 312 at +7, 32 bytes */
extern int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;

long far fn_d9a44(int arg_0, int arg_2)
{
    long loc_4;
    int loc_2;
    int ax;
    int dx;

    if (arg_2 == W_9027 && arg_0 == W_9025) {
        dx = W_9021;
        arg_2 = W_9023;
        arg_0 = dx;
    }
    loc_2 = arg_2;
    *(int *)((char *)&loc_4 + 0) = arg_0;
    ax = *(int *)((char *)&loc_4 + 0);
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - 1;
    if (ax == 0) {
        loc_2 = loc_2 - 0x1000;
    }
    return loc_4;
}
