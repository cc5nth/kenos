

# Statements #

An x86 assembly language program consists of one or more files containing statements. A statement consists of tokens separated by whitespace and terminated by either a newline character (ASCII 0x0A) or a semicolon (;) (ASCII 0x3B). Whitespace consists of spaces (ASCII 0x20), tabs (ASCII 0x09), and formfeeds (ASCII 0x0B) that are not contained in a string or comment. More than one statement can be placed on a single input line provided that each statement is terminated by a semicolon. A statement can consist of a comment. Empty statements, consisting only of whitespace, are allowed.


# Comments #

A comment can be appended to a statement. The comment consists of the slash character (/) (ASCII 0x2F) followed by the text of the comment. The comment is terminated by the newline that terminates the statement.


# Labels #

A label can be placed at the beginning of a statement. During assembly, the label is assigned the current value of the active location counter and serves as an instruction operand. There are two types of lables: symbolic and numeric.


## Symbolic Labels ##

A symbolic label consists of an identifier (or symbol) followed by a colon (:) (ASCII 0x3A). Symbolic labels must be defined only once. Symbolic labels have global scope and appear in the object file's symbol table.

Symbolic labels with identifiers beginning with a period (.) (ASCII 0x2E) are considered to have local scope and are not included in the object file's symbol table.


## Numeric Labels ##

A numeric label consists of a single digit in the range zero (0) through nine (9) followed by a colon (:). Numeric labels are used only for local reference and are not included in the object file's symbol table. Numeric labels have limited scope and can be redefined repeatedly.

When a numeric label is used as a reference (as an instruction operand, for example), the suffixes b (“backward”) or f (“forward”) should be added to the numeric label. For numeric label N, the reference Nb refers to the nearest label N defined before the reference, and the reference Nf refers to the nearest label N defined after the reference. The following example illustrates the use of numeric labels:

1:          / define numeric label "1"
one:        / define symbolic label "one"

```
/ ... assembler code ...

jmp   1f    / jump to first numeric label "1" defined
            / after this instruction
            / (this reference is equivalent to label "two")

jmp   1b    / jump to last numeric label "1" defined
            / before this instruction
            / (this reference is equivalent to label "one")

1:          / redefine label "1"
two:        / define symbolic label "two"

jmp   1b    / jump to last numeric label "1" defined
            / before this instruction
            / (this reference is equivalent to label "two")
```


# ... #


# Reference #
http://docs.sun.com/app/docs/doc/817-5477/