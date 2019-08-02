        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 30 11:26:02 2018
        MODULE SOLVE__genmod
          INTERFACE 
            SUBROUTINE SOLVE(A,N,IPVT,B)
              INTEGER(KIND=4) :: N
              REAL(KIND=4) :: A(N,N)
              INTEGER(KIND=4) :: IPVT(N)
              REAL(KIND=4) :: B(N)
            END SUBROUTINE SOLVE
          END INTERFACE 
        END MODULE SOLVE__genmod
