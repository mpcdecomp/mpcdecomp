/* differs: 150 size 218, image 122; +0 image `push bp` CL `enter 0x10, 0`; 172 size 218, image 122; +0 image `push bp` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_SAMPLE_BUF {
    int f_0;
    int f_2;
};
extern struct g_PTR_SAMPLE_BUF PTR_SAMPLE_BUF;
extern long __far __pascal sample_ptr_helper(int, int);
extern long __far smem_compact(void);
extern long __far __pascal smem_free(int);

long __far __pascal sample_validate_ptr(int arg_2, int arg_0)
{
	int ax;
	int bx;
	int bx2;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int es;
	int es2;
	long t1;
	long t2;
	long t3;

	t1 = sample_ptr_helper(arg_2, arg_0);
	ax = (int)t1;
	dx = (int)(t1 >> 16);
	if (ax == 0) {
		goto L1;
	}
	if ((unsigned int)*(int far *)MK_FP(arg_2, arg_0 + 48) >= 130) {
		goto L2;
	}
	t2 = smem_free(*(int far *)MK_FP(arg_2, arg_0 + 48));
L2:
	dx2 = *(int far *)MK_FP(arg_2, arg_0 + 42);
	bx = (int)*(long far *)MK_FP(arg_2, arg_0 + 44);
	es = (int)(*(long far *)MK_FP(arg_2, arg_0 + 44) >> 16);
	*(int far *)MK_FP(es, bx + 40) = *(int far *)MK_FP(arg_2, arg_0 + 40);
	*(int far *)MK_FP(es, bx + 42) = dx2;
	dx3 = *(int far *)MK_FP(arg_2, arg_0 + 46);
	bx2 = (int)*(long far *)MK_FP(arg_2, arg_0 + 40);
	es2 = (int)(*(long far *)MK_FP(arg_2, arg_0 + 40) >> 16);
	*(int far *)MK_FP(es2, bx2 + 44) = *(int far *)MK_FP(arg_2, arg_0 + 44);
	*(int far *)MK_FP(es2, bx2 + 46) = dx3;
	dx4 = PTR_SAMPLE_BUF.f_2;
	*(int far *)MK_FP(arg_2, arg_0 + 40) = PTR_SAMPLE_BUF.f_0;
	*(int far *)MK_FP(arg_2, arg_0 + 42) = dx4;
	PTR_SAMPLE_BUF.f_0 = arg_0;
	PTR_SAMPLE_BUF.f_2 = arg_2;
	t3 = smem_compact();
	ax = (int)t3;
	dx = (int)(t3 >> 16);
L1:
	return ((long)dx << 16 | (unsigned)ax);
}
