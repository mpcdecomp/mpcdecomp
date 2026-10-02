/* differs: 308 at +3, 345 bytes; 311 at +3, 345 bytes; 312 at +3, 345 bytes */
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
extern char TBL_D65B[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern long far fn_cdab4(int);

long far fn_cd9e4(int arg_0, int arg_2, int arg_4, int arg_6, int arg_8)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int cx;
    int cx2;
    unsigned int dx;
    int dx2;
    int dx3;
    unsigned int dx4;
    int dx5;
    int si;
    int si2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    cx = 0;
    si = 0;
    while (cx != arg_8) {
        if (TBL_D65B[si] != -1) {
            goto L1;
        }
        dx4 = *(int *)((char *)&TBL_D65D + 0 + si);
        dx = dx4 + *(int *)((char *)&TBL_D661 + 0 + si);
        ax = *(int *)((char *)&TBL_D65F + 0 + si) + *(int *)((char *)&TBL_D663 + 0 + si) + (dx < dx4);
        if (ax == arg_2 && dx == arg_0) {
            goto L2;
        }
L1:
        si = si + 10;
        cx = cx + 1;
    }
    cx2 = cx + 1;
    t1 = (long)(int)cx2 * 10L;
    ax2 = (int)t1;
    dx2 = (int)(t1 >> 16);
    si2 = ax2;
    while (si2 != 0xbb8) {
        if (TBL_D65B[si2] != -1) {
            goto L3;
        }
        ax2 = *(int *)((char *)&TBL_D65F + 0 + si2);
        dx2 = *(int *)((char *)&TBL_D65D + 0 + si2);
        if (ax2 == arg_6 && dx2 == arg_4) {
            goto L4;
        }
L3:
        si2 = si2 + 10;
        cx2 = cx2 + 1;
    }
    return ((long)dx2 << 16 | (unsigned)ax2);
L2:
    t4 = (long)(int)arg_8 * 10L;
    ax4 = *(int *)((char *)&TBL_D663 + 0 + (int)t4);
    dx5 = *(int *)((char *)&TBL_D661 + 0 + (int)t4);
    t5 = (long)(int)cx * 10L;
    *(int *)((char *)&TBL_D661 + 0 + (int)t5) = *(int *)((char *)&TBL_D661 + 0 + (int)t5) + dx5;
    *(int *)((char *)&TBL_D663 + 0 + (int)t5) = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + (int)t5) << 16 | (unsigned)*(int *)((char *)&TBL_D661 + 0 + (int)t5)) + ((long)ax4 << 16 | (unsigned)dx5) >> 16);
    return fn_cdab4(arg_8);
L4:
    t2 = (long)(int)cx2 * 10L;
    ax3 = *(int *)((char *)&TBL_D663 + 0 + (int)t2);
    dx3 = *(int *)((char *)&TBL_D661 + 0 + (int)t2);
    t3 = (long)(int)arg_8 * 10L;
    *(int *)((char *)&TBL_D661 + 0 + (int)t3) = *(int *)((char *)&TBL_D661 + 0 + (int)t3) + dx3;
    *(int *)((char *)&TBL_D663 + 0 + (int)t3) = (int)(((long)*(int *)((char *)&TBL_D663 + 0 + (int)t3) << 16 | (unsigned)*(int *)((char *)&TBL_D661 + 0 + (int)t3)) + ((long)ax3 << 16 | (unsigned)dx3) >> 16);
    return fn_cdab4(cx2);
}
long far fn_cdab4(int p0) { return 0; }
