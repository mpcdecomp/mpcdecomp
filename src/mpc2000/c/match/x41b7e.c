void __far voice_release_full(unsigned);

void __far voices_release_all(void)
{
	unsigned si_;

	si_ = 0;
loop_41B81:
	voice_release_full(si_);
	si_++;
	if (si_ < 0x20) goto loop_41B81;
}
