/* differs: 150 size 54, image 60; +3 image `push si` CL `mov cx, word ptr [bp + 6]`; 172 size 54, image 60; +3 image `push si` CL `mov cx, word ptr [bp + 6]` */
extern char P_0060[1];
void __far __pascal disp_list_run(char far *);

void __far __pascal ui_row_request(int p0)
{
	p0++;
	P_0060[3] = (char)p0 * 6 + 1;
	P_0060[5] = (char)p0 * 6;
	P_0060[12] = (char)p0 * 6;
	P_0060[14] = (char)p0 * 6;
	P_0060[16] = -((char)p0 * 6 - 0xf7);
	disp_list_run(P_0060);
}
