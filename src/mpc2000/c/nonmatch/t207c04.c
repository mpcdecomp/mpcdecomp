/* differs: 150 size 50, image 46; +0 image `push ds` CL `push si`; 172 size 50, image 46; +0 image `push ds` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char far *SND_CURRENT;
extern long __far __pascal lcd_set_cursor(int, int);
extern int __far __pascal voice_release_all_if(int, int);

void __far __fastcall __loadds snd_window_pad_key(int ax)
{
	int t1;
	long t2;

	if ((char)ax != 0) {
		goto L1;
	}
	if (*(char far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 36) == (char)ax) {
		goto L2;
	}
	t1 = voice_release_all_if((int)(*(long *)((char *)&SND_CURRENT + 0) >> 16), (int)*(long *)((char *)&SND_CURRENT + 0));
	return;
L1:
	t2 = lcd_set_cursor(*(int *)((char *)&SND_CURRENT + 2), *(int *)((char *)&SND_CURRENT + 0));
L2:
	return;
}
