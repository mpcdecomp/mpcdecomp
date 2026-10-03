/* differs: XL v1.20 +1, 75 bytes */
extern char C1_B_0D7C8;
void __far disp_alert_wait_key(char far *);
void __far far_3E99C(void);
long __far far_43FA8(char, long, long);
void __far far_444F6(long);

void __far pgm_save_to_disk(char p0, long p1)
{
	char far *v0;

	v0 = far_43FA8(p0, p1, 0x7c000000L);
	if (v0) {
		disp_alert_wait_key(v0);
	} else {
		if (C1_B_0D7C8) {
			far_444F6(0x7c000000L);
			return;
		}
	}
	far_3E99C();
}
