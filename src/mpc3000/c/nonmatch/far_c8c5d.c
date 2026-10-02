/* differs: 308 at +5, 187 bytes; 311 at +5, 187 bytes; 312 at +5, 187 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
};
struct g_TBL_6533 {
    int f_0;
};
struct g_TBL_6531 {
    int f_0;
};
extern char B_8A9C;
extern char B_96EE;
extern struct g_TBL_6531 TBL_6531;
extern struct g_TBL_6533 TBL_6533;
extern char TBL_6561[];
extern int far far_fa3be(long, struct s1 far *, int);

int far far_c8c5d(int arg_0, struct s1 far *arg_2, int arg_4)
{
    char loc_1;
    char loc_2;
    int loc_4;
    int bx;
    int bx2;
    int es;
    int t1;

    loc_1 = (char)0;
    loc_2 = (char)(*(char *)((char *)&arg_0 + 0) + 1);
    if (arg_0 == 137) {
        loc_2 = (char)11;
    } else if (arg_0 >= 9) {
        loc_1 = *(char *)((char *)&arg_0 + 0);
        loc_2 = (char)10;
    }
    arg_0 = (unsigned int)arg_0 % 12;
    loc_4 = loc_2;
    bx = loc_4 << 2;
    t1 = far_fa3be(((long)*(int *)((char *)&TBL_6533 + 0 + bx) << 16 | (unsigned)*(int *)((char *)&TBL_6531 + 0 + bx)), arg_2, TBL_6561[loc_2]);
    if ((arg_0 == 0 || arg_0 == 4) && B_96EE != 0) {
        arg_2->f_2 = (char)35;
    }
    bx2 = FP_OFF(arg_2);
    es = FP_SEG(arg_2);
    *(char far *)MK_FP(es, bx2 + 1) = B_8A9C;
    if (loc_1 != 0) {
        *(char far *)MK_FP(es, bx2 + 2) = (char)(loc_1 - 9);
    }
    return TBL_6561[loc_2];
}
