/* differs: 150 size 8, image 20; +0 image `push bp` CL `lcall 0, 0x1c64`; 172 size 8, image 20; +0 image `push bp` CL `lcall 0, 0x1c64` */
void __far X_01C64(void);

void __far __pascal dsp_chan_update(char p1, char p0)
{
	X_01C64();
}
