/* differs: XL v1.20 +8, 1 bytes */
int __far disk_last_error(void);
int __far far_3E854(long, unsigned);
char far * __far fs_error_msg(unsigned);

long __far fs_write(long p0, int p2, int p3)
{
	int si_;
	int v0;

	if (!(far_3E854(p0, (unsigned)((unsigned long)(unsigned)p3 * (unsigned)p2)) + 1)) {
		v0 = disk_last_error();
		si_ = v0;
	} else {
		si_ = 0;
	}
	return fs_error_msg(si_);
}
