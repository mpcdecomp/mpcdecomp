/* differs: 150 size 60, image 58; +1 image `enter 0xc, 0` CL `enter 0xa, 0`; 172 size 60, image 58; +1 image `enter 0xc, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __near __pascal smem_pool_insert(int, int, char, int, int);

int __far __pascal midi_status_process(int arg_6, int arg_4, int arg_2, long arg_0)
{
	int loc_c;
	char loc_a[6];
	char loc_4[4];
	int ax;

	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 15;
	arg_2 = (int)(arg_0 + 15L >> 16);
	loc_c = arg_4;
	*(int *)((char *)&loc_a + 0) = arg_6;
	ax = smem_pool_insert(*(int *)((char *)&loc_4 + 0), arg_2, (char)((char)*(int *)((char *)&arg_0 + 0) & -16), *(int *)((char *)&loc_a + 0), loc_c);
	if (ax != 130) {
		goto L1;
	}
	ax = -1;
L1:
	return ax;
}
