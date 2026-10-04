/* differs: 150 size 200, image 150; +1 image `enter 2, 0` CL `enter 4, 0`; 172 size 200, image 150; +1 image `enter 2, 0` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char BUF_SYSEX_RX[1];
extern unsigned char G_MIDI_IN_RING_RD;
extern char G_MIDI_IN_RING_WR;
extern char G_SYSEX_RX_ACTIVE;
extern unsigned char G_SYSEX_RX_LEN;
extern char P_8B9E[1];

int __near midi_sysex_handler(void)
{
	char loc_1;
	int ax;
	int ax2;
	int ax3;
	unsigned bx;

	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)G_MIDI_IN_RING_RD);
	if (G_MIDI_IN_RING_WR != (char)ax) {
		goto L1;
	}
	goto L2;
L1:
	bx = G_MIDI_IN_RING_RD;
	ax3 = ((char)(ax >> 8) << 8 | (unsigned char)P_8B9E[bx]);
	loc_1 = (char)ax3;
	G_MIDI_IN_RING_RD = (unsigned char)(G_MIDI_IN_RING_RD + 1);
	if ((loc_1 & -128) == 0) {
		goto L3;
	}
	if ((char)ax3 != -16) {
		goto L4;
	}
	G_SYSEX_RX_ACTIVE = (char)1;
	G_SYSEX_RX_LEN = (char)(bx >> 8);
	BUF_SYSEX_RX[0] = (char)ax3;
	G_SYSEX_RX_LEN = (unsigned char)(G_SYSEX_RX_LEN + 1);
	goto L5;
L3:
	if (G_SYSEX_RX_ACTIVE == 0) {
		goto L5;
	}
	ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)loc_1);
	BUF_SYSEX_RX[G_SYSEX_RX_LEN] = (char)ax3;
	G_SYSEX_RX_LEN = (unsigned char)(G_SYSEX_RX_LEN + 1);
	if (G_SYSEX_RX_LEN < 128) {
		goto L5;
	}
	ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)0);
	G_SYSEX_RX_ACTIVE = (char)ax3;
	G_SYSEX_RX_LEN = (char)ax3;
L5:
	ax = ((char)(ax3 >> 8) << 8 | (unsigned char)G_MIDI_IN_RING_RD);
	if (G_MIDI_IN_RING_WR != (char)ax) {
		goto L1;
	}
	goto L2;
L4:
	if (G_SYSEX_RX_ACTIVE == 0) {
		goto L2;
	}
	G_SYSEX_RX_ACTIVE = (char)0;
	BUF_SYSEX_RX[G_SYSEX_RX_LEN] = (char)-9;
	G_SYSEX_RX_LEN = (unsigned char)(G_SYSEX_RX_LEN + 1);
	return G_SYSEX_RX_LEN;
L2:
	return 0;
}
