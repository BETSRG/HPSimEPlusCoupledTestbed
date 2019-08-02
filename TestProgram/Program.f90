PROGRAM Test

    USE InputProcessor_HPSim
    use dfwin
    
    REAL TestIn
    REAL TestOut
    REAL :: Pwr=0
    CHARACTER(len=30),DIMENSION(200) :: Alphas ! Reads string value from input file
    INTEGER :: NumAlphas               ! States which alpha value to read from a "Number" line
    REAL, DIMENSION(200) :: Numbers    ! brings in data from IP
    INTEGER :: NumNumbers              ! States which number value to read from a "Numbers" line
    INTEGER :: Status                  ! Either 1 "object found" or -1 "not found"
    LOGICAL :: ErrorsInIDD=.false.   ! to check for any errors flagged during data dictionary processing
    LOGICAL :: FileExists
    LOGICAL :: FileExists_2, FileExists_3, FileExists_4
    REAL CndTmp_Multiplier  !RS: Debugging: This is the multiplier for checking the condenser side (10/16/14)
    REAL :: UpperBound=25  !RS: Debugging: Upper limit difference, F (10/16/14)
    REAL :: LowerBound=10  !RS: Debugging: Lower limit difference, F (10/16/14)
    REAL UpperLimit,LowerLimit  !RS: Debugging: These are the limits for checking the condenser side (10/16/14)
    REAL y1,y2,y3,y4  !RS: Debugging: These are the values for the weighted-power components
    REAL b  !RS: Debugging: This is the multiplier for checking the evaporator side (10/22/14)
    REAL PwrFunct    !RS: Debugging: A pwr function to help minimize pwr while also taking the temperature setpoint into account (9/26/15)
    REAL Delta_T    !RS: Debugging: The temperature setpoint minus the leaving air temperature (9/26/15)
    REAL Delta_Pwr  !RS: Debugging: Determining minimum pwr by differencing the pwr and pwrfunction (9/26/15)
    REAL Qtotalcool !RS: Debugging: Evaporator cooling rate from HPSim (Btu/h) (10/10/15)
    REAL QEvap  !RS: Debugging: Evaporator cooling rate needed by E+ (W) (10/10/15)
    REAL DeltaQ !RS: Debugging: Qtotalcool + QEvap for an overall cooling met value (10/10/15)
    REAL DeltaT !RS: Debugging: Difference between air temperature and setpoint temperature (5/14/16)
    REAL Tset   !RS: Debugging: Room air temperature setpoint (5/14/16)
    REAL Tair   !RS: Debugging: Room air temperature (5/14/16)
    REAL Tair_current   !RS: Debugging: Updating the penalty function to get it to calculate current conditions (8/18/18)
    
         character(len=1000) :: buffer, label, temp
  integer :: pos
  integer, parameter :: fh = 15
  integer :: ios = 0
  integer :: line = 0
 INTEGER*4 getcwd, status2
character*64 dirname
        
REAL Total_Power

TYPE Refrigerant_Side_Data
    CHARACTER(LEN=100) :: Location
    REAL Temperature
    REAL Pressure
    REAL Enthalpy
    REAL Saturation_Temperature
    REAL Quality
    REAL Subcooling
    REAL Superheat
END TYPE Refrigerant_Side_Data

TYPE Air_Side_Data
    CHARACTER(LEN=100) :: Location
    REAL Dry_bulb_temperature
    REAL Wet_bulb_temperature
    REAL Relative_Humidity
    REAL Volumetric_flow_rate
    REAL Pressure_Drop
END TYPE Air_Side_Data

TYPE(Air_Side_Data) :: Condenser_Air_In
TYPE(Air_Side_Data) :: Evaporator_Air_In
TYPE(Air_Side_Data) :: Condenser_Air_Out
TYPE(Air_Side_Data) :: Evaporator_Air_Out

