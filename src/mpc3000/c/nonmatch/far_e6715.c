/* differs: 308 at +5, 281 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_8800;
extern unsigned char B_8803;
extern char B_8804;
extern unsigned char B_901B[];
extern char TBL_8A93[];
extern unsigned char TBL_A5CF[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern int W_9045;
extern unsigned char W_D5F3[];
extern long far far_deeab(void);
extern int far far_deee8(unsigned char far *, int);
extern int far far_e0031(unsigned char far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_e562e(void);
extern int far far_e5796(char);
extern long far far_e6fef(void);
extern long far far_eb6bd(char far *, void far *);
extern long far far_eb86b(long, unsigned char far *);

long far far_e6715(int arg_0)
{
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int di;
    char near *di2;
    int si;
    long t1;
    int t2;
    int t3;
    long t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    if (B_8800 == 0) {
        ax = (int)far_e6fef();
    }
    if (B_8803 >= 250) {
        B_8803 = (unsigned char)0;
    }
    B_8804 = *(char *)((char *)&arg_0 + 0);
    di = arg_0;
    t1 = (long)(int)(di - 1) * 0x1f4L;
    loc_2 = (unsigned char)TBL_A7AF[(int)t1];
    loc_4 = (unsigned char)TBL_A7B0[(int)t1];
    if (loc_4 != 0) {
        t3 = far_e0031((unsigned char far *)B_901B);
        B_8800 = (char)0;
        t4 = far_e51be((unsigned char far *)B_901B, loc_2, 1);
        B_8800 = (char)1;
        if (B_8803 != 0) {
            t5 = far_e5796(B_8803);
            loc_6 = t5;
            t6 = far_deee8((unsigned char far *)B_901B, t5);
        }
        si = 0;
        ax3 = (int)(unsigned)(TBL_A5CF + (di - 1) * 5);
        di2 = (char near *)ax3;
        do {
            ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)*di2);
            TBL_8A93[si] = (char)ax3;
            di2 = di2 + 1;
            si = si + 1;
        } while (si < 5);
        t7 = far_eb6bd((char far *)TBL_8A93, MK_FP(SEG_DATA, 0x7e5f));
        t8 = far_eb86b(*(long *)((char *)&W_9045 + 0), (unsigned char far *)W_D5F3);
    } else {
        t2 = far_e0031((unsigned char far *)B_901B);
        ax2 = far_deee8((unsigned char far *)B_901B, 1);
    }
    B_8800 = (char)1;
    t9 = far_deeab();
    return far_e562e();
}
