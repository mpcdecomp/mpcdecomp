/* MPC2000 SYS text2: display-list commands, continued (../2k/common/sys/text2.asm). */

#pragma pack(1)

typedef struct { int quot, rem; } div_t;
div_t __cdecl div(int, int);
char far * __cdecl _fstrncpy(char far *, const char far *, unsigned);
char * __cdecl strcpy(char *, const char *);
unsigned __cdecl strlen(const char *);
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(strcpy, strlen, memset)

void __pascal disp_list_run(void far *list);


/* Every list ends on a zero command byte. */
struct op_bbl { char op, a, b; long v; char end; };
struct op_bbb { char op, a, b, c; int end; };
struct op_bbbb { char op, a, b, c, d, end; };
struct op_bbw { char op, a, b; int w; char end; };
struct op_w { char op; int w; char end; };
struct op_bbbl { char op, a, b, c; long v; char end; };
struct op_b3 { char op, a, b, c; char end; };
struct c4 { char a, b, c, d; };
struct op_bc4 { char a, op; struct c4 c; char end; };
void __pascal cmd_ratio_setup(int a, int b, char c);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);

/* v tenths as n-1 digits, a point, and one digit. */
void __pascal ratio_calc_divide(int x, int y, int v, int n)
{
	div_t d;

	d = div(v, 10);
	draw_unsigned_value(x, y, (long)d.quot, n - 1);
	cmd_ratio_setup(x + (n - 1) * 6, y, '.');
	draw_unsigned_value(x + n * 6, y, (long)d.rem, 1);
}

void __pascal cmd_dispatch_setup(char a, char b, int w)
{
	struct op_bbw l;

	l.op = 0x16;
	l.a = a;
	l.b = b;
	l.w = w;
	l.end = 0;
	disp_list_run(&l);
}

void __pascal cmd_param_setup(char a, char b, char c, char d)
{
	struct op_bbbb l;

	l.op = 0x14;
	l.a = a - 1;
	l.b = b - 1;
	l.c = c + 1;
	l.d = d + 1;
	l.end = 0;
	disp_list_run(&l);
}

void __pascal string_copy_scan(char a, char b, char *s)
{
	char l[12];

	l[0] = 0x1a;
	l[1] = a;
	l[2] = b;
	strcpy(l + 3, s);
	l[strlen(s) + 4] = 0;
	disp_list_run(l);
}

void __pascal cmd_build_params(int a, int b, int c, int d, int e)
{
	char l[6];

	l[0] = a;
	l[1] = b;
	l[2] = c;
	l[3] = d;
	l[4] = e;
	l[5] = 0;
	disp_list_run(l);
}

void __pascal display_coord_setup(int w)
{
	struct op_w l;

	l.op = 0x1b;
	l.w = w;
	l.end = 0;
	disp_list_run(&l);
}

void cmd_far_stub2(void)
{
	int l;

	l = 6;
	disp_list_run(&l);
}

void __pascal string_copy_setup(char a, struct c4 c)
{
	struct op_bc4 l;

	l.a = a + 2;
	l.op = 0x13;
	l.c = c;
	l.end = 0;
	disp_list_run(&l);
}

void string_copy_movsb(void)
{
	struct c4 c;

	c.a = 0;
	c.b = 0x33;
	c.c = 0xf8;
	c.d = 9;
	string_copy_setup(0, c);
	string_copy_setup(1, c);
	string_copy_setup(2, c);
}

void __pascal cmd_exec_0E_wrapper(int w)
{
	w += 2;
	disp_list_run(&w);
}

void __pascal cmd_track_setup(int a, int b, int c)
{
	struct op_b3 l;

	l.op = 0xb;
	l.a = a;
	l.b = b;
	l.c = c;
	l.end = 0;
	disp_list_run(&l);
}

void __pascal cmd_dispatch_0E(int a, int b, int c)
{
	struct op_b3 l;

	l.op = 0xe;
	l.a = a;
	l.b = b;
	l.c = c;
	l.end = 0;
	disp_list_run(&l);
}

void __pascal string_fill_stosb(char *s)
{
	char l[31];

	memset(l, 0, sizeof l);

	_fstrncpy(l + 1, s, 0x1c);
	l[0] = 0x23;
	disp_list_run(l);
}

void __pascal cmd_build_dispatch(int a, int b, int c, int d)
{
	cmd_build_params(0x11, a, b, c, d);
	cmd_track_setup(a + 1, b + d, c);
	cmd_dispatch_0E(a + c, b + 1, d);
}