TYPE(Refrigerant_Side_Data) :: Compressor_suction
TYPE(Refrigerant_Side_Data) :: Compressor_discharge
TYPE(Refrigerant_Side_Data) :: Condenser_inlet
TYPE(Refrigerant_Side_Data) :: Condenser_outlet
TYPE(Refrigerant_Side_Data) :: Expansion_device_inlet
TYPE(Refrigerant_Side_Data) :: Expansion_device_outlet
TYPE(Refrigerant_Side_Data) :: Evaporator_inlet
TYPE(Refrigerant_Side_Data) :: Evaporator_outlet

CHARACTER(LEN=14),PARAMETER :: FMT_333 = "(3(F10.5,','))"

CHARACTER(150) :: path, path_1, path_2, StrScalar, fullname
REAL path_len,a,b2,c,path_2_len, i, path_1_len
        
        path_len = GetModuleFileName (NULL, path, &
  len(path))

path_1=TRIM(path)
!StrScalar='C:\Users\lab303user\Documents\betsrg_dual\GenOpt\tmp-genopt-run-6'
!StrScalar='C:\Users\Rajesh\Desktop\Task\Java_Task\GenOpt\tmp-genopt-run-6'
OPEN(6,FILE='TestProgram.log')     ! VL_User_Setting -- file name


path_1_len=LEN_TRIM(path_1)
!a= INDEX(path, 'Debug',BACK=.FALSE.)

!b2=path_len-a

!c=path_len-b2

