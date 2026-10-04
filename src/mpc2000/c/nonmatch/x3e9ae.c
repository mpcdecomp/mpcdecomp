/* differs: XL v1.20 +13, 9 bytes */
void __far disp_list_run(char __near *);

void __far disp_select_plane(char p0)
{
	char l2[2];

	l2[0] = p0 + 1;
	l2[1] = 0;
	disp_list_run(l2);
}
