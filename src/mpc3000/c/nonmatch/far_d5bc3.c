/* differs: 308 absent; 311 at +0, 66 bytes; 312 at +0, 66 bytes */
extern char B_7AC1;
extern unsigned char B_7AC3;
extern long far far_d5b6a(int);
extern long far fn_d5953(void);
long far far_d5b6a(int p0) { return 0; }
long far fn_d5953(void) { return 0; }

long far far_d5bc3(void)
{
    int ax;
    int dx;
    long t1;
    long t2;

    if (B_7AC3 != 0) {
        t1 = fn_d5953();
        if (B_7AC1 != 0) {
            B_7AC3 = (unsigned char)1;
        }
        t2 = far_d5b6a(B_7AC3);
        ax = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
