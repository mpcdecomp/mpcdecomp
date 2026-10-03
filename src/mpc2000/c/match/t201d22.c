#include "mpc2k.h"

struct MIDIMSG { unsigned char st, d1; char d2; };

void __far sound_event_dispatch(struct MIDIMSG m)
{
	switch (m.st & 0xf0) {
	case 0x00:
		if (MIDI_LOCAL_MODE) {
			((void (__far __pascal *)(int, char, char))voice_param_proc)(m.st, m.d1, m.d2);
			cmd_far_stub2();
			return;
		}
		break;
	case 0x80:
	off:
		((void (__far __pascal *)(struct MIDIMSG __far *))smem_addr_data_status)(&m);
		break;
	case 0x90:
		if (!m.d2) goto off;
		((void (__far __pascal *)(struct MIDIMSG __far *))pad_event_dispatch)(&m);
		return;
	case 0xb0:
		smem_addr_data_ctrl2(m.d1, m.d2);
		return;
	case 0xc0:
		if (!(B_9D1C & 1) && MIDI_LOCAL_MODE && PGM_CHANGE_RX) {
			smem_addr_data_ctrl(m.d1);
			return;
		}
		break;
	}
}
