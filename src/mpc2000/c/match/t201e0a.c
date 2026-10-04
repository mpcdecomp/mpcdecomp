#include "mpc2k.h"

void __far __pascal smem_addr_data_ctrl2(char ctrl, char val)
{
	if (!MIDI_LOCAL_MODE) return;
	dsp_chan_update(ctrl, val);
	switch ((unsigned char)ctrl) {
	case MCC_VOLUME:
		if (!MIDI_VOLUME_RX) break;
		MIDI_VOLUME_VAL = val;
		return;
	case MCC_ALL_SOUND_OFF:
		far_01F00(0);
		return;
	case MCC_RESET_CTRLS:
		MIDI_VOLUME_VAL = MS_DATA_MASK;
		return;
	case MCC_ALL_NOTES_OFF: case MCC_OMNI_OFF: case MCC_OMNI_ON: case MCC_MONO_ON: case MCC_POLY_ON:
		sample_dma_setup_large();
		break;
	}
}
