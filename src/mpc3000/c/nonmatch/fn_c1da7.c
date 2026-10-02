/* differs: 308 absent; 311 at +5, 53 bytes; 312 at +5, 53 bytes */
#define SEG_DATA _DS
extern char B_EFDA;
extern long far far_b133a(long, int, int, int, char);

long far fn_c1da7(int arg_0)
{
    int loc_4;
    int loc_2;
    int ax;
    int si;
    long t1;

    ax = arg_0 * 15 + 3;
    loc_2 = SEG_DATA;
    loc_4 = 0x1703;
    si = 0;
    do {
        t1 = far_b133a(*(long *)((char *)&loc_4 + 0), ax, 0, 5, B_EFDA);
        loc_4 = loc_4 + 30;
        si = si + 1;
    } while (si < 3);
    return t1;
}
