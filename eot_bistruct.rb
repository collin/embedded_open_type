require 'rubygems'
require 'bit-struct'

class EmbeddedOpenType < BitStruct
  Version =  0x00020002
  
  unsigned :eot_size, 64, "EOTSize"
  # unsigned long  	EOTSize  	Total structure length in bytes (including string and font data)
  
  unsigned :font_data_size, 64, "FontDataSize"
  # unsigned long 	FontDataSize 	Length of the OpenType font (FontData) in bytes

  unsigned :version, 64,  "Version"
  # unsigned long 	Version 	Version number of this format - 0x00020002
  
  unsigned :flags, 64, "Flags"
  # unsigned long 	Flags 	Processing Flags
 
  unsigned :font_panose, 10, "FontPANOSE"
  # How am I really supposed to do this?
  # Or any of these that are "byte"
  # byte[10] 	FontPANOSE 	The PANOSE value for this font - See http://www.microsoft.com/typography/otspec/os2.htm#pan
  
  unsigned :charset, 1, "Charset"
  # byte 	Charset 	In Windows this is derived from TEXTMETRIC.tmCharSet. This value specifies the character set of the font. DEFAULT_CHARSET (0x01) indicates no preference. - See http://msdn2.microsoft.com/en-us/library/ms534202.aspx

  unsigned :italic, 1, "Italic"
  # byte 	Italic 	If the bit for ITALIC is set in OS/2.fsSelection, the value will be 0x01 - See http://www.microsoft.com/typography/otspec/os2.htm#fss

  unsigned :weight, 64, "Weight"
  # unsigned long 	Weight 	The weight value for this font - See http://www.microsoft.com/typography/otspec/os2.htm#wtc

  unsigned :fs_type, 16, "fsType"
  #  unsigned short 	fsType 	Type flags that provide information about embedding permissions - See http://www.microsoft.com/typography/otspec/os2.htm#fst

  unsigned :magic_number, 16, "MagicNumber"
  # unsigned short 	MagicNumber 	Magic number for EOT file - 0x504C. Used to check for data corruption.
  
  unsigned :unicode_range_1, 64, "UnicodeRange1"
  # unsigned long 	UnicodeRange1 	os/2.UnicodeRange1 (bits 0-31) - See http://www.microsoft.com/typography/otspec/os2.htm#ur

  unsigned :unicode_range_2, 64, "UnicodeRange2"
  # unsigned long 	UnicodeRange2 	os/2.UnicodeRange2 (bits 32-63) - See http://www.microsoft.com/typography/otspec/os2.htm#ur
  
  unsigned :unicode_range_3, 64, "UnicodeRange3"
  # unsigned long 	UnicodeRange3 	os/2.UnicodeRange3 (bits 64-95) - See http://www.microsoft.com/typography/otspec/os2.htm#ur

  unsigned :unicode_range_4, 64, "UnicodeRange4"
  # unsigned long 	UnicodeRange4 	os/2.UnicodeRange4 (bits 96-127) - See http://www.microsoft.com/typography/otspec/os2.htm#ur
  
  unsigned :code_page_range_1, 64, "CodePageRange1"
  # unsigned long 	CodePageRange1 	CodePageRange1 (bits 0-31) - See http://www.microsoft.com/typography/otspec/os2.htm#cpr

  unsigned :code_page_range_2, 64, "CodePageRange2"
  # unsigned long 	CodePageRange2 	CodePageRange2 (bits 32-63) - See http://www.microsoft.com/typography/otspec/os2.htm#cpr
  
  unsigned :check_sum_adjustment, 64, "CheckSumAdjustment"
  # unsigned long 	CheckSumAdjustment 	head.CheckSumAdjustment - See http://www.microsoft.com/typography/otspec/head.htm

  unsigned :reserved_1, '64', "Reserved1"
  # unsigned long 	Reserved1 	Reserved - must be 0
  
  unsigned :reserved_2, '64', "Reserved2"
  # unsigned long 	Reserved2 	Reserved - must be 0
  
  unsigned :reserved_3, '64', "Reserved3"
  # unsigned long 	Reserved3 	Reserved - must be 0
  
  unsigned :reserved_4, '64', "Reserved4"
  # unsigned long 	Reserved4 	Reserved - must be 0
  
  unsigned :padding_1, 16, "Padding1"
  # unsigned short 	Padding1 	Padding to maintain long alignment. Padding value must always be set to 0x0000.
  
  unsigned :family_name_size, 16, "FamilyNameSize"
  # unsigned short 	FamilyNameSize 	Number of bytes used by the FamilyName array

  
  # byte 	FamilyName[FamilyNameSize] 	Array of UTF-16 characters the length of FamilyNameSize bytes. This is the English language Font Family string found in the name table of the font (name ID = 1) - See http://www.microsoft.com/typography/otspec/name.htm
unsigned short 	Padding2 	Padding value must always be set to 0x0000.
unsigned short 	StyleNameSize 	Number of bytes used by the StyleName
byte 	StyleName[StyleNameSize] 	Array of UTF-16 characters the length of StyleNameSize bytes. This is the English language Font Subfamily string found in the name table of the font (name ID = 2) - See http://www.microsoft.com/typography/otspec/name.htm
unsigned short 	Padding3 	Padding value must always be set to 0x0000.
unsigned short 	VersionNameSize 	Number of bytes used by the VersionName
bytes 	VersionName[VersionNameSize] 	Array of UTF-16 characters the length of VersionNameSize bytes. This is the English language version string found in the name table of the font (name ID = 5) - See http://www.microsoft.com/typography/otspec/name.htm
unsigned short 	Padding4 	Padding value must always be set to 0x0000.
unsigned short 	FullNameSize 	Number of bytes used by the FullName
byte 	FullName[FullNameSize] 	Array of UTF-16 characters the length of FullNameSize bytes. This is the English language full name string found in the name table of the font (name ID = 4) - See http://www.microsoft.com/typography/otspec/name.htm
unsigned short 	Padding5 	Padding value must always be set to 0x0000.
unsigned short 	RootStringSize 	Number of bytes used by the RootString array
byte 	RootString[RootStringSize] 	Array of UTF-16 characters the length of RootStringSize bytes.
unsigned long 	RootStringCheckSum 	RootString CheckSum value. See algorithm to process RootStringChecksum below.
unsigned long 	EUDCCodePage 	Codepage value needed for EUDC font support.
unsigned short 	Padding6 	Padding value must always be set to 0x0000.
unsigned short 	SignatureSize 	Number of bytes used by the Signature array. Currently reserved and should be set to 0x0000.
byte 	Signature[SignatureSize] 	Currently reserved. If the SignatureSize is 0x0000 there is no length to this array.
unsigned long 	EUDCFlags 	Processing flags for the EUDC font. Typical values might be TTEMBED_XORENCRYPTDATA and TTEMBED_TTCOMPRESSED.
unsigned long 	EUDCFontSize 	Number of bytes used by the Signature array.
byte 	EUDCFontData[EUDCFontSize] 	Number of bytes used for the EUDC font data. If the EUDCFontSize is 0x00000000 there is no length to this array.
byte 	FontData[FontDataSize] 	The font data for this EOT file. The data may be compressed or XOR encrypted as indicated by the processing flags.
end
