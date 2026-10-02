/* differs: 308 at +0, 75 bytes; 311 at +0, 75 bytes; 312 at +0, 75 bytes */
#define UNDEF 0
extern char B_96EF;
extern int far far_b1aac(void);
extern void far far_c12b7(void);
extern long far fn_c1e77(int, int);
void far far_c12b7(void) { }

long far far_c12e7(void)
{
    int t1;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;

    far_c12b7();
    t2 = fn_c1e77(0, 60);
    t3 = fn_c1e77(1, 117);
    t4 = fn_c1e77(2, 39);
    t5 = fn_c1e77(3, 63);
    t6 = far_b1aac();
    B_96EF = (char)0;
    return ((long)UNDEF << 16 | (unsigned)t6);
}
long far fn_c1e77(int p0, int p1) { return 0; }
