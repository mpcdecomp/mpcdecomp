/* differs: 150 +1 image `enter 8, 0` CL `enter 4, 0`; 172 +1 image `enter 8, 0` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far __pascal flash_write_words(int, int, int far *, int);
extern void __far __pascal smem_read_words(int, int, int far *, int);

void __far __pascal mem_op_wrapper_3(int arg_4, int arg_2, int arg_0)
{
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	int dx;
	long t1;
	int t2;

	arg_2 = arg_2 & -0x8000;
	loc_2 = 113;
	dx = arg_4;
	loc_8 = ((char)(arg_2 >> 8) << 8 | (unsigned char)((char)arg_2 | 2));
	loc_6 = dx;
	t1 = flash_write_words(loc_6, loc_8, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 1);
	smem_read_words(loc_6, loc_8, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 1);
	*(int far *)MK_FP(SEG_STACK, arg_0) = loc_4;
	return;
}
