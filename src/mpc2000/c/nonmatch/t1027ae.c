/* differs: 150 size 254, image 248; +1 image `enter 0x16, 0` CL `enter 0x1c, 0`; 172 size 254, image 248; +1 image `enter 0x16, 0` CL `enter 0x1c, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __near __pascal buffer_init(int, int, int, int);
extern long __far __pascal flash_write_words(int, int, int, int, int);
extern void __far __pascal smem_read_words(int, int, int, int, int);

void __near __pascal smem_block_init(int arg_8, int arg_6, int arg_4, int arg_2, int arg_0)
{
	int t5;
	int t4;
	int t3;
	long t2;
	int t1;
	int si;
	int p30;
	int ds;
	int ax;
	int loc_2;
	long loc_4;
	int loc_6;
	int loc_8;
	int loc_a;
	char loc_10[6];
	long loc_12;
	int loc_14;
	long loc_16;

	*(int *)((char *)&loc_12 + 0) = arg_0 * 2;
	*(int *)((char *)&loc_10 + 0) = 0x7000;
	si = 0;
	loc_8 = arg_0;
	loc_a = arg_2;
	*(int *)((char *)&loc_4 + 0) = arg_6;
	loc_2 = arg_8;
	*(int *)((char *)&loc_16 + 0) = 0;
	loc_14 = arg_4;
L1:
	buffer_init(0x7000, 0, si, arg_0);
	si = UNDEF;
	t2 = flash_write_words(loc_2, *(int *)((char *)&loc_4 + 0), 0x7000, 0, arg_0);
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + *(int *)((char *)&loc_16 + 0);
	loc_2 = (int)(loc_4 + loc_16 >> 16);
	loc_a = loc_a - 1;
	if (loc_a != 1) {
		goto L1;
	}
	loc_6 = 0;
	loc_8 = arg_0;
	loc_a = arg_2;
	*(int *)((char *)&loc_4 + 0) = arg_6;
	loc_2 = arg_8;
	ds = SEG_DATA;
L2:
	buffer_init(0x7000, 0, loc_6, loc_8);
	loc_6 = UNDEF;
	smem_read_words(loc_2, *(int *)((char *)&loc_4 + 0), *(int *)((char *)&loc_10 + 0), *(int *)((char *)&loc_12 + 0), loc_8);
	ax = 0;
	p30 = ds;
	t5 = __repe_cmps1((int)((long)0x7000 << 16 | (unsigned)ax), (int)loc_12, loc_8 * 2);
	if (CC("==", UNDEF)) {
		goto L3;
	}
	ax = 0 - 0 - CC("<u", UNDEF) + 1;
L3:
	ds = p30;
	if (ax != 0) {
		goto L4;
	}
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0);
	loc_2 = loc_2 + arg_4;
	loc_a = loc_a - 1;
	if (loc_a != 1) {
		goto L2;
	}
	goto L5;
L4:
	return;
L5:
	return;
}
