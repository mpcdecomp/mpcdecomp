/* differs: 308 absent; 311 at +1E, 58 bytes; 312 at +1E, 58 bytes */
extern char B_8805;
extern unsigned char B_901B[];
extern char B_D4C2;
extern long far far_deabe(void);
extern void far far_deb3f(void);
extern long far far_deeab(void);
extern void far far_e39b5(void);
extern long far far_e51be(unsigned char far *, int, int);
extern int far fn_d7bf4(int, int);

int far far_d7b9c(int arg_0, int arg_2)
{
    int loc_2;
    int ax;
    long t1;
    int t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;

    t1 = far_deabe();
    far_deb3f();
    ax = fn_d7bf4(arg_0, arg_2);
    loc_2 = ax;
    if (ax < 0) {
        t3 = far_deabe();
        far_deb3f();
    }
    B_D4C2 = (char)77;
    far_e39b5();
    t6 = far_e51be((unsigned char far *)B_901B, 1, 1);
    B_8805 = (char)0;
    t7 = far_deeab();
    return loc_2;
}
int far fn_d7bf4(int p0, int p1) { return 0; }
