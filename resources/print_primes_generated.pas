{1:}{2:}PROGRAM print_primes_generated(OUTPUT);
CONST M=1000;{5:}RR=50;CC=4;WW=10;{:5}{19:}
ORDMAX=30;{:19}VAR{4:}
P:ARRAY[1..M]OF INTEGER;{:4}{7:}
PAGENUMBER:INTEGER;PAGEOFFSET:INTEGER;
ROWOFFSET:INTEGER;C:0..CC;{:7}{12:}J:INTEGER;
K:0..M;{:12}{15:}JPRIME:BOOLEAN;{:15}{17:}
ORD:2..ORDMAX;SQUARE:INTEGER;{:17}{23:}
N:2..ORDMAX;{:23}{24:}
MULT:ARRAY[2..ORDMAX]OF INTEGER;{:24}
BEGIN{3:}{11:}{16:}J:=1;K:=1;P[1]:=2;{:16}
{18:}ORD:=2;SQUARE:=9;{:18};
WHILE K<M DO BEGIN{14:}REPEAT J:=J+2;{20:}
IF J=SQUARE THEN BEGIN ORD:=ORD+1;{21:}
SQUARE:=P[ORD]*P[ORD];{:21}{25:}
MULT[ORD-1]:=J;{:25};END{:20};{22:}N:=2;
JPRIME:=TRUE;
WHILE(N<ORD)AND JPRIME DO BEGIN{26:}
WHILE MULT[N]<J DO MULT[N]:=MULT[N]+P[N]+P[N]
;IF MULT[N]=J THEN JPRIME:=FALSE{:26};N:=N+1;
END{:22};UNTIL JPRIME{:14};K:=K+1;P[K]:=J;
END{:11};{8:}BEGIN PAGENUMBER:=1;
PAGEOFFSET:=1;
WHILE PAGEOFFSET<=M DO BEGIN{9:}
BEGIN WRITE(’The First ’);WRITE(M:1);
WRITE(’ Prime Numbers --- Page ’);
WRITE(PAGENUMBER:1);WRITELN;WRITELN;
FOR ROWOFFSET:=PAGEOFFSET TO PAGEOFFSET+RR-1
DO{10:}
BEGIN FOR C:=0 TO CC-1 DO IF ROWOFFSET+C*RR<=
M THEN WRITE(P[ROWOFFSET+C*RR]:WW);WRITELN;
END{:10};PAGE;END{:9};
PAGENUMBER:=PAGENUMBER+1;
PAGEOFFSET:=PAGEOFFSET+RR*CC;END;END{:8}{:3};
END.{:2}{:1}
