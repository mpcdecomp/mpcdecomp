void __near __pascal int2F_fn5_caller(long);
void __near __pascal status_poll_delay(char far *, int);

long __near __pascal status_poll_handler(long p0)
{
	long l4;
	long l8;

lcd_init_stage_1:
	status_poll_delay(&l8, 8);
	if (l8 == p0) goto L_097E4;
	int2F_fn5_caller(l4);
	goto lcd_init_stage_1;
L_097E4:
	return l4;
}
