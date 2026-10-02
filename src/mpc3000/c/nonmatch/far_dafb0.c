/* differs: 308 at +3, 60 bytes; 311 at +3, 60 bytes; 312 at +3, 60 bytes */
struct g_TBL_A067 {
    int f_0;
};
struct g_TBL_A069 {
    int f_0;
};
extern struct g_TBL_A067 TBL_A067;
extern struct g_TBL_A069 TBL_A069;
extern int W_9031;
extern int W_9033;
extern void far far_d99e6(void);

long far far_dafb0(int arg_0, int arg_2, int arg_4)
{
    int bx;
    int p4;
    int p6;
    int t1;
    int t2;
    int t3;

    p4 = W_9031;
    p6 = W_9033;
    bx = arg_0 << 2;
    W_9031 = *(int *)((char *)&TBL_A067 + 0 + bx);
    W_9033 = *(int *)((char *)&TBL_A069 + 0 + bx);
    far_d99e6();
    far_d99e6();
    far_d99e6();
    W_9033 = p6;
    W_9031 = p4;
    return;
}
