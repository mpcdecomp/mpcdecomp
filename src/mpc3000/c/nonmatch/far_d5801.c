/* differs: 308 at +5, 329 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
extern char B_7AC2;
extern char W_7ACC;
extern long far L_de8dc(int);
extern long far far_cad00(int);
extern void far far_d4f81(void);
extern int far far_d4fb4(void);
extern void far far_d4fd3(void);
extern long far far_d5b6a(int);
extern long far fn_d5460(int, int, char far *);
extern long far fn_d5953(void);
long far L_de8dc(int p0) { return 0; }
long far fn_d5460(int p0, int p1, char far *p2) { return 0; }

int far far_d5801(void)
{
    char loc_18[22];
    int loc_2;
    int ax;
    int di;
    int flags;
    long t1;
    int t10;
    long t11;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    int t7;
    int t8;
    long t9;

    *(char *)0x6ea6 = (char)0;
    t1 = far_d5b6a(0);
    t2 = far_cad00(0);
    if (far_d4fb4() != 0) {
        return 1;
    }
    di = 0;
    loc_2 = 0;
    while (loc_2 < 7) {
        t6 = fn_d5460(loc_2, 21, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18));
        if ((int)t6 != 0) {
            goto L1;
        }
        t3 = L_de8dc(loc_2);
        ax = (int)t3;
        flags = ax - 0x302;
        if (CC("==", flags)) {
            goto L1;
        }
        if (CC(">", flags)) {
            if (ax == 0x306) {
                goto L1;
            }
            goto L2;
        }
        if (ax != 0 && ax != 0x300) {
L2:
            loc_2 = loc_2 - 1;
L3:
            loc_2 = loc_2 + 1;
            continue;
        }
L1:
        if ((int)t6 == 0x101) {
            goto L3;
        }
        if ((int)t6 == 0) {
            break;
        }
        if ((int)t6 == 8) {
            goto L4;
        }
        if ((int)t6 == 0x302) {
            goto L5;
        }
        di = di + 1;
        if (di > 3) {
            goto L6;
        }
        far_d4fd3();
        t5 = far_d4fb4();
        loc_2 = loc_2 - 1;
        goto L3;
    }
    if (loc_2 == 7) {
        far_d4fd3();
        return 2;
    }
    W_7ACC = *(char *)((char *)&loc_2 + 0);
    t9 = fn_d5953();
    if ((int)t9 != 0) {
        return (int)t9;
    }
    if (B_7AC2 == 0) {
        far_d4f81();
        B_7AC2 = (char)1;
    }
    t11 = far_d5b6a(1);
    return 0;
L6:
    far_d4fd3();
    return 3;
L5:
    return 6;
L4:
    return 6;
}
long far far_d5b6a(int p0) { return 0; }
long far fn_d5953(void) { return 0; }
