#pragma pack(1)
struct note {
	char far *snd;
	char f4, mode, sw1, alt1, sw2, alt2, voice, mute1, mute2;
	int tune;
	char attack, decay, dcy_mode, flt_freq, flt_res, fenv_attack, fenv_decay, fenv_amount;
	char v_level, v_attack, v_start, v_freq, f1b, v_pitch;
};
struct pgm {
	char hdr[0x1e];
	struct note notes[64];
};
struct held { char cnt; unsigned char a, b; };
#pragma pack()

extern struct pgm far *PGM_CURRENT;
extern struct held NOTE_HELD[128];
char far * __far __pascal note_clamp_flag(int);
char far * __far __pascal note_range_clamp(int);
void __near __pascal note_voice_prepare(int, unsigned char far *, struct note far *, char far *, char far *, int);

void __far __pascal pad_note_trigger(unsigned char far *ev)
{
	struct note far *pad;
	int n;
	int m;
	int dcy;
	int d;

	n = ev[1];
	pad = &PGM_CURRENT->notes[n - 0x23];
	if (pad->mode == 2) {
		if (ev[2] > pad->sw2) {
			n = (unsigned char)pad->alt2;
			if ((unsigned)(n - 0x23) > 0x3f)
				return;
		} else if (ev[2] > pad->sw1) {
			n = (unsigned char)pad->alt1;
			if ((unsigned)(n - 0x23) > 0x3f)
				return;
		}
		pad = &PGM_CURRENT->notes[n - 0x23];
		dcy = pad->dcy_mode;
	} else if (pad->mode == 3) {
		d = ev[4] == 1 ? ev[5] : pad->decay;
		if (pad->sw2 < d) {
			n = (unsigned char)pad->alt2;
			if ((unsigned)(n - 0x23) > 0x3f)
				return;
		} else if (pad->sw1 < d) {
			n = (unsigned char)pad->alt1;
			if ((unsigned)(n - 0x23) > 0x3f)
				return;
		}
		pad = &PGM_CURRENT->notes[n - 0x23];
		dcy = 1;
	} else {
		dcy = pad->dcy_mode;
	}
	note_voice_prepare(n, ev, pad, note_clamp_flag(ev[1]), note_range_clamp(ev[1]), dcy);
	NOTE_HELD[n].cnt++;
	if (pad->mode != 1)
		return;
	m = (unsigned char)pad->alt1;
	if ((unsigned)(m - 0x23) <= 0x3f)
		note_voice_prepare(m, ev, &PGM_CURRENT->notes[m - 0x23], note_clamp_flag(m), note_range_clamp(m), dcy);
	NOTE_HELD[n].a = m;
	m = (unsigned char)pad->alt2;
	if ((unsigned)(m - 0x23) <= 0x3f)
		note_voice_prepare(m, ev, &PGM_CURRENT->notes[m - 0x23], note_clamp_flag(m), note_range_clamp(m), dcy);
	NOTE_HELD[n].b = m;
}
