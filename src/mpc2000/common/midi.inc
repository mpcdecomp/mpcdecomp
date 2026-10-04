; MIDI wire values: channel-message status nibbles, control numbers, and the
; universal non-real-time SysEx the 2K speaks for MIDI Sample Dump (SDS).

; channel messages, high nibble of the status byte
MS_NOTE_OFF             equ     080h
MS_NOTE_ON              equ     090h
MS_POLY_PRESSURE        equ     0a0h
MS_CONTROL              equ     0b0h
MS_PROGRAM              equ     0c0h
MS_CHAN_PRESSURE        equ     0d0h
MS_PITCH_BEND           equ     0e0h
MS_STATUS_MASK          equ     0f0h
MS_CHAN_MASK            equ     00fh
MS_DATA_MASK            equ     07fh            ; a data byte's seven bits

; system exclusive
MS_SYSEX                equ     0f0h
MS_EOX                  equ     0f7h

; control change numbers
MCC_VOLUME              equ     007h
MCC_ALL_SOUND_OFF       equ     078h
MCC_RESET_CTRLS         equ     079h
MCC_ALL_NOTES_OFF       equ     07bh            ; 7Bh..7Fh: all notes off,
MCC_OMNI_OFF            equ     07ch            ;   and the mode messages
MCC_OMNI_ON             equ     07dh            ;   that imply it
MCC_MONO_ON             equ     07eh
MCC_POLY_ON             equ     07fh

; universal non-real-time SysEx: F0 7E <device> <sub-id> ... F7
SYSEX_NONRT             equ     07eh
SYSEX_ALL_DEVICES       equ     07fh            ; device id every unit answers

; Sample Dump Standard sub-ids
SDS_DUMP_HEADER         equ     001h
SDS_DATA_PACKET         equ     002h
SDS_DUMP_REQUEST        equ     003h
SDS_WAIT                equ     07ch
SDS_CANCEL              equ     07dh
SDS_NAK                 equ     07eh
SDS_ACK                 equ     07fh

; whole-message lengths, F0 to F7
SDS_HEADER_LEN          equ     21
SDS_PACKET_LEN          equ     127
SDS_REQUEST_LEN         equ     7
SDS_HANDSHAKE_LEN       equ     6

; a packet's 120 data bytes: three per word past 14 bits, else two
SDS_WORDS_3BYTE         equ     40
SDS_WORDS_2BYTE         equ     60

; byte offsets in a received universal SysEx
SYSEX_DEVICE            equ     2
SYSEX_SUB_ID            equ     3
SDS_MSG_PACKET          equ     4               ; handshake's packet number
SDS_MSG_SAMPLE          equ     4               ; header/request: sample number, 2 bytes
SDS_HDR_BITS            equ     6               ; sample format, 8..28 bits
SDS_HDR_PERIOD          equ     7               ; ns, 3 bytes
SDS_HDR_LENGTH          equ     00ah            ; words, 3 bytes
SDS_HDR_LOOP_START      equ     00dh
SDS_HDR_LOOP_END        equ     010h
SDS_HDR_LOOP_TYPE       equ     013h            ; 7Fh = loop off

; the 2K's SDS_STATE bits
SDS_ST_SEND             equ     1               ; a dump asked for, not yet started
SDS_ST_TX               equ     2               ; sending
SDS_ST_RX               equ     4               ; receiving
SDS_ST_BUSY             equ     SDS_ST_SEND|SDS_ST_TX|SDS_ST_RX
