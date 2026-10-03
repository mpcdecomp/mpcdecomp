/* differs: 150 size 116, image 110; +6 image `sub ah, ah` CL `cwde`; 172 size 116, image 110; +6 image `sub ah, ah` CL `cwde` */
extern char far *WIN_FIELD_VAR;
extern char WIN_FIELD_MODE;
extern char far *WIN_FIELD_CHANGE_FN;

void __far __pascal field_value_store(long p0)
{
	switch (WIN_FIELD_MODE) { case 0: case 1: goto br_02E7E; case 2: case 3: goto L_02E92; case 4: goto br_02EA6; }
	return;
br_02E7E:
	if ((char)p0 == *WIN_FIELD_VAR) goto br_02ECC;
	*WIN_FIELD_VAR = (char)p0;
	goto br_02EC8;
L_02E92:
	if (*(int *)&p0 == *(int far *)WIN_FIELD_VAR) goto br_02ECC;
	*(int far *)WIN_FIELD_VAR = *(int *)&p0;
	goto br_02EC8;
br_02EA6:
	if (p0 == *(long far *)WIN_FIELD_VAR) goto br_02ECC;
	*(int far *)WIN_FIELD_VAR = *(int *)&p0;
	*(int far *)(WIN_FIELD_VAR + 2) = ((int *)&p0)[1];
br_02EC8:
	((int (__far *)(void))WIN_FIELD_CHANGE_FN)();
br_02ECC:
	;
}
