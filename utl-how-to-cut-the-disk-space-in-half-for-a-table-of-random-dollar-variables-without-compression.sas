How to cut the disk space in half for table of random dollar variables without compression

This is the best case for reducing disk space other numeric data will see less reduction.

When dealing with pennies the sum will be exact no so with dollars and fractional cents.

github
https://tinyurl.com/ycznwj2h
https://github.com/rogerjdeangelis/utl-How-to-cut-the-disk-space-in-half-for-table-of-random-dollar-numeric-variables-without-compressi

my macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

INPUT
=====

 1.02 Gb

 Observations           1,000,000
 Variables              125        20000 * uniform(1234)
 Observation Length     1000
 Compressed             BINARY

 GB10 total obs=1,000,000

 Obs    P1       P2       P3

   1  4876.22  1789.50  7663.87
   2 12196.38   161.91 10698.44
   3 10998.90  2618.00 18564.18
   4 16639.48 19484.30  2470.20
   5  2768.94  3210.93 10662.22
   6  8366.98  4028.11 13161.64
  ...

 Alphabetic List of Variables and Attributes

   #    Variable    Type    Len

   1    P1          Num       8
   2    P2          Num       8
   3    P3          Num       8
  ...

EXAMPLE OUTPUT  (no compression and half the size!!)
----------------------------------------------------

  0.50 gb

  Observations           1000000
  Variables              125
  Observation Length     500     * 500 not 1000;
  Compressed             NO

(same digits as above except no decimals)
GB10PENNIES total obs=1,000,000

  Obs     P1       P2       P3       P4         P5     ...     P125

    1   487622   178950   766387   195857   515162     ...    195857
    2  1219638    16191  1069844   315183   497015     ...    315183
    3  1099890   261800  1856418   237618   664297     ...    237618
    4  1663948  1948430   247020   729454  1772178     ...    729454
    5   276894   321093  1066222  1964456   356667     ...   1964456
    6   836698   402811  1316164   103736   169619     ...    103736

Alphabetic List of Variables and Attributes

  #    Variable    Type    Len

  1    P1          Num       4
  2    P2          Num       4
  3    P3          Num       4
  4    P4          Num       4


PROCESS
=======

* convert random dollars to rounded pennies;
data gb10pennies;
  set gb10;
  array dollars_cents p1-p125;
    do ix=1 to 125;
      dollars_cents[ix]=round(100*dollars_cents[ix]);
    end;
  drop ix;
run;quit;

%utl_optlen(inp=gb10pennies,out=gb10pennies,compress=no);

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;


* dollars and approx cents;

data gb10(compress=binary);
  array dollars_cents p1-p125;
  do rec=1 to 1000000;
    do ix=1 to 125;
      dollars_cents[ix]=20000*uniform(1234);
    end;
    output;
  end;
  drop rec ix;
run;quit;

