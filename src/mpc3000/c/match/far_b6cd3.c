extern void far far_b05a7(void);
extern int far far_b1aac(void);
extern long far far_ec03b(long);

long far far_b6cd3(int arg_0, int arg_2)
{
    int ax;
    int t1;

    far_b05a7();
    far_b1aac();
    return far_ec03b(*(long *)((char *)&arg_0 + 0));
}
