/* differs: 150 size 76, image 72; +1F image `cmp dx, word ptr es:[bx + 0x16]` CL `cmp word ptr es:[bx + 0x16], dx`; 172 size 76, image 72; +1F image `cmp dx, word ptr es:[bx + 0x16]` CL `cmp word ptr es:[bx + 0x16], dx` */
extern long G_EDIT_FIELD_VAL;
extern char far *SND_CURRENT;

int __far sample_str_scan_4(void)
{
	long l4;

	l4 = *(long far *)(SND_CURRENT + 32) + G_EDIT_FIELD_VAL;
	if (l4 >= *(long far *)(SND_CURRENT + 20)) goto L_09604;
	*(long far *)(SND_CURRENT + 20) = l4;
L_09604:
	*(long far *)(SND_CURRENT + 24) = l4;
	return *(int *)&l4;
}
