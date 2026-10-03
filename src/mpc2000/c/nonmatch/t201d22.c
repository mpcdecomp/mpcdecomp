/* differs: 150 size 160, image 148; +0 image `push bp` CL `enter 2, 0`; 172 size 160, image 148; +0 image `push bp` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_9D1C;
extern char MIDI_LOCAL_MODE;
extern char PGM_CHANGE_RX;
extern long __far cmd_far_stub2(void);
extern void __far __pascal pad_event_dispatch(unsigned char far *);
extern void __far __pascal smem_addr_data_ctrl(int);
extern void __far __pascal smem_addr_data_ctrl2(char, char);
extern long __far __pascal smem_addr_data_status(unsigned char far *);
extern void __far __pascal voice_param_proc(int, int, char);

void __far sound_event_dispatch(unsigned char arg_0, unsigned char arg_1, char arg_2)
{
	int ax;
	int ax2;
	int t1;
	int t2;
	int t3;
	long t4;
	int t5;
	long t6;

	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_0) & 240;
	if (ax == 0) {
		goto L1;
	}
	if (ax == 128) {
		goto L2;
	}
	if (ax == 144) {
		goto L3;
	}
	if (ax == 176) {
		goto L4;
	}
	if (ax == 192) {
		goto L5;
	}
	return;
L1:
	if (MIDI_LOCAL_MODE == 0) {
		goto L6;
	}
	voice_param_proc(arg_0, arg_1, arg_2);
	t6 = cmd_far_stub2();
	return;
L3:
	if (arg_2 == 0) {
		goto L2;
	}
	pad_event_dispatch((unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0));
	return;
L4:
	smem_addr_data_ctrl2(arg_1, arg_2);
	return;
L5:
	if ((B_9D1C & 1) != 0) {
		goto L6;
	}
	if (MIDI_LOCAL_MODE == 0) {
		goto L6;
	}
	if (PGM_CHANGE_RX == 0) {
		goto L6;
	}
	smem_addr_data_ctrl(arg_1);
	return;
L2:
	t4 = smem_addr_data_status((unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_0));
L6:
	return;
}
