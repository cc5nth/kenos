

# Instruction details #

| intr Nr: | registers | for |
|:---------|:----------|:----|
| 0x13     | ah = 0x0  | reset |
| 0x13     | ah = 0x2  al <- read Nr sectors, <br>dh <- Head Nr, dl<- drive Nr, <br>ch <- cylinder Nr, cl <- beginning sector Nr, <br>es:bx <- buffer <table><thead><th> read from floopy to buffer </th></thead><tbody></tbody></table>

<h1>Floppy structure</h1>

2 x 80 x 18 x 512 = 1.44 MB<br>
<br>
<h2>details</h2>
2 Heads<br>
80 Cylinders / H<br>
18 Sectors / C<br>
512 bytes/S<br>
<br>
<h1>code</h1>
<pre><code>/*<br>
Assume sector number is 'x' (stored in %ax in this case), then:<br>
x / (BPB_SecPerTrk) = y,<br>
x % (BPB_SecPerTrk) = z.<br>
       <br>
     The remainder 'z' PLUS 1 is the start sector number;<br>
     z + 1 -&gt; the start-sector number<br>
     <br>
     The quotient 'y' devide by BPB_NumHeads(RIGHT SHIFT 1 bit) is cylinder <br>
     number;<br>
     y &gt;&gt; 1 -&gt; cylinder number<br>
     y &amp; 1 -&gt; magnetic header number.<br>
*/<br>
<br>
<br>
/* ==================================================================<br>
   Routine: ReadSector<br>
   Action: Read %cl Sectors from %ax sector(floppy) to %es:%bx (memory) <br>
*/<br>
ReadSector:<br>
    push    %ebp<br>
    mov     %esp, %ebp<br>
    sub     $2, %esp        /* Reserve space for saving %cl */<br>
    mov     %cl, -2(%ebp)<br>
    push    %bx             /* Save bx */<br>
    mov     (BPB_SecPerTrk), %bl    /* %bl: the devider */<br>
    <br>
    div     %bl             /* 'y' in %al, 'z' in %ah */<br>
    <br>
    inc     %ah             /* z++, got start sector */<br>
    mov     %ah, %cl        /* %cl &lt;- start sector number */<br>
    <br>
    mov     %al ,%dh        /* %dh &lt;- 'y' */<br>
    shr     $1, %al         /* 'y'/BPB_NumHeads */<br>
    mov     %al, %ch        /* %ch &lt;- Cylinder number(y&gt;&gt;1) */<br>
    <br>
    and     $1, %dh         /* %dh &lt;- Magnetic header(y&amp;1) */<br>
    pop     %bx             /* Restore %bx */<br>
    <br>
    /* Now, we got cylinder number in %ch, start sector number in %cl, magnetic<br>
       header in %dh. */<br>
    mov     (BS_DrvNum), %dl<br>
GoOnReading:<br>
    mov     $2, %ah<br>
    mov     -2(%ebp), %al   /* Read %al sectors */<br>
    int     $0x13           /* since %ah == 2, int 0x13 means reading */<br>
    <br>
    jc      GoOnReading     /* If CF set 1, mean read error, reread. */<br>
    add     $2, %esp<br>
    pop     %ebp<br>
    ret<br>
    /* end of ReadSector */<br>
<br>
</code></pre>


<h1>Reference</h1>
<a href='http://en.wikipedia.org/wiki/INT_13'>http://en.wikipedia.org/wiki/INT_13</a> <br>
<a href='http://en.wikipedia.org/wiki/BIOS_call'>http://en.wikipedia.org/wiki/BIOS_call</a>