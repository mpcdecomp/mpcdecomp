/* differs: 308 absent; 311 at +7, 92 bytes; 312 at +7, 92 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern int W_7ACC;
extern int far fn_d5460(int, int, char far *);
int far fn_d5460(int p0, int p1, char far *p2) { return 0; }

void far fn_d579d(char far *arg_0)
{
    char loc_24[8];
    char loc_1c[28];
    int ax;
    int si;

    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_24), 0, 36);
    ax = fn_d5460(W_7ACC, 35, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_24));
    if (ax != 0) {
        return;
    }
    si = 0;
    while (*arg_0 != 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)loc_1c[si]);
        if ((char)ax != *arg_0) {
            goto L1;
        }
        *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
        si = si + 1;
        if (si < 36) {
            continue;
        }
        goto L2;
    }
    return;
L2:
    return;
L1:
    return;
}
