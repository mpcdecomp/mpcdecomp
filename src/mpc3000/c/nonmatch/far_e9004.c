/* differs: 308 at +1B, 38 bytes; 311 at +1B, 37 bytes; 312 at +1B, 38 bytes */
#define UNDEF 0
extern int W_F760;
extern long far far_cab20(int);
extern void far far_da3fa(int);
extern int far fn_e9041(int);

long far far_e9004(int arg_0)
{
    int loc_2;
    int ax;
    int t1;
    long t2;
    int t3;

    far_da3fa(1);
    ax = fn_e9041(arg_0);
    loc_2 = ax;
    if (ax != 0) {
        t2 = far_cab20(W_F760);
    }
    far_da3fa(0);
    return ((long)UNDEF << 16 | (unsigned)loc_2);
}
int far fn_e9041(int p0) { return 0; }
