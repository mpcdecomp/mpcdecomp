/* differs: 308 at +3, 161 bytes; 311 at +3, 161 bytes; 312 at +3, 161 bytes */
struct g_TBL_E223 {
    int f_0;
};
struct g_TBL_E263 {
    int f_0;
};
struct g_TBL_E2A3 {
    int f_0;
};
extern struct g_TBL_E223 TBL_E223;
extern struct g_TBL_E263 TBL_E263;
extern struct g_TBL_E2A3 TBL_E2A3;
extern char TBL_E3AC[];
extern long far far_fb88f(void);
extern long far far_fb8cd(void);

long far far_cde12(int arg_0)
{
    int ax;
    int bx;
    int bx2;
    long t1;

    t1 = far_fb88f();
    outpw(96, arg_0 + 0x400);
    outpw(98, -0x100);
    outpw(100, -0x8000);
    outpw(96, arg_0 + 0x300);
    outpw(98, 0);
    ax = inpw(100) & 0x3fc0;
    outpw(100, ax);
    outpw(98, 0);
    outpw(100, ax);
    outpw(96, arg_0 + 0x600);
    outpw(98, 0);
    outpw(100, 0x7ff0);
    bx = arg_0;
    TBL_E3AC[bx] = (char)-1;
    bx2 = bx << 1;
    *(int *)((char *)&TBL_E223 + 0 + bx2) = 0;
    *(int *)((char *)&TBL_E263 + 0 + bx2) = 0;
    *(int *)((char *)&TBL_E2A3 + 0 + bx2) = 0;
    return far_fb8cd();
}
