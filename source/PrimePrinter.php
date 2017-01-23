<?php

class PrimePrinter
{
    public function printPrimes()
    {
        define('M', 1000);
        define('RR', 50);
        define('CC', 4);
        define('WW', 10);
        define('ORDMAX', 30);

        $P[] = array_fill(1, M, 0);
        $MULT[] = array_fill(2, ORDMAX - 1, 0);

        $J = 1;
        $K = 1;
        $P[1] = 2;
        $ORD = 2;
        $SQUARE = 9;

        while ($K < M) {
            do {
                $J = $J + 2;
                if ($J == $SQUARE) {
                    $ORD = $ORD + 1;
                    $SQUARE = $P[$ORD] * $P[$ORD];
                    $MULT[$ORD - 1] = $J;
                }
                $N = 2;
                $JPRIME = true;
                while ($N < $ORD && $JPRIME) {
                    while ($MULT[$N] < $J)
                        $MULT[$N] = $MULT[$N] + $P[$N] + $P[$N];
                    if ($MULT[$N] == $J)
                        $JPRIME = false;
                    $N = $N + 1;
                }
            } while (!$JPRIME);
            $K = $K + 1;
            $P[$K] = $J;
        }

        {
            $PAGENUMBER = 1;
            $PAGEOFFSET = 1;
            while ($PAGEOFFSET <= M) {
                {
                    echo "The First ";
                    echo M;
                    echo " Prime Numbers --- Page ";
                    echo $PAGENUMBER;
                    echo "\n";
                    echo "\n";
                    for ($ROWOFFSET = $PAGEOFFSET; $ROWOFFSET < $PAGEOFFSET + RR; $ROWOFFSET++) {
                        for ($C = 0; $C < CC; $C++)
                            if ($ROWOFFSET + $C * RR <= M)
                                echo sprintf("%".WW."d", $P[$ROWOFFSET + $C * RR]);
                        echo "\n";
                    }
                    echo "\f\n";
                }
                $PAGENUMBER = $PAGENUMBER + 1;
                $PAGEOFFSET = $PAGEOFFSET + RR * CC;
            }
        }
    }
}
