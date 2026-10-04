/* differs: XL v1.20 +E, 142 bytes */
extern char C1_B_095F0;
extern char C1_B_0D777;
extern unsigned char C2_B_PAD_DRUM;
extern char EP_L_42156_OFF[1];
extern char EP_L_42156_SEG[1];
extern char EP_MIDI_CHANNEL_MSG_DISPATCH_OFF[1];
extern char EP_MIDI_CHANNEL_MSG_DISPATCH_SEG[1];
void __far event_cb_set_aux(char __near *, char __near *);
char far * __far ivt_get_vector(int);
void __far ivt_set_vector(int, char far *);

void __far pad_route_mode_set(char p0)
{
	int si_;
	int di_;
	char far *v0;
	char far *v1;

	C1_B_095F0 = p0;
	if (p0 - 1) goto br_3F780;
	event_cb_set_aux(EP_L_42156_OFF, EP_L_42156_SEG);
	si_ = 0;
	if (!C1_B_0D777) goto br_3F74C;
	di_ = -0x2888;
	goto loop_3F765;
br_3F74C:
	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c) + 0x79e;
loop_3F765:
	ivt_set_vector(si_ + 0x60, v0);
	si_++;
	if (si_ <= 3) goto loop_3F765;
	return;
br_3F780:
	event_cb_set_aux(EP_MIDI_CHANNEL_MSG_DISPATCH_OFF, EP_MIDI_CHANNEL_MSG_DISPATCH_SEG);
	si_ = 0;
loop_3F790:
	if (C1_B_0D777) {
		di_ = -0x2888;
	} else {
		v1 = ivt_get_vector(si_ + 0x5c) + 0x79e;
	}
	ivt_set_vector(si_ + 0x60, v1);
	si_++;
	if (si_ <= 3) goto loop_3F790;
}
