/* differs: 308 at +5, 90 bytes; 311 at +5, 90 bytes; 312 at +5, 90 bytes */
#define UNDEF 0
extern char B_955C;
extern unsigned char B_D4B5;
extern int TBL_9543[];
extern void far fn_c1d09(char, int, int);
void far fn_c1d09(char p0, int p1, int p2) { }

long far fn_c1d38(int arg_0, int arg_2, unsigned int arg_4, int arg_6)
{
    int loc_2;
    int ax;
    int dx;
    int si;
    int t1;
    int t2;

    loc_2 = (int)B_D4B5 >> 4;
    if (arg_6 == 0) {
        goto L1;
    }
    si = 0;
L2:
    fn_c1d09(*(char *)((char *)&arg_0 + 0), arg_2, si);
    ax = UNDEF;
    si = si + 1;
    if (si < 16) {
        goto L2;
    }
    dx = -1;
    goto L3;
L1:
    fn_c1d09(*(char *)((char *)&arg_0 + 0), arg_2, arg_4);
    ax = UNDEF;
    dx = 1 << (unsigned char)*(char *)((char *)&arg_4 + 0);
L3:
    if (arg_2 != 0) {
        goto L4;
    }
    TBL_9543[loc_2] = dx;
    B_955C = (char)(B_955C | 4);
L5:
    if (TBL_9543[loc_2] != 0) {
        goto L5;
    }
L4:
    return ((long)dx << 16 | (unsigned)ax);
}
