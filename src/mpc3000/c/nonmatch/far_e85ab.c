/* differs: 308 at +1E, 38 bytes; 311 at +1E, 37 bytes; 312 at +1E, 38 bytes */
#define UNDEF 0
extern int W_F75E;
extern long far far_cab20(int);
extern void far far_da3fa(int);
extern int far fn_e85eb(int, int);

long far far_e85ab(int arg_0, int arg_2)
{
    int loc_2;
    int ax;
    int t1;
    long t2;
    int t3;

    far_da3fa(1);
    ax = fn_e85eb(arg_0, arg_2);
    loc_2 = ax;
    if (ax != 0) {
        t2 = far_cab20(W_F75E);
    }
    far_da3fa(0);
    return ((long)UNDEF << 16 | (unsigned)loc_2);
}
int far fn_e85eb(int p0, int p1) { return 0; }
