extern char B_4E7A;

far_d4273(a0)
{
	int v2;

	v2 = inportw(-194) & -9;
	outportw(-194, v2 + 8);
	B_4E7A = a0;
	switch (a0) {
	case 1:
		outport(518, 5);
		outport(518, 2);
		break;
	case 2:
		outport(518, 4);
		outport(518, 2);
		break;
	case 0:
	case 3:
	case 4:
	case 5:
		return;
	case 6:
		inport(384);
		outport(518, 9);
		outport(518, 5);
		outport(518, 3);
		break;
	case 7:
		outport(518, 4);
		outport(518, 3);
		break;
	}
	outport(384, 0);
	outportw(-194, v2);
}
