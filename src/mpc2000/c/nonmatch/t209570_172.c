/* differs: 172 size 170, image 96; +4 image `push si` CL `push di` */
extern long G_EDIT_FIELD_VAL;
extern char far *SND_CURRENT;
long __far addr_calc_segment(long, int);

int __far sample_str_scan_3(void)
{
	char far *l4;

	((int *)&l4)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l4), *(int *)&SND_CURRENT) + 32) = *(long far *)(SND_CURRENT + 24) - G_EDIT_FIELD_VAL;
	((int *)&l4)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l4), *(int *)&SND_CURRENT) + 50) = addr_calc_segment(*(long far *)(SND_CURRENT + 32), 0);
	return (int)addr_calc_segment(*(long far *)(SND_CURRENT + 32), 0);
}
