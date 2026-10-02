/* differs: 308 at +1C, 38 bytes; 311 at +1C, 38 bytes; 312 at +1C, 38 bytes */
extern char B_7B8E;
extern char B_D4B4;
extern char B_D5DD;
extern char B_D5DE;
extern char TBL_83F3[];
extern long far fn_b0829(int, int);
long far fn_b0829(int p0, int p1) { return 0; }

int far far_b130a(char arg_0)
{
    int ax;
    int si;

    B_7B8E = arg_0;
    ax = (int)fn_b0829(B_D5DE, B_D5DD);
    si = ax;
    if (ax >= 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)B_7B8E);
        TBL_83F3[si] = (char)ax;
        B_D4B4 = (char)1;
    }
    return ax;
}
