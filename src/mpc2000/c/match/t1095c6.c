void __far err_msg_report(void);
void __far int2F_dispatch_10(void);
long __near __pascal lcd_clear_area(long, int, int);
void __far __pascal ui_enter_pad_assign(char far *);

int __near __pascal lcd_clear_wrapper(long p1, int p0)
{
	char far *v0;

	int2F_dispatch_10();
	v0 = lcd_clear_area(p1, p0, 0);
	if (!v0) {
		err_msg_report();
		return 0;
	}
	ui_enter_pad_assign(v0);
	return 1;
}
