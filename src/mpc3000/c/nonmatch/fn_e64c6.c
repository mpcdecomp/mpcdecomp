/* differs: 308 at +3, 63 bytes; 311 at +3, 63 bytes; 312 at +3, 63 bytes */
extern char B_8A94;
extern char B_8A95;
extern char B_8A96;
extern char B_8A97;
extern char TBL_8A93;
extern char TBL_A5CF[];
extern char TBL_A5D0[];
extern char TBL_A5D1[];
extern char TBL_A5D2[];
extern char TBL_A5D3[];

void far fn_e64c6(int arg_0)
{
    long t1;

    t1 = (long)(int)arg_0 * 5L;
    TBL_8A93 = TBL_A5CF[(int)t1];
    B_8A94 = TBL_A5D0[(int)t1];
    B_8A95 = TBL_A5D1[(int)t1];
    B_8A96 = TBL_A5D2[(int)t1];
    B_8A97 = TBL_A5D3[(int)t1];
    return;
}
