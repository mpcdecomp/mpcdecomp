/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
int __far far_3FE9E(long, char far *);
void __far name_split_number_suffix(char far *);

int __far name_field_enter(char far *p0)
{
	if (!far_3FE9E(0L, p0)) {
		name_split_number_suffix(p0);
		return 1;
	}
	return 0;
}
