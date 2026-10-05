/* differs: +23 mov cx,ax | mov dx, ax */
far_d617f(a0)
long a0;
{
	long v4;

	v4 = a0 + 201L;
	return ((peekb(v4) << 2) + peekb(v4) << 2) + peekb(v4) + ((peekb(v4 + -1L) << 1) + peekb(v4 + -1L) << 1) + 202;
}
