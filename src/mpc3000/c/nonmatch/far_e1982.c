/* differs: 308 at +C, 251 bytes; 311 at +C, 251 bytes; 312 at +C, 251 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_828A[];
extern char TBL_82EE[];
extern char TBL_8352[];

long far far_e1982(long arg_0, int arg_4)
{
    int loc_2;
    int loc_4;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx;
    int es;
    int es2;
    int es3;
    int p12;

    es = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es, (int)arg_0 + arg_4 + 0x10a) = (char)(TBL_82EE[arg_4] & 63);
    if ((TBL_82EE[arg_4] & 64) != 0) {
        *(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0) + arg_4 + 0x10a) = (char)-1;
    }
    es2 = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es2, (int)arg_0 + arg_4 + 0x16e) = (char)(TBL_8352[arg_4] & 63);
    if ((TBL_8352[arg_4] & 64) != 0) {
        *(char far *)MK_FP(es2, *(int *)((char *)&arg_0 + 0) + arg_4 + 0x16e) = (char)-1;
    }
    loc_4 = TBL_82EE[arg_4] & 128;
    ax = TBL_8352[arg_4] & 128;
    loc_2 = ax;
    if (loc_2 != 0) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)4);
    } else {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)0);
    }
    p12 = ax2;
    if (loc_4 != 0) {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)0);
    } else {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)2);
    }
    dx = ((char)(p12 >> 8) << 8 | (unsigned char)((char)p12 + (char)ax3));
    es3 = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es3, (int)arg_0 + arg_4 + 166) = (char)dx;
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)TBL_828A[arg_4]);
    *(char far *)MK_FP(es3, *(int *)((char *)&arg_0 + 0) + arg_4 + 0x1d2) = (char)ax4;
    *(char far *)MK_FP(es3, *(int *)((char *)&arg_0 + 0) + arg_4 + 0x236) = (char)100;
    return ((long)dx << 16 | (unsigned)ax4);
}
