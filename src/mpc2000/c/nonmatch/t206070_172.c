/* differs: 172 size 166, image 152; +1 image `enter 0x1a, 0` CL `enter 0x1c, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char PGM_TABLE[1];
extern long __far __pascal smem_addr_dma_read(char far *);
extern long __far __pascal smem_addr_dma_read2(char far *);
extern long __far __pascal smem_addr_dma_read3(int, int);

void __far sample_gc(void)
{
	long loc_1a;
	int loc_18;
	char loc_16[6];
	int loc_10;
	int loc_e;
	int loc_c;
	int loc_a;
	char loc_8[4];
	int loc_4;
	int loc_2;
	int ax;
	long __near *bx;
	int bx2;
	int cx;
	int di;
	int dx;
	int dx2;
	int es;
	int si;
	long t1;

	bx = (long __near *)PGM_TABLE;
	loc_c = 24;
L1:
	si = (int)*bx;
	es = (int)(*bx >> 16);
	di = si;
	loc_e = es;
	if ((unsigned int)*(int far *)MK_FP(es, si) <= 2) {
		goto L2;
	}
	loc_a = (int)(unsigned)bx;
	loc_4 = di + 30;
	loc_2 = es;
	*(int *)((char *)&loc_8 + 0) = 64;
	loc_10 = si;
	bx2 = di + 30;
	cx = *(int *)((char *)&loc_8 + 0);
L3:
	ax = *(int far *)MK_FP(loc_2, bx2);
	dx2 = *(int far *)MK_FP(loc_2, bx2 + 2);
	*(int *)((char *)&loc_1a + 0) = ax;
	loc_18 = dx2;
	dx = loc_18 | ax;
	if (dx == 0) {
		goto L4;
	}
	si = (int)loc_1a;
	*(char far *)MK_FP((int)(loc_1a >> 16), si) = (char)(*(char far *)MK_FP((int)(loc_1a >> 16), si) | -128);
L4:
	bx2 = bx2 + 29;
	cx = cx - 1;
	if (cx != 0) {
		goto L3;
	}
	bx = (long __near *)loc_a;
L2:
	bx = bx + 1;
	loc_c = loc_c - 1;
	if (loc_c != 1) {
		goto L1;
	}
	if ((int)smem_addr_dma_read((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16)) == 0) {
		goto L5;
	}
L6:
	if ((*(char far *)((char far *)*(long *)((char *)&loc_16 + 0)) & -128) == 0) {
		goto L7;
	}
	*(char far *)((char far *)*(long *)((char *)&loc_16 + 0)) = (char)(*(char far *)((char far *)*(long *)((char *)&loc_16 + 0)) & 127);
	goto L8;
L7:
	t1 = smem_addr_dma_read3((int)(*(long *)((char *)&loc_16 + 0) >> 16), (int)*(long *)((char *)&loc_16 + 0));
L8:
	if ((int)smem_addr_dma_read2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16)) != 0) {
		goto L6;
	}
L5:
	return;
}
