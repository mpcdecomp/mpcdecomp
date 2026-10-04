/* differs: 150 size 6, image 8; +5 image `pop ds` CL `retf`; 172 size 6, image 8; +5 image `pop ds` CL `retf` */
void __far field_redraw(void);

void __far br_0A026(void)
{
	field_redraw();
}
