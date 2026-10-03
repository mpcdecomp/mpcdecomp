/* differs: 150 size 12, image 14; +8 image `pop si` CL `ret 6`; 172 size 12, image 14; +8 image `pop si` CL `ret 6` */
extern int G_ERRNO;

int __near __pascal lcd_ratio_calc_90A2(int x2, int x1, int x0)
{
	G_ERRNO = 4;
	return 0;
}
