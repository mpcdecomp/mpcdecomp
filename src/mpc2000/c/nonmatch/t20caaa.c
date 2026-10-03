/* differs: 150 size 342, image 236; +1 image `enter 0x6a, 0` CL `enter 0xd2, 0`; 172 size 342, image 236; +1 image `enter 0x6a, 0` CL `enter 0xd2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ERRNO;
extern void __far __pascal _memcpy_5(char far *, char far *);
extern long __far __pascal int40_disk_wrapper(long);
extern int __far __pascal midi_status_process(long, long);
extern long __far __pascal sample_pool_add(int, int, int, int, int, void far *, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
extern long __far __pascal smem_block_skip(long);
extern void __far __pascal smem_read_words(int, int, char far *, int);

long __far __pascal memcpy_far_handler(int arg_2, int arg_0)
{
	char loc_a4[58];
	char loc_6a[48];
	char loc_3a[6];
	char loc_34[40];
	int loc_c;
	int loc_a;
	char loc_8;
	char loc_7;
	int loc_6;
	long loc_4;
	int loc_2;
	int p114;
	int p116;
	int p118;
	int p120;
	int p126;
	int p128;
	int p130;
	int p132;
	int p134;
	int p136;
	int p138;
	int p140;
	int p142;
	int p144;
	int p146;
	int p148;
	int p150;
	int p152;
	int p154;
	int p156;
	int p158;
	int p160;
	int p162;
	int p164;
	int p166;
	char far *t1;
	int t2;
	int t3;
	int t4;
	long t5;
	int t6;
	int t7;

	t1 = int40_disk_wrapper(*(long *)((char *)&arg_0 + 0));
	*(int *)((char *)&loc_4 + 0) = (int)FP_OFF(t1);
	loc_2 = (int)FP_SEG(t1);
	if (((int)FP_SEG(t1) | (int)FP_OFF(t1)) != 0) {
		goto L1;
	}
	G_ERRNO = 12;
	goto L2;
L1:
	smem_read_words(loc_2, (int)FP_OFF(t1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 1);
	if (loc_8 == -127) {
		goto L3;
	}
	goto L4;
L3:
	if (loc_7 == 4) {
		goto L5;
	}
	goto L4;
L5:
	smem_read_words((int)(loc_4 + 2L >> 16), *(int *)((char *)&loc_4 + 0) + 2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_34), 20);
	_memcpy_5((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_34));
	t5 = smem_block_skip(loc_4);
	*(int *)((char *)&loc_4 + 0) = (int)t5;
	loc_2 = (int)(t5 >> 16);
	smem_read_words((int)(t5 - 2L >> 16), (int)t5 - 2, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 2);
	p114 = loc_2;
	p116 = *(int *)((char *)&loc_4 + 0);
	p118 = loc_a;
	p120 = loc_c;
	t7 = midi_status_process(((long)p114 << 16 | (unsigned)p116), ((long)p118 << 16 | (unsigned)p120));
	loc_6 = t7;
	if (t7 != -1) {
		goto L6;
	}
	G_ERRNO = 5;
	goto L2;
L6:
	*(int *)((char *)&loc_3a + 0) = loc_6;
	__movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6a), 54);
	return sample_pool_add(p114, p116, p118, p120, 2, MK_FP(0x0b50, p126), p128, p130, p132, p134, p136, p138, p140, p142, p144, p146, p148, p150, p152, p154, p156, p158, p160, p162, p164, p166);
L4:
	G_ERRNO = 7;
L2:
	return 0L;
}
