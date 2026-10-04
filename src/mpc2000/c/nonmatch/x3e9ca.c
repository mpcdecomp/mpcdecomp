/* differs: XL v1.20 +F, 9 bytes */
void __far disp_list_run(char __near *);

void __far disp_clear_all(void)
{
	char l2[2];

	l2[0] = 1;
	l2[1] = 0;
	disp_list_run(l2);
}
