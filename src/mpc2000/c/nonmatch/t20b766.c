/* differs: 150 +1 image `enter 8, 0` CL `enter 4, 0`; 172 +1 image `enter 8, 0` CL `enter 4, 0` */
extern int G_ERRNO;
extern char PGM_TABLE[1];
void __far X_05972(void);
void __far __pascal bcd_convert(char far *, long);
void __far err_msg_report(void);
int __far far_059BC(void);
void __far __pascal program_select(int);
int __far __pascal program_select_wrapper(int);
void __far sample_data_load_1(void);

long __far __pascal midi_stop_helper(int p2, long p0)
{
	char far *v1;
	int v0;
	int l8;
	char l1;

	if (p2 != 1) goto br_0BBD0;
	l1 = 0;
	X_05972();
	sample_data_load_1();
loop_0BBB7:
	l8 = l1;
	if (program_select_wrapper(l8)) goto br_0BBF0;
	G_ERRNO = 1;
	goto br_0BBE2;
br_0BBD0:
	v0 = far_059BC();
	l1 = (char)v0;
	if ((char)v0 >= 0) goto loop_0BBB7;
	G_ERRNO = 0xa;
br_0BBE2:
	err_msg_report();
	return 0L;
br_0BBF0:
	v1 = ((long *)PGM_TABLE)[l8];
	bcd_convert(v1 + 2, p0);
	program_select(l8);
	return v1;
}
