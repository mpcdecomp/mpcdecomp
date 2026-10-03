extern char C0_W_098C2[1];
void __far disp_alert_wait_key(char far *);
void __far far_46126(long);
long __near lcd_clear_line(char far *, char far *, long);

void __far L_3AF9E(long p0)
{
	long l8;
	char far *v0;

	v0 = lcd_clear_line(&l8, C0_W_098C2, p0);
	if (!v0) {
		far_46126(l8);
		return;
	}
	disp_alert_wait_key(v0);
}
