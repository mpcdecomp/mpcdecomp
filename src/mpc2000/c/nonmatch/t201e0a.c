/* differs: 150 size 114, image 112; +9 image `je +6B` CL `je +6D`; 172 size 114, image 112; +9 image `je +6B` CL `je +6D` */
extern char MIDI_LOCAL_MODE;
extern char MIDI_VOLUME_RX;
extern char MIDI_VOLUME_VAL;
void __far __pascal dsp_chan_update(char, char);
void __far __pascal far_01F00(int);
void __far sample_dma_setup_large(void);

void __far __pascal smem_addr_data_ctrl2(char p1, char p0)
{
	if (!MIDI_LOCAL_MODE) goto br_01EFB;
	dsp_chan_update(p1, p0);
	if (p1 == 0x78) goto tgt_01EE0;
	if (p1 > 0x78) goto tgt_01EBC;
	if (p1 == 7) goto tgt_01ECE;
	return;
tgt_01EBC:
	switch (p1) { case 121: goto br_01EEC; case 123: case 124: case 125: case 126: case 127: goto br_01EF6; default: goto br_01EFB; }
	return;
tgt_01ECE:
	if (!MIDI_VOLUME_RX) goto br_01EFB;
	MIDI_VOLUME_VAL = p0;
	return;
tgt_01EE0:
	far_01F00(0);
	return;
br_01EEC:
	MIDI_VOLUME_VAL = 0x7f;
	return;
br_01EF6:
	sample_dma_setup_large();
br_01EFB:
	;
}
