        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 30 11:26:02 2018
        MODULE ZEROCONVERGENCE__genmod
          INTERFACE 
            FUNCTION ZEROCONVERGENCE(LOWERBOUNDVALUE,FUNCTIONPOINTER,   &
     &TOL1,TOL2,DX,FB,IERROR)
              REAL(KIND=4) :: LOWERBOUNDVALUE
              REAL(KIND=4) :: FUNCTIONPOINTER
              EXTERNAL FUNCTIONPOINTER
              REAL(KIND=4) :: TOL1
              REAL(KIND=4) :: TOL2
              REAL(KIND=4) :: DX
              REAL(KIND=4) :: FB
              INTEGER(KIND=4) :: IERROR
              REAL(KIND=4) :: ZEROCONVERGENCE
            END FUNCTION ZEROCONVERGENCE
          END INTERFACE 
        END MODULE ZEROCONVERGENCE__genmod
