PROGRAM print_primes_generated(OUTPUT);
CONST
    M = 1000;
    RR = 50;
    CC = 4;
    WW = 10;
    ORDMAX = 30;
VAR
    P: ARRAY[1..M]OF INTEGER;
    PAGENUMBER: INTEGER;
    PAGEOFFSET: INTEGER;
    ROWOFFSET: INTEGER;
    C: 0..CC;
    J: INTEGER;
    K: 0..M;
    JPRIME: BOOLEAN;
    ORD: 2..ORDMAX;
    SQUARE: INTEGER;
    N: 2..ORDMAX;
    MULT: ARRAY[2..ORDMAX]OF INTEGER;
BEGIN
    J := 1;
    K := 1;
    P[1] := 2;
    ORD := 2;
    SQUARE := 9;

    WHILE K < M DO BEGIN
        REPEAT
            J := J + 2;
            IF J = SQUARE THEN BEGIN
                ORD := ORD + 1;
                SQUARE := P[ORD] * P[ORD];
                MULT[ORD - 1] := J;
            END;
            N := 2;
            JPRIME := TRUE;
            WHILE(N < ORD) AND JPRIME DO BEGIN
                WHILE MULT[N] < J DO MULT[N] := MULT[N] + P[N] + P[N];
                IF MULT[N] = J THEN JPRIME := FALSE;
                N := N + 1;
            END;
        UNTIL JPRIME;
        K := K + 1;
        P[K] := J;
    END;

    BEGIN
        PAGENUMBER := 1;
        PAGEOFFSET := 1;
        WHILE PAGEOFFSET < = M DO BEGIN
            BEGIN
                WRITE(’The First ’);
                WRITE(M:1);
                WRITE(’ Prime Numbers --- Page ’);
                WRITE(PAGENUMBER:1);
                WRITELN;
                WRITELN;
                FOR ROWOFFSET:=PAGEOFFSET TO PAGEOFFSET + RR - 1 DO BEGIN
                    FOR C:=0 TO CC - 1 DO
                        IF ROWOFFSET + C * RR <= M THEN WRITE(P[ROWOFFSET + C * RR]:WW);
                    WRITELN;
                END;
                PAGE;
            END;
            PAGENUMBER := PAGENUMBER + 1;
            PAGEOFFSET := PAGEOFFSET + RR * CC;
        END;
    END;
END.
