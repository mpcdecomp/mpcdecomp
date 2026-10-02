/* differs: 308 at +5, 263 bytes; 311 at +5, 263 bytes; 312 at +5, 263 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_TBL_D661 {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D66B {
    int f_0;
};
struct g_TBL_D66D {
    int f_0;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern unsigned char TBL_D65D[];
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern char TBL_D665[];
extern char TBL_D666[];
extern unsigned char TBL_D667[];
extern struct g_TBL_D66B TBL_D66B;
extern struct g_TBL_D66D TBL_D66D;

long far fn_cd909(void)
{
    int loc_2;
    int loc_4;
    char loc_5;
    char loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int ax;
    struct s1 near *cx;
    struct s1 near *di;
    unsigned int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int flags;
    int si;

    loc_2 = 1;
    goto L1;
L2:
    loc_2 = 0;
    loc_4 = 0;
    si = 0;
    cx = (struct s1 near *)TBL_D65D;
    di = (struct s1 near *)TBL_D667;
L3:
    ax = cx->f_2;
    dx = cx->f_0;
    flags = ax - di->f_2;
    if (CC(">=u", flags)) {
        goto L4;
    }
    goto L5;
L4:
    if (CC(">u", flags)) {
        goto L6;
    }
    if (dx > (unsigned int)di->f_0) {
        goto L6;
    }
    goto L5;
L6:
    loc_5 = TBL_D65B[si];
    loc_6 = TBL_D65C[si];
    dx2 = cx->f_0;
    loc_8 = cx->f_2;
    loc_a = dx2;
    dx3 = *(int *)((char *)&TBL_D661 + 0 + si);
    loc_c = *(int *)((char *)&TBL_D663 + 0 + si);
    loc_e = dx3;
    TBL_D65B[si] = TBL_D665[si];
    TBL_D65C[si] = TBL_D666[si];
    dx4 = di->f_0;
    cx->f_2 = di->f_2;
    cx->f_0 = dx4;
    dx5 = *(int *)((char *)&TBL_D66B + 0 + si);
    *(int *)((char *)&TBL_D663 + 0 + si) = *(int *)((char *)&TBL_D66D + 0 + si);
    *(int *)((char *)&TBL_D661 + 0 + si) = dx5;
    TBL_D665[si] = loc_5;
    TBL_D666[si] = loc_6;
    di->f_2 = loc_8;
    di->f_0 = loc_a;
    ax = loc_c;
    dx = loc_e;
    *(int *)((char *)&TBL_D66D + 0 + si) = ax;
    *(int *)((char *)&TBL_D66B + 0 + si) = dx;
    loc_2 = 1;
L5:
    si = si + 10;
    cx = (struct s1 near *)((char near *)cx + 10);
    di = (struct s1 near *)((char near *)di + 10);
    loc_4 = loc_4 + 1;
    if (si == 0xbae) {
        goto L1;
    }
    goto L3;
L1:
    if (loc_2 == 0) {
        goto L7;
    }
    goto L2;
L7:
    return ((long)dx << 16 | (unsigned)ax);
}
