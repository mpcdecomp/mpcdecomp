/* differs: 308 at +3, 131 bytes; 311 at +3, 131 bytes; 312 at +3, 131 bytes */
extern char B_E56B;
extern char B_E56C;
extern char B_E56D;
extern char B_E56E;
extern char TBL_A5CF[];
extern char TBL_A5D0[];
extern char TBL_A5D1[];
extern char TBL_A5D2[];
extern char TBL_A5D3[];
extern char TBL_E56A;

int far fn_b48a4(int arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    long t1;

    t1 = (long)(int)arg_0 * 5L;
    ax = ((char)((int)t1 >> 8) << 8 | (unsigned char)TBL_A5CF[(int)t1]);
    TBL_E56A = (char)ax;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A5D0[(int)t1]);
    B_E56B = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_A5D1[(int)t1]);
    B_E56C = (char)ax3;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)TBL_A5D2[(int)t1]);
    B_E56D = (char)ax4;
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)TBL_A5D3[(int)t1]);
    B_E56E = (char)ax5;
    return ax5;
}
