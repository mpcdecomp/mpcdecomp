/* differs: XL v1.20 +1, 214 bytes */
extern char C1_SEG[1];
extern char STR_WRONG_FILE_FORMAT[1];
void __far disk_file_close(void);
long __far fs_open(long, int);
long __far fs_read(char far *, int, int);
long __far fs_seek(long, int);

long __near fn_3B610(char far *p0, char far *p2, long p4)
{
	int l2;
	int l4;
	int si_;
	char far *v0;
	char far *v1;
	char far *v2;
	char far *v3;
	char far *v4;

	l2 = 0x7db;
	*(int far *)p2 = 0xc00;
	v0 = fs_open(p4, 0);
	if (v0) goto br_3B6FD;
	v1 = fs_read(p0, 0x7db, 1);
	v0 = v1;
	if (v0) goto br_3B6F1;
	if (*p0 == 2) goto br_3B67C;
	if (*p0 == 5) goto br_3B67C;
	si_ = STR_WRONG_FILE_FORMAT;
	l4 = C1_SEG;
	goto br_3B6F1;
br_3B67C:
	if (*p0 != 5) goto br_3B69A;
	v2 = fs_seek(1L, 1);
	l2 = 0x7dc;
br_3B69A:
	if (v2) goto br_3B6F1;
	v3 = fs_read(p0 + 0x7db, *(int far *)p2 - l2, 1);
	v2 = v3;
	if (v2) goto br_3B6F1;
	if (*p0 != 5) goto br_3B6F1;
	if (p0[1]) goto br_3B6F1;
	v4 = fs_seek(1L, 1);
	v2 = v4;
	*(int far *)p2++;
br_3B6F1:
	if (v2) goto br_3B6FD;
	disk_file_close();
br_3B6FD:
	return v2;
}
