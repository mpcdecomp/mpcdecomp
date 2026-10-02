/* differs: 308 absent; 311 at +3, 285 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_cd5d8(unsigned int arg_0)
{
    int ax;
    int ax2;
    unsigned int dx;
    int dx2;
    int flags;
    int flags2;
    int si;

    if (arg_0 < 128) {
        ax = arg_0 * 36;
        si = ax;
        dx = 0xa283 /* SEG_A28F */;
        if (*(char far *)MK_FP(dx, ax + 0x4800) != 0) {
            ax2 = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4816);
            flags = ax2 - *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481e);
            if (!CC("<", flags) && (CC(">", flags) || (unsigned int)*(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4814) > (unsigned int)*(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481c))) {
                dx2 = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481c);
                *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4816) = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481e);
                *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4814) = dx2;
            }
            ax = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481a);
            dx = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4818);
            flags2 = ax - *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481e);
            if (!CC("<", flags2) && (CC(">", flags2) || dx > (unsigned int)*(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481c))) {
                ax = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481e);
                dx = *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481c);
                *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481a) = ax;
                *(int far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4818) = dx;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
