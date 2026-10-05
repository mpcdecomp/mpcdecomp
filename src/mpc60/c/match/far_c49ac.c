extern char B_5017;
extern char B_5018;
extern char B_501C;

far_c49ac(a0, a1)
{
	B_5018 = far_c35da(a1, a0);
	B_5017 = 0;
	if ((B_5018 & 15) == B_501C)
		B_5017 |= 4;
	return;
}
