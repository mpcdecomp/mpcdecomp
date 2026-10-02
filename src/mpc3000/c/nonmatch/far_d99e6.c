/* differs: 308 at +0, 35 bytes; 311 at +0, 35 bytes; 312 at +0, 35 bytes */
struct g_W_9031 {
    long f_0;
};
extern struct g_W_9031 W_9031;
extern int W_9033;
extern long near fn_d9a02(void);

void far far_d99e6(void)
{
    int di;
    long t1;

    di = (int)W_9031.f_0;
    t1 = fn_d9a02();
    *(int *)((char *)&W_9031 + 0) = di;
    W_9033 = (int)(t1 >> 16);
    return;
}
long near fn_d9a02(void) { return 0; }
