/* differs: +6 push di | push si */
far_da02f(a0)
{
	int v2;
	register int r1;

	v2 = strlen(a0) - 1;
	for (; v2 >= 0; --v2) {
		r1 = a0;
		if (*(char *)(v2 + r1) == 32) {
			*(char *)(v2 + r1) = 0;
			continue;
		}
		break;
	}
	return;
}
