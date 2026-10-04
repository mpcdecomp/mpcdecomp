/* differs: 150 size 136, image 108; +1 image `enter 4, 0` CL `enter 8, 0`; 172 size 136, image 4; +1 image `enter 4, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char far *SND_CURRENT;
extern long __far addr_calc_segment(int, int, int);
extern void __far __fastcall __loadds fit_to_length_cancel(void);

void __far __fastcall __loadds track_data_far(void)
{
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int dx;
	long t1;

	ax = *(int *)((char *)&SND_CURRENT + 0);
	loc_2 = *(int *)((char *)&SND_CURRENT + 2);
	ax2 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24);
	dx = (int)(((long)*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26) << 16 | (unsigned)ax2) - *(long far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20) >> 16);
	*(int far *)MK_FP(loc_2, ax + 32) = ax2 - *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20);
	*(int far *)MK_FP(loc_2, ax + 34) = dx;
	ax3 = *(int *)((char *)&SND_CURRENT + 0);
	loc_2 = *(int *)((char *)&SND_CURRENT + 2);
	t1 = addr_calc_segment(*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 32), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 34), 0);
	*(int far *)MK_FP(loc_2, ax3 + 50) = (int)t1;
	*(int far *)MK_FP(loc_2, ax3 + 52) = (int)(t1 >> 16);
	fit_to_length_cancel();
	return;
}
