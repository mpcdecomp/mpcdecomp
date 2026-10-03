/* differs: 172 size 36, image 120; +24 image `push ds` CL `retf` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char P_2608[1];
extern int __far __pascal disp_list_run(unsigned char far *);
extern void __far __pascal draw_unsigned_value(int, int, long, int);
extern int __far sample_unused_count(void);

void __far __fastcall __loadds purge_paint(void)
{
	int ax;
	int t1;
	int t2;

	disp_list_run((unsigned char far *)P_2608);
	t1 = sample_unused_count();
	draw_unsigned_value(25, 37, (long)(int)t1, 3);
	return;
}
