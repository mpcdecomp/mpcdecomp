/* differs: 308 at +3, 133 bytes; 311 at +3, 133 bytes; 312 at +3, 133 bytes */
struct g_TBL_D667 {
    int f_0;
};
struct g_TBL_D669 {
    int f_0;
};
struct g_TBL_D66B {
    int f_0;
};
struct g_TBL_D66D {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern char TBL_D665[];
extern char TBL_D666[];
extern struct g_TBL_D667 TBL_D667;
extern struct g_TBL_D669 TBL_D669;
extern struct g_TBL_D66B TBL_D66B;
extern struct g_TBL_D66D TBL_D66D;

long far fn_cdab4(int arg_0)
{
    int dx;
    int dx2;
    int si;
    long t1;

    si = arg_0 * 10;
    while (TBL_D665[si] != 0) {
        TBL_D65B[si] = TBL_D665[si];
        TBL_D65C[si] = TBL_D666[si];
        dx = *(int *)((char *)&TBL_D667 + 0 + si);
        *(int *)((char *)&TBL_D65F + 0 + si) = *(int *)((char *)&TBL_D669 + 0 + si);
        *(int *)((char *)&TBL_D65D + 0 + si) = dx;
        dx2 = *(int *)((char *)&TBL_D66B + 0 + si);
        *(int *)((char *)&TBL_D663 + 0 + si) = *(int *)((char *)&TBL_D66D + 0 + si);
        *(int *)((char *)&TBL_D661 + 0 + si) = dx2;
        si = si + 10;
        arg_0 = arg_0 + 1;
    }
    t1 = (long)(int)arg_0 * 10L;
    TBL_D65B[(int)t1] = (char)0;
    TBL_D65C[(int)t1] = (char)-1;
    *(int *)((char *)&TBL_D65F + 0 + (int)t1) = -1;
    *(int *)((char *)&TBL_D65D + 0 + (int)t1) = -1;
    *(int *)((char *)&TBL_D663 + 0 + (int)t1) = 0;
    *(int *)((char *)&TBL_D661 + 0 + (int)t1) = 0;
    return t1;
}