!path_2_len=i-7
!path_2=path_1(1:c)
!path_2_len=len(StrScalar)
!a=INDEX(path_1, 'tmp-genopt-run')
a=INDEX(path_1, 'TestProgram_GenOpt.exe')
path_2=path_1(1:(a-2))

    !CALL System('C:/Users/Rajesh/Desktop/Task/Java_Task/GenOpt/HeatPumpSimulator_debug.exe')
    !CALL System('C:/Users/lab303user/Documents/betsrg_dual/Heatpump Standalone/HeatPumpSimulator_debug.exe')   
    !CALL System('C:/Users/lab303user/Desktop/copyfolderstructure/GenOpt/HeatPumpSimulator_Debug.exe') 
    fullname=TRIM(path_2)//'\HeatPumpSimulator_debug.exe' !\HeatPumpSimulator_Debug.exe'
    WRITE(6,*) fullname
   !CALL System('C:/Users/lab303user/Documents/betsrg_dual/GenOpt/HeatPumpSimulator_Debug.exe')
    CALL System(fullname)


      status2 = getcwd( dirname )
        write(*,*) dirname
    
    !CALL System('HeatPumpSimulator_EvapSimple_2.exe')
    !CALL System('HeatPumpSimulator_Debug.exe')
    !CALL System('C:/Users/lab303user/Documents/betsrg_dual/Heatpump Standalone/HeatPumpSimulator_debug.exe')

    !fullname=TRIM(path_2)//'\NC.txt'
    
    INQUIRE(FILE='NC.txt',EXIST=FileExists)
    IF (FileExists) THEN
        Pwr=999999 !2*1530 ![Nominal Power] !10e7
        !OPEN(Unit=4, file='YorkHP.Out')
        !WRITE(4,*) 'Total Power                     ,',Pwr
        !CLOSE(4)
    END IF
    
    !fullname=TRIM(path_2)//'\Crash.txt'
    
    INQUIRE(FILE='Crash.txt',EXIST=FileExists_2)
    IF (FileExists_2) THEN
        Pwr=999999 !2*1540 ![Nominal Power] !10e8
        !OPEN(Unit=4, file='YorkHP.Out')
        !WRITE(4,*) 'Total Power                     ,',Pwr
        !CLOSE(4)
    END IF
    
        
    ![This is where the read-in info from Abhijit goes]
    ![Need to include some sort of statement to make sure it only reads it in if it exists]
    
    INQUIRE(FILE='YorkHP.out',EXIST=FileExists_4)
    IF (FileExists_4 .AND. (.NOT. FileExists .AND. .NOT. FileExists_2)) THEN
        !RS: Everything below is written by Abhijit (10/16/14)
        open(fh, file='YorkHP.out')

  ! ios is negative if an end of record condition is encountered or if
  ! an endfile condition was detected.  It is positive if an error was
  ! detected.  ios is zero otherwise.

  do while (ios == 0)
     read(fh, '(A)', iostat=ios) buffer
     if (ios == 0) then
        line = line + 1

        ! Find the first instance of whitespace.  Split label and data.
        pos = scan(buffer, ',')
        label = TRIM(ADJUSTL(buffer(1:20)))
        buffer = ADJUSTL(buffer(pos+1:))
        
        select case (label)
        case ('Total Power        ')
            pos=scan(buffer, ',');
            buffer = ADJUSTL(buffer(1:pos-1))
           read(buffer, *, iostat=ios) ValTemp
           print *, 'Read Total Power: ', ValTemp
           Total_Power=ValTemp
        case ('Evaporator gross ca')
            pos=scan(buffer, ',');
            buffer = ADJUSTL(buffer(1:pos-1))
           read(buffer, *, iostat=ios) ValTemp
           print *, 'Read Total Power: ', ValTemp
           Qtotalcool=ValTemp
        case ('Compressor suction ')
            
           print *, 'Values of Compressor_suction'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Compressor_suction%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Compressor_suction%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Compressor_suction%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Compressor_suction%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Compressor_suction%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Compressor_suction%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Compressor_suction%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Compressor_suction%Location=buffer
        
         case ('Compressor discharg')
            
           print *, 'Values of Compressor_discharge'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Compressor_discharge%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Compressor_discharge%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Compressor_discharge%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Compressor_discharge%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Compressor_discharge%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Compressor_discharge%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Compressor_discharge%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Compressor_discharge%Location=buffer
           
             case ('Condenser inlet    ')
            
           print *, 'Values of Condenser inlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Condenser_inlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Condenser_inlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Condenser_inlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Condenser_inlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Condenser_inlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Condenser_inlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Condenser_inlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Condenser_inlet%Location=buffer
           
           
             case ('Condenser outlet   ')
            
           print *, 'Values of Condenser_outlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Condenser_outlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Condenser_outlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Condenser_outlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Condenser_outlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Condenser_outlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Condenser_outlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Condenser_outlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Condenser_outlet%Location=buffer
           
           
             case ('Expansion device in')
            
           print *, 'Values of Expansion device inlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Expansion_device_inlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Expansion_device_inlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Expansion_device_inlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Expansion_device_inlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Expansion_device_inlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Expansion_device_inlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Expansion_device_inlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Expansion_device_inlet%Location=buffer
           
           
             case ('Expansion device ou')
            
           print *, 'Values of Expansion_device_outlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Expansion_device_outlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Expansion_device_outlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Expansion_device_outlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Expansion_device_outlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Expansion_device_outlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Expansion_device_outlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Expansion_device_outlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Expansion_device_outlet%Location=buffer
           
           case ('Evaporator inlet   ')
            
           print *, 'Values of Evaporator_inlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Evaporator_inlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Evaporator_inlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Evaporator_inlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Evaporator_inlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Evaporator_inlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Evaporator_inlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Evaporator_inlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Evaporator_inlet%Location=buffer
           
            case ('Evaporator outlet  ')
            
           print *, 'Values of Evaporator_outlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Temperature: ', ValTemp
           Evaporator_outlet%Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure: ', ValTemp
           Evaporator_outlet%Pressure=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Enthalpy: ', ValTemp
           Evaporator_outlet%Enthalpy=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Saturation_Temperature: ', ValTemp
           Evaporator_outlet%Saturation_Temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Quality: ', ValTemp
           Evaporator_outlet%Quality=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Subcooling: ', ValTemp
           Evaporator_outlet%Subcooling=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Superheat: ', ValTemp
           Evaporator_outlet%Superheat=ValTemp
           
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Evaporator_outlet%Location=buffer
           
        
           case ('Condenser air inlet  ')
            
           print *, 'Values of Condenser_air_inlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read DB Temperature: ', ValTemp
           Condenser_Air_In%Dry_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read WB Temperature: ', ValTemp
           Condenser_Air_In%Wet_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Relative Humidity: ', ValTemp
           Condenser_Air_In%Relative_Humidity=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Volumetric_flow_rate: ', ValTemp
           Condenser_Air_In%Volumetric_flow_rate=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure Drop: ', ValTemp
           Condenser_Air_In%Pressure_Drop=ValTemp
        
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Condenser_Air_In%Location=buffer
           
            case ('Condenser air outle')
            
           print *, 'Values of Condenser_air_outlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read DB Temperature: ', ValTemp
           Condenser_Air_Out%Dry_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read WB Temperature: ', ValTemp
           Condenser_Air_Out%Wet_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Relative Humidity: ', ValTemp
           Condenser_Air_Out%Relative_Humidity=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Volumetric_flow_rate: ', ValTemp
           Condenser_Air_Out%Volumetric_flow_rate=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure Drop: ', ValTemp
           Condenser_Air_Out%Pressure_Drop=ValTemp
        
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Condenser_Air_Out%Location=buffer
           
           case ('Evaporator air inlet ')
            
           print *, 'Values of Evaporator_air_inlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read DB Temperature: ', ValTemp
           Evaporator_Air_In%Dry_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read WB Temperature: ', ValTemp
           Evaporator_Air_In%Wet_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Relative Humidity: ', ValTemp
           Evaporator_Air_In%Relative_Humidity=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Volumetric_flow_rate: ', ValTemp
           Evaporator_Air_In%Volumetric_flow_rate=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure Drop: ', ValTemp
           Evaporator_Air_In%Pressure_Drop=ValTemp
        
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Evaporator_Air_In%Location=buffer
           
           case ('Evaporator air outl')
            
           print *, 'Values of Evaporator_air_outlet'
            
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read DB Temperature: ', ValTemp
           Evaporator_Air_Out%Dry_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read WB Temperature: ', ValTemp
           Evaporator_Air_Out%Wet_bulb_temperature=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Relative Humidity: ', ValTemp
           Evaporator_Air_Out%Relative_Humidity=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Volumetric_flow_rate: ', ValTemp
           Evaporator_Air_Out%Volumetric_flow_rate=ValTemp
           
           pos=scan(buffer, ',');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(pos+1:))
           read(temp, *, iostat=ios) ValTemp
           print *, 'Read Pressure Drop: ', ValTemp
           Evaporator_Air_Out%Pressure_Drop=ValTemp
        
           pos=scan(buffer, ' ');
           temp=ADJUSTL(buffer(1:pos-1))
           buffer=ADJUSTL(buffer(1:))
           Evaporator_Air_Out%Location=buffer
           
        case default
          ! print *, 'Skipping invalid label at line', line
        end select
     end if
  end do
