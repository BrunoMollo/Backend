       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(2) VALUE 1.

       PROCEDURE DIVISION.
       PERFORM VARYING I FROM 1 BY 1 UNTIL I > 100
           IF I MOD 15 = 0
               DISPLAY 'FizzBuzz'
           ELSE IF I MOD 3 = 0
               DISPLAY 'Fizz'
           ELSE IF I MOD 5 = 0
               DISPLAY 'Buzz'
           ELSE
               DISPLAY I
           END-IF
       END-PERFORM.
       STOP RUN.



