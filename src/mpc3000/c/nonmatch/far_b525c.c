/* differs: 308 at +33, 27 bytes; 311 at +33, 27 bytes; 312 at +33, 27 bytes */
struct g_W_E3A6 {
    long f_0;
};
extern struct g_W_E3A6 W_E3A6;
extern int W_E3A8;
extern int far far_cb566(int, int, long, long, int);
extern long far far_cdcc2(void);

int far far_b525c(unsigned int arg_0, int arg_2, int arg_4, unsigned int arg_6)
{
    int ax;
    long t1;

    if (arg_0 >= 128) {
        return 0;
    }
    t1 = far_cdcc2();
    far_cb566(arg_2, arg_4, W_E3A6.f_0, (unsigned long)(unsigned int)arg_6, 1);
    *(int *)((char *)&W_E3A6 + 0) = *(int *)((char *)&W_E3A6 + 0) + arg_6;
    W_E3A8 = (int)(W_E3A6.f_0 + (unsigned long)(unsigned int)arg_6 >> 16);
    return arg_6;
}
