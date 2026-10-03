/* differs: 150 size 10, image 12; +7 image `pop si` CL `retf 4`; 172 size 10, image 12; +7 image `pop si` CL `retf 4` */
void __far err_msg_report(void);

int __far __pascal L_09EA8(int x1, int x0)
{
	err_msg_report();
	return 0;
}
