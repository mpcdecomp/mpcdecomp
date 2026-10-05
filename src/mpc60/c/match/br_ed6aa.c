extern char B_9041_V112;
extern char B_9044_V112;
extern unsigned char B_9045_V112;

br_ed6aa()
{
	if (B_9041_V112 != 71)
		return;
	if (B_9044_V112 == 69 || B_9044_V112 == 70)
		return B_9045_V112;
	return 0;
}
