/* differs: 150 size 168, image 334; +1 image `enter 0x18, 0` CL `enter 0x1e, 0`; 172 size 168, image 334; +1 image `enter 0x18, 0` CL `enter 0x1e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define UNDEF 0
extern unsigned char B_9D5A;
extern unsigned char MPC_SECONDARY_state_word;
extern unsigned char MPC_STATE_cache_lo;
extern unsigned char MPC_STATE_ref_hi;
extern unsigned char MPC_STATE_ref_lo;
extern unsigned char PGM_TABLE[1];
extern unsigned char P_8D44[1];
extern unsigned char SMEM_POOL_LEN;
extern unsigned char SMEM_POOL_LEN_HI;
extern unsigned char TBL_SOUND_NAMES[1];
extern int W_9D5B;
extern int W_9D5D;
extern long __far far_078E4();
extern void __far far_07900();

int __far sample_index_rebuild(void)
{
    int loc_18;
    char loc_16[10];
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int bx;
    int bx2;
    int bx3;
    int cx;
    unsigned int cx2;
    int cx3;
    int cx4;
    int di;
    int di2;
    int di3;
    int di4;
    int ds;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int si;
    int si2;
    int si3;
    int si4;
    int t1;
    long t2;
    int t3;

    __stos2((unsigned char far *)TBL_SOUND_NAMES, 0, 0x880);
    __stos2((unsigned char far *)P_8D44, 0, 0x200);
    far_07900();
    t2 = far_078E4();
    cx = UNDEF;
    dx = (int)(t2 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t2;
    loc_2 = dx;
    ax = 0;
    W_9D5D = ax;
    W_9D5B = ax;
    loc_c = UNDEF;
    if (UNDEF <= 0) {
        goto L1;
    }
    loc_6 = (int)(unsigned)P_8D44;
    loc_8 = (int)(unsigned)TBL_SOUND_NAMES;
    loc_a = UNDEF;
    ds = SEG_DATA;
L2:
    di = (int)loc_4;
    es = (int)(loc_4 >> 16);
    t3 = __repne_scas1(MK_FP(es, di), 0, -1);
    cx2 = ~t3;
    di2 = di + (-1 - t3) - cx2;
    cx3 = cx2 >> 1;
    __movs2(MK_FP(ds, di2), MK_FP(es, di2), cx3 * 2);
    __movs1(MK_FP(ds, di2 + cx3 * 2), MK_FP(es, di2 + cx3 * 2), cx2 & 1);
    ds = ds;
    ax = *(int *)((char *)&loc_4 + 0);
    bx = loc_6;
    dx = loc_2;
    *(int far *)MK_FP(ds, bx) = ax;
    *(int far *)MK_FP(ds, bx + 2) = dx;
    si = *(int far *)MK_FP(dx, (unsigned)&MPC_STATE_cache_lo + ax);
    si2 = ((si << 2) + si) * 2;
    cx4 = *(int far *)MK_FP(ds, (unsigned)&SMEM_POOL_LEN + si2);
    di3 = *(int far *)MK_FP(ds, (unsigned)&SMEM_POOL_LEN_HI + si2);
    *(int far *)MK_FP(ds, (unsigned)&W_9D5B) = *(int far *)MK_FP(ds, (unsigned)&W_9D5B) + cx4;
    *(int far *)MK_FP(ds, (unsigned)&W_9D5D) = (int)(*(long far *)MK_FP(ds, (unsigned)&W_9D5B) + ((long)di3 << 16 | (unsigned)cx4) >> 16);
    loc_6 = loc_6 + 4;
    loc_8 = loc_8 + 17;
    cx = *(int far *)MK_FP(dx, (unsigned)&MPC_STATE_ref_lo + ax);
    si3 = *(int far *)MK_FP(dx, (unsigned)&MPC_STATE_ref_hi + ax);
    *(int *)((char *)&loc_4 + 0) = cx;
    loc_2 = si3;
    loc_a = loc_a - 1;
    if (loc_a != 1) {
        goto L2;
    }
L3:
    *(char far *)MK_FP(ds, (unsigned)&B_9D5A) = (char)0;
    bx2 = (int)(unsigned)PGM_TABLE;
    loc_a = 24;
L4:
    si4 = (int)*(long far *)MK_FP(ds, bx2);
    es2 = (int)(*(long far *)MK_FP(ds, bx2) >> 16);
    if ((unsigned int)*(int far *)MK_FP(es2, si4) <= 2) {
        goto L5;
    }
    loc_8 = bx2;
    *(char far *)MK_FP(ds, (unsigned)&B_9D5A) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_9D5A) + 1);
    *(int *)((char *)&loc_4 + 0) = si4 + 34;
    loc_2 = es2;
    loc_6 = 64;
    di4 = si4 + 34;
L6:
    *(char far *)MK_FP(loc_2, di4) = (char)-1;
    es3 = loc_2;
    ax = *(int far *)MK_FP(es3, di4 - 4);
    dx2 = *(int far *)MK_FP(es3, (unsigned)&MPC_SECONDARY_state_word + -4 + di4);
    loc_18 = ax;
    *(int *)((char *)&loc_16 + 0) = dx2;
    dx = dx2 | ax;
    if (dx == 0) {
        goto L7;
    }
    cx = 0;
    if (loc_c <= cx) {
        goto L7;
    }
    bx3 = (int)(unsigned)P_8D44;
    *(int *)((char *)&loc_4 + 0) = di4;
L8:
    ax = *(int far *)MK_FP(ds, bx3);
    dx = *(int far *)MK_FP(ds, bx3 + 2);
    if (loc_18 != ax) {
        goto L9;
    }
    if (*(int *)((char *)&loc_16 + 0) == dx) {
        goto L10;
    }
L9:
    bx3 = bx3 + 4;
    cx = cx + 1;
    if (loc_c > cx) {
        goto L8;
    }
    goto L7;
L10:
    *(char far *)MK_FP(loc_2, di4) = (char)cx;
L7:
    di4 = di4 + 29;
    loc_6 = loc_6 - 1;
    if (loc_6 != 1) {
        goto L6;
    }
    bx2 = loc_8;
L5:
    bx2 = bx2 + 4;
    loc_a = loc_a - 1;
    if (loc_a == 1) {
        goto L11;
    }
    goto L4;
L11:
    return loc_c;
L1:
    ds = SEG_DATA;
    goto L3;
}
