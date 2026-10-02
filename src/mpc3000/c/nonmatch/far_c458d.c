/* differs: 308 absent; 311 at +34, 27 bytes; 312 at +34, 27 bytes */
#define UNDEF 0
extern int W_83C0;
extern int far far_cd551(long);
extern int far fn_c45d3(long, int);

long far far_c458d(int arg_0, int arg_2)
{
    int si;
    int t1;
    int t2;

    si = 0;
    do {
        if (W_83C0 > 0x3e7) {
            W_83C0 = 0;
        }
        t1 = fn_c45d3(*(long *)((char *)&arg_0 + 0), W_83C0);
        t2 = far_cd551(*(long *)((char *)&arg_0 + 0));
        if (t2 < 0) {
            break;
        }
        W_83C0 = W_83C0 + 1;
        si = si + 1;
    } while (si < 128);
    return ((long)UNDEF << 16 | (unsigned)t2);
}
int far fn_c45d3(long p0, int p1) { return 0; }