!RS: Everything above is written by Abhijit (10/16/14)

    
        !UpperLimit= Condenser_Air_Out%Dry_bulb_temperature + UpperBound
        !LowerLimit= Condenser_Air_Out%Dry_bulb_temperature + LowerBound
        UpperLimit= Condenser_Air_In%Dry_bulb_temperature + UpperBound
        LowerLimit= Condenser_Air_In%Dry_bulb_temperature + LowerBound
    
        IF (Condenser_outlet%Saturation_Temperature .GT. UpperLimit) THEN
            CndTmp_Multiplier= Condenser_outlet%Saturation_Temperature - UpperLimit
        ELSEIF (Condenser_outlet%Saturation_Temperature .LT. LowerLimit) THEN
            CndTmp_Multiplier= LowerLimit - Condenser_outlet%Saturation_Temperature
        ELSE
            CndTmp_Multiplier=0
        END IF
        
        IF (Evaporator_inlet%Saturation_Temperature .LT. 35) THEN
            b=35-Evaporator_inlet%Saturation_Temperature
        ELSEIF(Evaporator_inlet%Saturation_Temperature .GT. 55) THEN
            b=Evaporator_inlet%Saturation_Temperature-55
        ELSE
            b=0
        END IF
    
        !OPEN(10,file='C:\Users\lab303user\Documents\betsrg_dual\GenOpt\QEvap_E+.txt')
        OPEN(10,file='C:\Users\lab303user\Desktop\HPSimProject\HPSimBuild\GenOpt\QEvap_E+.txt')
        !OPEN(10,file='QEvap_E+.txt')
        READ(10,*)Qevap,Tset,Tair     !RS: Debugging: Reading in Q needed by E+ (10/10/15); Reading in temperatures from E+ (5/14/16)
        !DeltaQ=(0.2927*Qtotalcool)+Qevap    !RS: Debugging: Converting Qtotalcool from BTU/h to W, and adding to required cooling rate (10/10/15)
        !RS: Debugging: Above commented out because of the changes made to the input file for the Buffer Program (refer to blue notebook) (1/16/16)
        Qevap=0.2927*Qevap  !RS: Debugging: Converting from Btuh to W (1/28/16)
        Qtotalcool=0.2927*Qtotalcool    !RS: Debugging: Converting from Btuh to W (1/28/16)
        DeltaQ=(Qtotalcool-Qevap)    !RS: Debugging: Converting both from Btu/h to W and taking Delta Q (1/16/16)
        !RS: Debugging: Need to carry over setpoint temperature from E+ (5/14/16)
        !DeltaT=Tset-Tair
        !RS: Debugging: Attempting to update penalty function (8/18/18)
        !RS: Debugging: This assumes that Q from the room (Qevap) hasn't changed significantly between one timestep and the next (2/1/19)
        !RS: Debugging: Therefore, we can use the air leaving the coil, Q from the room, and mdot_air to approximate the operating/leaving room temp for the next timestep (2/1/19)
        Tair_current = (Qevap/0.297)/(Evaporator_Air_Out%Volumetric_flow_rate*.24*4.59) + Evaporator_Air_Out%Dry_bulb_temperature
        !RS: Debugging: 0.297 converts back from W to Btu/h for Q; 0.24 is cp_air (Btu/lb-F); 4.59 is density of air times 60min/hr (convert from CFM to lb/hr) (8/18/18)
        Tair_current =(Tair_current-32)/1.8  !RS: Debugging: Converting from F to C (8/18/18)
        DeltaT=Tset-Tair_current !RS: Debugging: Commenting out previous and seeing how it controls off the calculated room air (8/18/18)
    
        y1=0.9*(CndTmp_Multiplier**2)    !RS: Debugging: The condenser side adds a penalty to power if it's out of range (10/16/14)
        y2=Total_Power*1     !RS: Debugging: The nominal power just has a regular weighting of 1 (10/16/14)
        y3=0.9*(b**2)
        IF(DeltaQ .GT. 0.00) THEN
            y4=0
        ELSE
            !y4=0.01*(ABS(DeltaQ))
            !y4=4*((0.01*ABS(DeltaQ))**2)    !RS: Debugging: Based on Power Function Test.xlsx, 1916 Case (1/9/16)
            !y4=5*((0.01*ABS(DeltaQ))**2)    !RS: Debugging: Based on Power Function Test.xlsx, 11216 Case (1/12/16)
            !y4=0 !500*ABS(DeltaQ)    !RS: Debugging: Based on Conversation with Dr. Spitler (2/27/16)
            !y4=4000*(DeltaT**2) !W/C2 !RS: Debugging: Based on Zakula (2013) and Gayeski (2010); see 4/30/16 through 5/14/16 notes in blue notebook (5/14/16)
            !RS: Debugging: Need to convert temps to F & y4 to W/F2 - does it make a difference? (3/15/19)
            Tair_current =(Tair_current*1.8)+32
            Tset=(Tset*1.8)+32
            DeltaT=Tset-Tair_current
            !y4=1000*(DeltaT**2) !W/F2 !RS: Debugging: Updated from above to be in F; see 3/15/19 notes in blue notebook
            y4=5*(DeltaT**2) !W/F2 !RS: Debugging: Updated from above to be in F; see 3/15/19 notes in blue notebook
            !y4=10000*(DeltaT**2) !W/F2 !RS: Debugging: Update per 7/12/19 Defense comments; see blue notebook (7/13/19)
        END IF
        !Pwr=SQRT(y1**2 + y2**2 +y3**2) !RS: Debugging: The power is determined using the square root of the sum of the squares (10/16/14)
        Pwr=y2 + y4 !(y1 + y3 + y4) !RS: Debugging: The power is determined using the square root of the sum of the squares (10/16/14)
        
        !OPEN(11,file='C:\Users\lab303user\Documents\betsrg_dual\GenOpt\PowerPenaltyVariables.csv',Access='APPEND')
        OPEN(11,file='C:\Users\lab303user\Desktop\HPSimProject\HPSimBuild\GenOpt\PowerPenaltyVariables.csv',Access='APPEND')
        !OPEN(11,file='PowerPenaltyVariables.csv',Access='APPEND')
        WRITE(11,FMT_333)y1,y3,y4,y2
        !RS: Debugging: A pwr function to help minimize pwr while also taking the temperature setpoint into account (9/26/15)
        
        !Delta_T=13-((Evaporator_Air_Out%Dry_bulb_temperature-32)/1.8)   !RS: Debugging: Converting from F to C (9/26/15)
        !Delta_T=55.4-(Evaporator_Air_Out%Dry_bulb_temperature)   !RS: Debugging: Converting from C to F, 55.4F is 13C (9/26/15)
        
        !PwrFunct=Pwr+.5*(ABS(Delta_T)**3) !RS: Debugging: 13 is the exiting temp setpoint (9/26/15)
        !PwrFunct=Pwr+(ABS(Delta_T)*Pwr/13) !RS: Debugging: 13 is the exiting temp setpoint (9/26/15) (13Csetpoint EXE)
        !PwrFunct=Pwr+(.5*ABS(Delta_T)*Pwr/13)+(ABS(Delta_T)**2) !RS: Debugging: 13 is the exiting temp setpoint (9/26/15)
        
        !Delta_Pwr=PwrFunct-Pwr
        
        !Pwr=Delta_Pwr
    
    END IF
    
    OPEN(Unit=8, file='PowerOut.out') !C://Users//lab303user//Desktop//GenOpt//Buffer Program//PowerOut.out')   !RS: Creating a new file for 
    WRITE(8,*) 'Total Power                     ,',Pwr
    CLOSE(8)
    
    INQUIRE(FILE='YorkHP.log', EXIST=FileExists_3)
    IF (.NOT. FileExists_3) THEN
        OPEN(Unit=5, file='YorkHP.log')
        WRITE(5,*) 'This file was written by the buffer program'
        CLOSE(5)
    END IF
    
    !OPEN(unit=3, file='SimpleTest.eso')
    !WRITE(3,*) 'MainDesignData, ',TestOut
    !WRITE(3,*) TestOut
    !OPEN(unit=150, file='SimpleTest.log')
    !WRITE(150,*) 'No errors'
    !CLOSE(1)
    !CLOSE(2)
    !CLOSE(3)
    !CLOSE(4)
    STOP
    
END PROGRAM