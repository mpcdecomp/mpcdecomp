#include "mpc2k.h"

void __near dma_06E9A(void)
{
    int t1;
    int t2;

    if (SAMPLE_MONITOR == 0) {
        goto L1;
    }
    dma_field_write(21, (unsigned char far *)W_4FE6, 0x1ffe);
    if (G_REC_MODE != 2) {
        goto L2;
    }
    dma_field_write(23, (unsigned char far *)W_5012, 0x1ffe);
L2:
    outpw(136, (1 << 8 | (unsigned char)(inp(136) & 127)));
L1:
    return;
}
