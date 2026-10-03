/* differs: 150 size 264, image 260; +24 image `mov al, byte ptr [0x9b3f]` CL `cmp byte ptr [0x9b3f], 0`; 172 size 264, image 260; +24 image `mov al, byte ptr [0x9d81]` CL `cmp byte ptr [0x9d81], 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SND_CURRENT {
    int f_0;
    int f_2;
};
extern int FP_SND_SECONDARY;
extern int G_ZONE_END;
extern int G_ZONE_START;
extern int PTR_DL_PROCESSING;
extern int PTR_DL_PROCESSING_SEG;
extern unsigned char P_3AE4[1];
extern struct g_SND_CURRENT SND_CURRENT;
extern unsigned char TBL_SOUND_NAMES[1];
extern char ZONE_EDIT_ACTION;
extern int __far __pascal disp_list_run();
extern long __far err_msg_report(void);
extern long __near __pascal main_handler_1(int, int, long, long);
extern void __far __pascal voice_buffer_init(long);
extern int __far __pascal voice_release_all_if(int, int);
extern long __near __pascal zone_action_delete(int, int, long, long);
extern long __near __pascal zone_action_insert_start(long, long, long);
extern long __near __pascal zone_action_new_sample(long, long, long, unsigned char far *);
extern long __near __pascal zone_action_reverse(int, int, long, long);
extern void __far __fastcall __loadds zone_edit_cancel(void);
extern long __far zone_range_clamp(void);

void __far __fastcall __loadds zone_edit_do_it(void)
{
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int si;
	int t1;
	long t2;
	long t3;
	int t4;
	int t5;

	si = 1;
	voice_release_all_if(SND_CURRENT.f_2, SND_CURRENT.f_0);
	t1 = disp_list_run(PTR_DL_PROCESSING_SEG, PTR_DL_PROCESSING);
	if (ZONE_EDIT_ACTION == 0) {
		goto L1;
	}
	ax2 = ZONE_EDIT_ACTION - 1;
	if (ax2 == 0) {
		goto L2;
	}
	if (ax2 == 1) {
		goto L3;
	}
	if (ax2 == 2) {
		goto L4;
	}
	if (ax2 != 3) {
		goto L5;
	}
	goto L6;
L5:
	goto L7;
L1:
	ax3 = (int)zone_action_new_sample(*(long *)((char *)&SND_CURRENT + 0), *(long *)((char *)&G_ZONE_START + 0), *(long *)((char *)&G_ZONE_END + 0), (unsigned char far *)TBL_SOUND_NAMES);
	goto L8;
L2:
	ax3 = (int)zone_action_insert_start(*(long *)((char *)&SND_CURRENT + 0), *(long *)((char *)&G_ZONE_START + 0), *(long *)((char *)&FP_SND_SECONDARY + 0));
	goto L8;
L3:
	si = (int)zone_action_delete(SND_CURRENT.f_2, SND_CURRENT.f_0, *(long *)((char *)&G_ZONE_START + 0), *(long *)((char *)&G_ZONE_END + 0));
	t2 = zone_range_clamp();
	goto L7;
L4:
	ax3 = (int)main_handler_1(SND_CURRENT.f_2, SND_CURRENT.f_0, *(long *)((char *)&G_ZONE_START + 0), *(long *)((char *)&G_ZONE_END + 0));
	goto L8;
L6:
	ax3 = (int)zone_action_reverse(SND_CURRENT.f_2, SND_CURRENT.f_0, *(long *)((char *)&G_ZONE_START + 0), *(long *)((char *)&G_ZONE_END + 0));
L8:
	si = ax3;
L7:
	if (si != 0) {
		goto L9;
	}
	t3 = err_msg_report();
L9:
	voice_buffer_init(*(long *)((char *)&SND_CURRENT + 0));
	disp_list_run((unsigned char far *)P_3AE4);
	zone_edit_cancel();
	return;
}
