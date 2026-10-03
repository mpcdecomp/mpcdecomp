/* differs: 150 size 280, image 190; +1 image `enter 4, 0` CL `enter 0x14, 0`; 172 size 280, image 190; +1 image `enter 4, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_SAMPLE_BUF {
    long f_0;
};
extern struct g_PTR_SAMPLE_BUF PTR_SAMPLE_BUF;
extern char far *PTR_SAMPLE_DATA;

long __far __pascal sample_pool_add(int arg_0)
{
	int es4;
	int es3;
	int es2;
	int es;
	int dx3;
	int dx2;
	int dx;
	int bx4;
	int bx3;
	int bx2;
	int bx;
	int loc_2;
	int loc_4;

	if (*(long *)((char *)&PTR_SAMPLE_BUF + 0) == 0) {
		return 0L;
	}
	bx = (int)*(long *)((char *)&PTR_SAMPLE_DATA + 0);
	es = (int)(*(long *)((char *)&PTR_SAMPLE_DATA + 0) >> 16);
	dx = *(int far *)MK_FP(es, bx + 42);
	loc_4 = *(int far *)MK_FP(es, bx + 40);
	__movs2(MK_FP(es, bx), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0), 54);
	bx2 = *(int *)((char *)&PTR_SAMPLE_DATA + 0);
	*(int far *)MK_FP(es, bx2 + 40) = loc_4;
	*(int far *)MK_FP(es, bx2 + 42) = dx;
	es2 = (int)(PTR_SAMPLE_BUF.f_0 >> 16);
	loc_4 = (int)PTR_SAMPLE_BUF.f_0;
	loc_2 = es2;
	dx2 = *(int far *)MK_FP(es2, loc_4 + 42);
	*(int *)((char *)&PTR_SAMPLE_BUF + 0) = *(int far *)MK_FP(es2, loc_4 + 40);
	*(int *)((char *)&PTR_SAMPLE_BUF + 2) = dx2;
	dx3 = *(int *)((char *)&PTR_SAMPLE_DATA + 2);
	*(int far *)MK_FP(es2, loc_4 + 40) = *(int *)((char *)&PTR_SAMPLE_DATA + 0);
	*(int far *)MK_FP(es2, loc_4 + 42) = dx3;
	*(int far *)MK_FP(es2, loc_4 + 46) = 0;
	*(int far *)MK_FP(es2, loc_4 + 44) = 0;
	bx3 = (int)*(long *)((char *)&PTR_SAMPLE_DATA + 0);
	es3 = (int)(*(long *)((char *)&PTR_SAMPLE_DATA + 0) >> 16);
	*(int far *)MK_FP(es3, bx3 + 44) = loc_4;
	*(int far *)MK_FP(es3, bx3 + 46) = loc_2;
	*(int *)((char *)&PTR_SAMPLE_DATA + 0) = loc_4;
	*(int *)((char *)&PTR_SAMPLE_DATA + 2) = loc_2;
	*(char far *)MK_FP(loc_2, loc_4) = (char)0;
	bx4 = (int)*(long *)((char *)&PTR_SAMPLE_DATA + 0);
	es4 = (int)(*(long *)((char *)&PTR_SAMPLE_DATA + 0) >> 16);
	*(int far *)MK_FP(es4, bx4 + 30) = 0;
	*(int far *)MK_FP(es4, bx4 + 28) = 0;
	return *(long far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
}
