extern char B_94A6[];
extern char B_9D34;
extern char B_A06E;

far_ec923()
{
	if (B_A06E != 0) {
		far_d55e8(B_94A6);
		B_A06E = 0;
		far_d6a82(B_94A6, B_9D34, 1);
	}
	return;
}
