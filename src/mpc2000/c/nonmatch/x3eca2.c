/* differs: XL v1.20 +21, 9 bytes */
void __far disp_list_run(char __near *);

void __far cmd_dispatch_setup(char p0, char p1, int p2)
{
	char l6[6];

	l6[0] = 0x16;
	l6[1] = p0;
	l6[2] = p1;
	*(int *)(l6 + 3) = p2;
	l6[5] = 0;
	disp_list_run(l6);
}
