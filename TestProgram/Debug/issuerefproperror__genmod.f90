        !COMPILER-GENERATED INTERFACE MODULE: Sat Oct 11 10:55:06 2014
        MODULE ISSUEREFPROPERROR__genmod
          INTERFACE 
            FUNCTION ISSUEREFPROPERROR(REFPROPERRVALUE,CALLINGROUTINE,  &
     &VALUEIFERRORFOUND,VARIABLETOSET1,VARIABLETOSET2) RESULT(ERRORFOUND&
     &)
              INTEGER(KIND=2), INTENT(IN) :: REFPROPERRVALUE
              CHARACTER(*), INTENT(IN) :: CALLINGROUTINE
              INTEGER(KIND=4) ,OPTIONAL, INTENT(IN) :: VALUEIFERRORFOUND
              INTEGER(KIND=4) ,OPTIONAL, INTENT(INOUT) :: VARIABLETOSET1
              REAL(KIND=4) ,OPTIONAL, INTENT(INOUT) :: VARIABLETOSET2
              LOGICAL(KIND=4) :: ERRORFOUND
            END FUNCTION ISSUEREFPROPERROR
          END INTERFACE 
        END MODULE ISSUEREFPROPERROR__genmod
