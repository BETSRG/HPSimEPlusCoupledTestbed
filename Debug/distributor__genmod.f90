        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 30 11:31:04 2018
        MODULE DISTRIBUTOR__genmod
          INTERFACE 
            SUBROUTINE DISTRIBUTOR(REF$,LTUBE,NCKTS,MDOTREF,TIEXP,HIEXP,&
     &POEVP,HOEVPRTD,QTUBE,DPTOT,ERRORFLAG)
              CHARACTER(LEN=80), INTENT(IN) :: REF$
              REAL(KIND=4), INTENT(IN) :: LTUBE
              INTEGER(KIND=2), INTENT(IN) :: NCKTS
              REAL(KIND=4), INTENT(IN) :: MDOTREF
              REAL(KIND=4), INTENT(IN) :: TIEXP
              REAL(KIND=4), INTENT(IN) :: HIEXP
              REAL(KIND=4), INTENT(IN) :: POEVP
              REAL(KIND=4) :: HOEVPRTD
              REAL(KIND=4), INTENT(OUT) :: QTUBE
              REAL(KIND=4), INTENT(OUT) :: DPTOT
              INTEGER(KIND=4), INTENT(OUT) :: ERRORFLAG
            END SUBROUTINE DISTRIBUTOR
          END INTERFACE 
        END MODULE DISTRIBUTOR__genmod