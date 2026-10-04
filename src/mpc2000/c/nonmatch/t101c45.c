/* differs: 150 size 2, image 10; +0 image `test byte ptr [0x8732], 2` CL `ret`; 172 size 2, image 10; +0 image `test byte ptr [0x8972], 2` CL `ret` */
extern char B_8972;

void __near fn_01C45(void)
{
	if (!(B_8972 & 2)) goto L_01C4E;
L_01C4E:
	;
}
