/* differs: 150 size 20, image 50; +0 image `cmp byte ptr [0x9b44], 0` CL `push bp`; 172 size 20, image 50; +0 image `cmp byte ptr [0x9d86], 0` CL `push bp` */
extern char MIDI_VOLUME_RX;
extern char MIDI_VOLUME_VAL;
void __far __pascal far_01F00(int);
void __far sample_dma_setup_large(void);

void __far __pascal tgt_01ECE(int x1, char p0)
{
	if (!MIDI_VOLUME_RX) goto br_01EFB;
	MIDI_VOLUME_VAL = p0;
	return;
	far_01F00(0);
	return;
	MIDI_VOLUME_VAL = 0x7f;
	return;
	sample_dma_setup_large();
br_01EFB:
	;
}
