/* differs: 308 at +3, 112 bytes; 311 at +3, 112 bytes; 312 at +3, 112 bytes */
extern int B_EFDA;
extern unsigned char TBL_159B[];
extern long far fn_c1326(int, int, int);
extern long far fn_c13d7(int);
extern long far fn_c1497(int);
extern int far fn_c1860(int);
extern long far fn_c1977(int);
extern long far fn_c1e3d(void);
long far fn_c1326(int p0, int p1, int p2) { return 0; }

long far fn_c136e(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int ax;
    int si;
    int si2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    B_EFDA = B_EFDA + 1;
    __stos2((unsigned char far *)TBL_159B, 0, 0x780);
    t1 = fn_c1977(0);
    ax = fn_c1860(arg_0);
    si = 0;
    do {
        t2 = fn_c1497(si);
        si = si + 1;
    } while (si < 16);
    t3 = fn_c1326(arg_6, arg_4, arg_2);
    B_EFDA = B_EFDA - 1;
    t4 = fn_c1e3d();
    si2 = 0;
    do {
        t5 = fn_c13d7(si2);
        si2 = si2 + 1;
    } while (si2 < 16);
    return t5;
}
long far fn_c13d7(int p0) { return 0; }
long far fn_c1497(int p0) { return 0; }
int far fn_c1860(int p0) { return 0; }
long far fn_c1977(int p0) { return 0; }
long far fn_c1e3d(void) { return 0; }
