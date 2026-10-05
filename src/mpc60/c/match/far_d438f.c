extern char B_4E79;

far_d438f(a0)
{
	outport(518, a0 + 10);
	B_4E79 = a0;
	return;
}
