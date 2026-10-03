int __far disk_last_error(void);
int __far far_3E884(long);
char far * __far fs_error_msg(unsigned);

long __far far_42A32(long p0)
{
	int si_;
	int v0;

	if (!(far_3E884(p0) + 1)) {
		v0 = disk_last_error();
		si_ = v0;
	} else {
		si_ = 0;
	}
	return fs_error_msg(si_);
}
