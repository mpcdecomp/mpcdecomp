/* differs: 308 at +5, 148 bytes; 311 at +5, 152 bytes; 312 at +5, 152 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_92DD {
    int f_0;
};
extern char B_D5DD;
extern struct g_TBL_92DD TBL_92DD;
extern int far far_b08f7(int);
extern int far far_b1b05(void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far fn_b71a3(int);
extern long far fn_b83ad(void);

void far fn_b70e3(void)
{
    int loc_2;
    int loc_4;
    int ax;
    int di;
    int p14;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;

    B_D5DD = (char)1;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2baa));
    si = 0;
    loc_4 = (int)fn_b71a3(0);
    t2 = far_b90dd();
    p14 = 0x2bbe;
    ax = far_b1b05(MK_FP(SEG_DATA, p14));
    loc_2 = 0;
    goto L1;
L2:
    di = far_b08f7(3);
    if (di == 120) {
        goto L3;
    }
    if (di == 121) {
        goto L4;
    }
    if (di == 122) {
        goto L5;
    }
    goto L6;
L3:
    if (si <= 0) {
        goto L1;
    }
    si = si - 1;
    p14 = 0xbdc0;
    t6 = fn_b71a3(si);
    loc_4 = (int)t6;
    goto L1;
L4:
    if (loc_4 != 10) {
        goto L1;
    }
    t4 = (long)(int)si * 40L;
    if (*(int *)((char *)&TBL_92DD + 0 + (int)t4) == -1) {
        goto L1;
    }
    si = si + 1;
    p14 = 0xbdc0;
    t5 = fn_b71a3(si);
    loc_4 = (int)t5;
    goto L1;
L5:
    t3 = fn_b83ad();
    if ((int)t3 == 0) {
        goto L1;
    }
    loc_2 = 1;
    goto L1;
L6:
    loc_2 = 1;
L1:
    if (loc_2 == 0) {
        goto L2;
    }
    return;
}
long far far_b90dd(void) { return 0; }
long far fn_b71a3(int p0) { return 0; }
long far fn_b83ad(void) { return 0; }
