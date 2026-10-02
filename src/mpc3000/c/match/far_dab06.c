extern char B_8189;
extern char FP_E40C[];
extern char TBL_818A[];
int far far_dab06(unsigned int arg_0);
int far far_dab37(int arg_0);
void far far_dab6c(unsigned int arg_0, int arg_2);

int far far_dab06(unsigned int arg_0)
{
    if (arg_0 >= 64) {
        goto L1;
    }
    if (B_8189 == 0) {
        goto L2;
    }
    return TBL_818A[arg_0];
L2:
    return (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + 1854 + arg_0);
L1:
    return 35;
}

int far far_dab37(int arg_0)
{
    int si;

    if (arg_0 >= 35) {
        goto L1;
    }
    return -1;
L1:
    si = 0;
L2:
    if (far_dab06(si) != arg_0) {
        goto L3;
    }
    return si;
L3:
    si = si + 1;
    if (si < 64) {
        goto L2;
    }
    return -1;
}

void far far_dab6c(unsigned int arg_0, int arg_2)
{
    if (arg_2 < 34) {
        arg_2 = 34;
    }
    if (arg_2 > 98) {
        arg_2 = 98;
    }
    if (arg_0 >= 64) {
        goto L1;
    }
    if (B_8189 != 0) {
        TBL_818A[arg_0] = (char)arg_2;
        return;
    }
    *(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + 1854 + arg_0) = (char)arg_2;
L1:
    return;
}
