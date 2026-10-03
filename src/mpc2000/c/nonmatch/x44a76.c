/* differs: XL v1.20 +1, 71 bytes */
extern char C1_B_0D7C8;
void __far disp_alert_wait_key(char far *);
void __far far_3E99C(void);
void __far far_444F6(long);
long __far far_44AC2(long, long);

void __far aps_save_to_disk(long p0)
{
	char far *v0;

	v0 = far_44AC2(p0, 0x7c000000L);
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
