/* differs: 308 at +6, 257 bytes; 311 at +6, 258 bytes; 312 at +6, 256 bytes */
extern long far far_b059a(int);
extern int far far_d79ee(void);
extern int far far_d7b2c(void);
extern long far far_df14a(char);

int far fn_b5046(void)
{
    int loc_2;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    long t1;
    int t2;

    t1 = far_b059a(4);
    if (far_d7b2c() != 0) {
        goto L1;
    }
    goto L2;
L1:
    t2 = far_d79ee();
    loc_2 = t2;
    flags = t2 - 88;
    if (CC("==", flags)) {
        goto L3;
    }
    if (CC(">", flags)) {
        goto L4;
    }
    flags2 = t2 - 80;
    if (CC("==", flags2)) {
        goto L5;
    }
    if (CC(">", flags2)) {
        goto L6;
    }
    flags3 = t2 - 77;
    if (CC("==", flags3)) {
        goto L7;
    }
    if (CC(">", flags3)) {
        goto L8;
    }
    if (t2 == 47) {
        goto L5;
    }
    if (t2 == 68) {
        goto L5;
    }
    goto L9;
L8:
    if (t2 == 78) {
        goto L5;
    }
    goto L9;
L6:
    if (t2 == 81) {
        goto L5;
    }
    if (t2 == 86) {
        goto L3;
    }
    if (t2 == 87) {
        goto L3;
    }
    goto L9;
L4:
    flags4 = t2 - 93;
    if (CC("==", flags4)) {
        goto L5;
    }
    if (CC(">", flags4)) {
        goto L10;
    }
    if (t2 == 89) {
        goto L3;
    }
    if (t2 == 90) {
        goto L3;
    }
    if (t2 == 91) {
        goto L5;
    }
    goto L9;
L10:
    if (t2 == 98) {
        goto L5;
    }
    if (t2 == 123) {
        goto L5;
    }
    if (t2 != 125) {
        goto L9;
    }
L5:
    return 0;
L7:
    return 77;
L3:
    return (int)far_df14a(*(char *)((char *)&loc_2 + 0));
L9:
    return 79;
L2:
    return 0;
}
