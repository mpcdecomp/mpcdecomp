/* differs: 150 size 410, image 404; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 410, image 404; +1 image `enter 4, 0` CL `enter 6, 0` */
int __far int2F_call_fn6(char far *, int);
int __far __pascal range_io_handler(int, int, int, unsigned);
int __far __pascal range_process(int, int, int, int, int);

int __far __pascal range_smem_setup(int p1, int p0)
{
	unsigned l2;
	int l4;
	int v0;
	int v1;
	int v2;

	if (int2F_call_fn6(&l2, 2) == 2) goto br_0A3CC;
loop_0A3C5:
	return 0;
br_0A3CC:
	if (l2 < 2) goto loop_0A3C5;
	switch (range_process(p1, (p0) + 2, 1, l2 - 2, 1, 0x1c)) { case 0: goto loop_0A3C5; }
	v0 = int2F_call_fn6(&l4, 2);
	if (v0 != 2) goto loop_0A3C5;
	if (int2F_call_fn6(&l2, v0) != 2) goto loop_0A3C5;
	switch (range_io_handler(p1, (p0) + 0x1e, l4, l2)) { case 0: goto loop_0A3C5; }
	if (int2F_call_fn6(&l2, 2) != 2) goto loop_0A3C5;
	switch (range_process(p1, (p0) + 0x75e, l4, l2, 0x40, 6)) { case 0: goto loop_0A3C5; }
	if (int2F_call_fn6(&l2, 2) != 2) goto loop_0A3C5;
	switch (range_process(p1, (p0) + 0x8de, 1, l2, 1, 0x40)) { case 0: goto loop_0A3C5; }
	v1 = int2F_call_fn6(&l4, 2);
	if (v1 != 2) goto loop_0A3C5;
	if (int2F_call_fn6(&l2, v1) != 2) goto loop_0A3C5;
	switch (range_process(p1, (p0) + 0x91e, l4, l2, 2, 0x48)) { case 0: goto loop_0A3C5; }
	v2 = int2F_call_fn6(&l4, 2);
	if (v2 != 2) goto loop_0A3C5;
	if (int2F_call_fn6(&l2, v2) != 2) goto loop_0A3C5;
	return range_process(p1, (p0) + 0x9ae, l4, l2, 4, 0xc) ? 1 : 0;
}
