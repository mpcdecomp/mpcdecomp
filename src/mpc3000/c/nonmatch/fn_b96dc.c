/* differs: 308 at +0, 114 bytes; 311 absent; 312 absent */
extern unsigned char B_901B[];
extern char B_D4C2;
extern char B_D5DD;
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b6cd3(int);
extern long far far_b9102(void);
extern long far far_deabe(void);
extern int far far_e0031(unsigned char near *);
extern long far far_e51be(unsigned char far *, int);

long far fn_b96dc(void)
{
    int ax;
    int dx;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;

    t1 = far_b6cd3(0x3649);
    far_b1b05(0x365e);
    t2 = far_b9102();
    B_D5DD = (char)3;
    do {
        t3 = far_b08f7();
        dx = t3;
    } while (t3 == 0);
    if (dx == 120) {
        t4 = far_b1ad0(7);
        t5 = far_b1b05(0x36c4);
        t6 = far_e0031(B_901B);
        t7 = far_deabe();
        t8 = far_e51be((unsigned char far *)B_901B, 1);
        dx = B_D4C2;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
