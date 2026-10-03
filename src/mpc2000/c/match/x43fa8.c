void __far disk_file_close(void);
void __far disk_progress_msg(long, int);
long __far far_4400A(char, long, long);
void __far field_handler_nop(void);
long __far fs_open(long, int);

long __far far_43FA8(char p0, long p1, long p3)
{
	char far *v0;
	char far *v1;

	disk_progress_msg(p1, 1);
	v0 = fs_open(p1, 1);
	if (v0) goto br_43FFC;
	v1 = far_4400A(p0, p1, p3);
	v0 = v1;
	if (v0) goto br_43FFC;
	disk_file_close();
br_43FFC:
	field_handler_nop();
	return v0;
}
