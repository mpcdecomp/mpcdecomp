/* differs: 150 size 102, image 78; +6 image `mov ax, word ptr [0x9a6c]` CL `mov ax, word ptr [0x9a6e]`; 172 size 102, image 78; +6 image `mov ax, word ptr [0x9cae]` CL `mov ax, word ptr [0x9cb0]` */
extern long G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char far *SND_CURRENT;

void __far sample_str_scan_1(void)
{
	char far *l4;

	((int *)&l4)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l4), *(int *)&SND_CURRENT) + 24) = *(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 20) + G_EDIT_FIELD_VAL;
	*(long far *)(SND_CURRENT + 20) = G_EDIT_FIELD_VAL;
}
