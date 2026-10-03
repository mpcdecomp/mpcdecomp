/* differs: 150 size 62, image 4; +0 image `ret 8` CL `push bp`; 172 +12 image `jne +1C` CL `je +36` */
int __far __pascal system_init_handler(int, int);

int __near __pascal mem_test_init(int p0)
{
	if (system_init_handler(0x55aa, p0)) goto L_02340;
L_02338:
	return 0;
L_02340:
	switch (system_init_handler(-0x55ab, p0)) { case 0: goto L_02338; }
	return system_init_handler(0x1248, p0) ? 1 : 0;
}
