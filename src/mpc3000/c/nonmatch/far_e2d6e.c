/* differs: 308 at +0, 81 bytes; 311 at +0, 81 bytes; 312 at +0, 81 bytes */
extern int W_8C39;
extern int W_8C3B;
extern int W_8C3D;
extern int W_8C3F;
extern long far far_daa07(int, int, int, int);
extern long far far_e2ce3(void);
extern long far far_fa0c8(int, int, int);
long far far_e2ce3(void) { return 0; }

void far far_e2d6e(void)
{
    long t1;
    long t2;
    long t3;
    long t4;

    t1 = far_daa07(W_8C3D, W_8C3F, W_8C39, W_8C3B);
    t2 = far_e2ce3();
    t3 = far_fa0c8(100, (int)t2, (int)(t2 >> 16));
    t4 = t3 / t1;
    return;
}
