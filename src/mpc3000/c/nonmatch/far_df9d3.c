/* differs: 308 at +6, 219 bytes; 311 at +6, 217 bytes; 312 at +6, 217 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A5BC {
    char f_0;
};
extern char B_8800;
extern unsigned char B_8804;
extern char B_901B;
extern char B_901C;
extern struct g_TBL_A5BC TBL_A5BC;
extern char TBL_A79A[];
extern int W_87FE;
extern int W_9041;
extern int W_9043;
extern int W_904B;
extern int W_904D;
extern int W_9053;
extern unsigned char W_D5F3[];
extern int far far_deee8(char far *, int);
extern long far far_e5612(int, int);
extern long far far_e562e(void);
extern int far far_ea926(int);
extern int far far_eadf4(char far *, int, int, char far *);
extern long far far_eb86b(long, unsigned char far *);

void far far_df9d3(int arg_0, int arg_2)
{
    char loc_4[4];
    int ax;
    int ax2;
    int dx;
    int dx2;
    int dx3;
    int t1;
    int t2;
    long t3;
    int t4;
    long t5;
    long t6;

    if (B_901B >= 0) {
        if (B_8800 == 0 || *(char *)((char *)&TBL_A5BC + 0 + B_8804 * 0x1f4) != 0) {
            t1 = far_eadf4((char far *)&B_901B, arg_0, arg_2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4));
            W_9053 = 0;
            dx = (int)(far_e5612(*(int *)((char *)&loc_4 + 0), *(int *)((char *)&loc_4 + 2)) >> 16);
            if (B_8800 != 0) {
                if (W_9053 > W_87FE && TBL_A79A[B_8804] != 0) {
                    t2 = far_deee8((char far *)&B_901B, 1);
                    t3 = far_e562e();
                }
            } else if (W_9053 > W_904B) {
                if ((B_901C & 1) != 0) {
                    t4 = far_deee8((char far *)&B_901B, W_904D);
                    t5 = far_e562e();
                } else {
                    dx2 = W_9041;
                    arg_2 = W_9043;
                    arg_0 = dx2;
                }
            }
            ax = arg_2;
            dx3 = arg_0;
            W_9043 = ax;
            W_9041 = dx3;
            t6 = far_eb86b(((long)ax << 16 | (unsigned)dx3), (unsigned char far *)W_D5F3);
            ax2 = far_ea926(0);
        }
    }
    return;
}
