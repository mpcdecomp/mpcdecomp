/* differs: 150 size 2, image 23; +0 image `push bp` CL `retf`; 172 size 2, image 23; +0 image `push bp` CL `retf` */

void __far words_minmax(char far *p0, char far *p2, int p4, char far *p5)
{
	int si_;
	int di_;

	si_ = *(int far *)p2;
	di_ = *(int far *)p0;
}
