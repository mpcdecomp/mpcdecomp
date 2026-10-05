extern char B_A61E;
extern int W_8CD1;
extern unsigned char *W_A650;

far_ee48f()
{
	int v2;

	v2 = (B_A61E & 128) != 0 ? *W_A650 : *(int *)W_A650;
	if ((B_A61E & 16) != 0)
		v2 += W_8CD1;
	return v2;
}
