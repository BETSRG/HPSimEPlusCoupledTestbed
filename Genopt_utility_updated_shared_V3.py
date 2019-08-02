#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Rajesh
#
# Created:     11/12/2014
# Copyright:   (c) Rajesh 2014
# Licence:     <your licence>
#-------------------------------------------------------------------------------


#importing the required packages
import sys
import os
import os.path
import subprocess
import glob
import shutil
import fileinput
from shutil import move
from os import remove, close
import re
import time


def ExecuteGenOpt():
    try:
        flag_genopt=0
        application_path=os.getcwd()
        script_dir=application_path
        path_jar=os.path.join(script_dir,"GenOpt\GenOpt.jar")
        path_ini=os.path.join(script_dir,"GenOpt\optWin7.ini")
        path_genoptlog=os.path.join(script_dir,"GenOpt\GenOpt.log")
        subprocess.call(['java', '-classpath',path_jar,'genopt.GenOpt',path_ini])
        f_handle_genoptlog=open(path_genoptlog,"r")
        for line in f_handle_genoptlog:
            if 'Optimization completed successfully' in line:
                print("GenOpt optimization completed successfully.")


                results_1=[]
                results_1=[]
                flist =[]

                print("Executed")
                powervalue=0
                evaporator_value=0

                rel_path_energyplus = "GenOpt\HPSim_Variables_Template.idf"
                f_current_location_energyplus = os.path.join(script_dir, rel_path_energyplus)
                rel_path_genopt = "GenOpt\data_Temp_python\HPSim_Variables_Template.idf"
                f_target_location_genopt = os.path.join(script_dir, rel_path_genopt)
                file_name_location_1=os.path.join(script_dir,"GenOpt\OutputListingAll.txt")
                f_handle_1 =open(file_name_location_1,"r")
                for line in f_handle_1:
                    if 'Minimum point' in line:

                        print line
                        results=  line.strip().split('\t')
                        powervalue=results[5]
                        print powervalue

                f_handle_1.close()
                rel_path=script_dir+"\GenOpt"

                flist=glob.glob(os.path.join(rel_path,"tmp-genopt-run*"))
                number_of_folders=len(flist)
                print flist
                print len(flist)
                for i in range(1,number_of_folders+1):
                    fname_temp_location = os.path.join(script_dir, "GenOpt\\tmp-genopt-run-"+str(i)+"\YorkHP.out")
                    f_temp_handle=open(fname_temp_location,"r")
                    for line in f_temp_handle:
##                        if'Evaporator air inlet ,' in line:
                        if'Compressor Input Ratio           ,' in line:
                            results_1=line.strip().split(',')
##                            evaporator_value=results_1[4].strip()
                            evaporator_value=results_1[1].strip()
                            print evaporator_value
                            hpsim_temp=0
                            hpsim_error=0
                            if float(evaporator_value)==float(powervalue):
                                hpsim_temp=hpsim_temp+1
                                path_hpsimlog=os.path.join(script_dir,"GenOpt\\tmp-genopt-run-"+str(i)+"\YorkHP.log")
                                f_handle_hmsimlog=open(path_hpsimlog,"r")
                                for line in f_handle_hmsimlog:
                                    if 'YorkHP.out successfully written' in line:
                                        path_yorkout=os.path.join(script_dir,"GenOpt\data_Temp_python\YorkHP.out")
                                        print"file found"
                                        print fname_temp_location
                                        shutil.copyfile(fname_temp_location,path_yorkout)
                                        break


                                else:
                                    hpsim_error=hpsim_error+1
                                f_handle_hmsimlog.close()


                    f_temp_handle.close()

                if hpsim_temp==hpsim_error:
                    if(hpsim_temp ==0 and hpsim_error==0):
                        print("No errors in HPSim")
                    else:
                        print("failure in HPSim could not find minimum point with successful hpsim execution")

                else:
                    print("Failure in HPsim Execution but found minimum point  corresponding to hpsim.log file and copied the required YorkHP.out")


                if (os.path.exists(f_target_location_genopt)):
                    os.unlink(f_target_location_genopt)

                shutil.copyfile(f_current_location_energyplus,f_target_location_genopt)
                flag_genopt=1


            else:
                print"Searching for status in Genopt Log.."
                flag_genopt=0




        return flag_genopt


    except:
            print("Error Executing Genopt ")

def checkifexists(a,b,c,d):

    try:
        list1=[]
        list2=[]
        flag=0
        print("checking if inputs exits in listinput output :\n"+str(a)+"\n"+str(b)+"\n"+str(c)+"\n"+str(d)+"\n")
        application_path=os.getcwd()
        script_dir=application_path
        path_listio=os.path.join(script_dir,"GenOpt\data_Temp_python\List_Input_Output.txt")

        f_handle= open(path_listio,"r")
        for line in f_handle:
            tmp_str=line.split(';')
            list1=tmp_str[0].split(',')
            tmp_a=float(list1[0])
            tmp_b=float(list1[1])
            tmp_c=float(list1[2])
            tmp_d=float(list1[3])
            print("Reading inputs from list input output file and verifying \n"+str(tmp_a)+":"+str(a)+"\n"+str(tmp_b)+":"+str(b)+"\n"+str(tmp_c)+":"+str(c)+"\n"+str(tmp_d)+":"+str(d)+"\n")
            if abs(tmp_a-a)<=1 and abs(tmp_b-b)<=1 and abs(tmp_c-c)<=1 and abs(tmp_d-d)<=1:
#            if abs(tmp_c-c)<=1 and abs(tmp_d-d)<=1:
                print("match found:corresponding inputs in energy plus file and list input output file\n"+str(tmp_a)+":"+str(a)+"\n"+str(tmp_b)+":"+str(b)+"\n"+str(tmp_c)+":"+str(c)+"\n"+str(tmp_d)+":"+str(d)+"\n")

                list2=list1
                print list2
                print"success equal"
                path_output=os.path.join(script_dir,"GenOpt\data_Temp_python\output.txt")

                #f_write=open("C:\Users\Rajesh\Desktop\Task\Java_Task\GenOpt\data_Temp_python\output.txt","w")
                f_write=open(path_output,"w")
                print "the output values are\n"+str(list2[3])+"\n"+str(list2[4])+"\n"+str(list2[5])
                f_write.write(str(list2[7])+"\n"+str(list2[6])+"\n"+str(list2[13])+"\n"+str(list2[12])+"\n"+str(list2[8])+"\n"+str(list2[9])+"\n"+str(list2[4])+"\n"+str(list2[5])+"\n"+str(list2[10]))
                f_write.close()

                flag=1
                break
            print "Result:no match\n"

        f_handle.close()
        return flag
    except:
        print "error in checkifexists function"

def append_IO_Values():
    try:
        application_path=os.getcwd()
        script_dir=application_path
        print application_path

        path_input=os.path.join(script_dir,"GenOpt\data_Temp_python\HPSim_Variables_Template.idf")
        path_output=os.path.join(script_dir,"GenOpt\data_Temp_python\YorkHP.out")
        f_input_handle= open(path_input,"r")
        hpsimvariables=[]
        outputvariables=[]

        for line in f_input_handle:
            if 'TWiC' in line:
                hpsimvariables=line.strip().split(',')
                twic=float(hpsimvariables[0])
                print str(twic)
            elif 'TaiC' in line:
                hpsimvariables=line.strip().split(',')
                taic=float(hpsimvariables[0])
                print str(taic)
            elif 'TWiE' in line:
                hpsimvariables=line.strip().split(',')
                twie=float(hpsimvariables[0])
                print str(twie)
            elif 'TaiE' in line:
                hpsimvariables=line.strip().split(';')
                taie=float(hpsimvariables[0])
                print str(taie)

        f_input_handle.close()
        f_output_handle=open(path_output,"r")
        for line in f_output_handle:
            if 'Evaporator gross capacity' in line:
                outputvariables=line.strip().split(',')
                evp_gross_cpcty=float(outputvariables[1])
                print str(evp_gross_cpcty)
            elif 'Gross sensible capacity' in line:
                outputvariables=line.strip().split(',')
                gross_se_cpcty=float(outputvariables[1])
            elif 'Compressor power' in line:
                outputvariables=line.strip().split(',')
                compress_pwr=float(outputvariables[1])
            elif 'Total Power' in line:
                outputvariables=line.strip().split(',')
                tot_pwr=float(outputvariables[1])
            elif 'Evaporator Air Enthalpy' in line:
                outputvariables=line.strip().split(',')
                evp_air_enthalpy=float(outputvariables[1])
            elif 'Evaporator Air Humidity Ratio' in line:
                outputvariables=line.strip().split(',')
                evp_air_humratio=float(outputvariables[1])
            elif 'Compressor Input Ratio' in line:
                outputvariables=line.strip().split(',')
                cmp_input_ratio=float(outputvariables[1])
            elif 'Condenser air inlet  ,' in line:
                outputvariables=line.strip().split(',')
                cndsr_airinlet=float(outputvariables[4])
            elif 'Evaporator air outlet,' in line:
                outputvariables=line.strip().split(',')
                evp_airoutlet_1=float(outputvariables[1])
                evp_airoutlet_2=float(outputvariables[4])

            elif 'Condenser subcooling' in line:
                outputvariables=line.strip().split(',')
                cndsr_subcooling=float(outputvariables[1])

            elif 'Expansion device subcooling' in line:
                outputvariables=line.strip().split(',')
                expdev_subcooling=float(outputvariables[1])

            elif 'Evaporator superheat' in line:
                outputvariables=line.strip().split(',')
                evp_superheat=float(outputvariables[1])

            elif 'Compressor superheat' in line:
                outputvariables=line.strip().split(',')
                cmp_superheat=float(outputvariables[1])

            elif 'Compressor suction' in line:
                outputvariables=line.strip().split(',')
                cmp_suctionTemp=float(outputvariables[4])

            elif 'Compressor discharge' in line:
                outputvariables=line.strip().split(',')
                cmp_discharceTemp=float(outputvariables[4])

        f_output_handle.close()
        #RS: Debugging: Added the following two lines to try to remove writing errors (9/29/18)
        path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
        EvapGrossCapLo=read_hpsim_variable_evpcap(path_hpsimout)
        path_input_output=os.path.join(script_dir,"GenOpt\data_Temp_python\List_Input_Output.txt")
        f_io_handle=open(path_input_output,"a")
        f_io_handle.write("\n"+str(twic)+","+str(taic)+","+str(twie)+","+str(taie)+","+str(evp_gross_cpcty)+","+str(gross_se_cpcty)+","+str(compress_pwr)+","+str(tot_pwr)+","+str(evp_air_enthalpy)+","+str(evp_air_humratio)+","+str(cmp_input_ratio)+","+str(cndsr_airinlet)+","+str(evp_airoutlet_1)+","+str(evp_airoutlet_2)+","+str(EvapGrossCapHi)+","+str(EvapGrossCapLo)+";")
        path_out=os.path.join(script_dir,"GenOpt\data_Temp_python\output.txt")
        print("writing listinputoutput and output")

        f_write=open(path_out,"w")

        f_write.write(str(tot_pwr)+"\n"
                        +str(compress_pwr)+"\n"
                        +str(evp_airoutlet_2)+"\n"
                        +str(evp_airoutlet_1)+"\n"
                        +str(evp_air_enthalpy)+"\n"
                        +str(evp_air_humratio)+"\n"
                        +str(evp_gross_cpcty)+"\n"
                        +str(gross_se_cpcty)+"\n"
                        #+str(cndsr_subcooling)+"\n"
                        #+str(expdev_subcooling)+"\n"
                        #+str(evp_superheat)+"\n"
                        #+str(cmp_superheat)+"\n"
                        #+str(cmp_suctionTemp)+"\n"
                        #+str(cmp_discharceTemp)+"\n"
                        +str(cmp_input_ratio))
        f_write.close()



        f_io_handle.close()
    except NameError:
        import pdb
        pdb.post_mortem()
        print"Name Error"
    except:
        print"error reading values from IO files or appending to list file"

def Cleanup_temp():
    try:
        application_path=os.getcwd()


        rel_path=application_path+"\GenOpt"

        flist=glob.glob(os.path.join(rel_path,"tmp-genopt-run*"))
        number_of_folders=len(flist)
        print flist
        print len(flist)
        for i in range(1,number_of_folders+1):

            fname_temp_location = rel_path+"\\tmp-genopt-run-"+str(i)
            if os.path.exists(fname_temp_location):
                print fname_temp_location
                shutil.rmtree(fname_temp_location)


    except:
        print"Error in Function:Cleanup_temp()"

def call_executable():
    try:
        currentpath=os.getcwd()
        print currentpath
        newpath=currentpath+"\\GenOpt"
        os.chdir(newpath)
        mod_path=os.getcwd()
        print mod_path

        flag_converge=0
        application_path=os.getcwd()
        path_test_program=application_path+"\\TestProgram.exe"
        print path_test_program
        print "calling launch_testprogram"
        subprocess.call(path_test_program)
        path_hpsimlog=os.path.join(application_path,"YorkHP.log")#need to change the path...
        print path_hpsimlog
        f_handle_hmsimlog=open(path_hpsimlog,"r")
        for line in f_handle_hmsimlog:
            print line
            if 'YorkHP.out successfully written' in line:
                flag_converge=1
                break
        f_handle_hmsimlog.close()
##        ##RS: Debugging: Trying to get values from HPSim bounding below
##        path_hpsimout=os.path.join(application_path,"YorkHP.out")#need to change the path...
##        print path_hpsimout
##        EvapGrossCap=read_hpsim_variable_evpcap(path_hpsimout)
        ##f_handle_hmsimout=open(path_hpsimout,"r")
##        for line in f_handle_hmsimlog:
##            print line
##            if 'YorkHP.out successfully written' in line:
##                flag_converge=1
##                break
##        f_handle_hmsimlog.close()
        # Change the modified directory to current directory
        original_path=mod_path[:-7]
        print original_path
        os.chdir(original_path)
        return flag_converge
    except:
        print"Error in Function: call_executable"

def read_hpsim_variable_comp(filepath):
    try:
        f_handle_hpsim_variable=open(filepath,"r")
        for line in f_handle_hpsim_variable:
            if 'Compressor Mass Flow Rate' in line:
                value=line.strip().split(",")[0] #;")[0]
        f_handle_hpsim_variable.close()
        return value
    except:
        print "Error in Function:read_hpsim_variable_comp"

def read_hpsim_variable_evpcap(filepath):
    try:
        f_handle_hpsim_variable=open(filepath,"r")
        for line in f_handle_hpsim_variable:
            if 'Evaporator gross capacity' in line:
                value=line.strip().split(",")[1] #;")[0]
        f_handle_hpsim_variable.close()
        return value
    except:
        print "Error in Function:read_hpsim_variable_evpcap"

def read_hpsim_variable_evp(filepath):
    try:
        f_handle_hpsim_variable=open(filepath,"r")
        for line in f_handle_hpsim_variable:
            if 'Evaporator Air Flow Rate' in line:
                value=line.strip().split(";")[0]
        f_handle_hpsim_variable.close()
        return value
    except:
        print "Error in Function:read_hpsim_variable_evp"

def read_hpsim_variable_cndsr(filepath):
    try:
        f_handle_hpsim_variable=open(filepath,"r")
        for line in f_handle_hpsim_variable:
            if 'Condenser Air Flow Rate' in line:
                value=line.strip().split(",")[0]
        f_handle_hpsim_variable.close()
        return value
    except:
        print "Error in Function:read_hpsim_variable_cndsr"

def read_hpsim_variable_EQ(filepath):   ##RS: Debugging: attempting to read in Eplus Q
    try:
        f_handle_hpsim_variable=open(filepath,"r")
        for line in f_handle_hpsim_variable:
            value=line.strip().split()[0]
        f_handle_hpsim_variable.close()
        return value
    except:
        print "Error in Function:read_hpsim_variable_cndsr"

def modify_hpsim_variable_comp(filepath,search_string,value_toreplace):

    try:
        Comp_value=read_hpsim_variable_comp(filepath)
        print Comp_value
        f1=open(filepath,'r')
        f2=open(filepath+'.tmp','w')
        for line in f1:
            if search_string in line:
                tmp_line_1=line.split(",")[1]
                tmp_line_2=line.split(",")[2]
                comp_line=str(value_toreplace)+","+tmp_line_1+","+tmp_line_2
                print comp_line
                f2.write(comp_line),
            else:
                f2.write(line)

        f1.close()
        f2.close()
        shutil.copyfile(filepath+'.tmp',filepath)
        os.remove(filepath+'.tmp')

    except:
        print "Error in Function:modify_hpsim_variable_comp"

def modify_hpsim_variable_evp(filepath,search_string,value_toreplace):
    try:
        Evp_value=read_hpsim_variable_evp(filepath)
        print Evp_value
        cndsr_value=read_hpsim_variable_cndsr(filepath)
        print cndsr_value
        f1=open(filepath,'r')
        f2=open(filepath+'.tmp','w')
        for line in f1:
            if search_string in line:
                tmp_line_1=line.split(";")[1]
                tmp_line_2=line.split(";")[2]
                evp_cndsr_line=str(value_toreplace)+";"+tmp_line_1+";"+tmp_line_2
                print evp_cndsr_line
                f2.write(evp_cndsr_line)
            else:
                f2.write(line)

        f1.close()
        f2.close()
        shutil.copyfile(filepath+'.tmp',filepath)
        os.remove(filepath+'.tmp')

#    except:
#        print "Error in Function:modify_hpsim_variable_evp"
    except Exception, e:
        print repr(e)
        print "Error in Function:modify_hpsim_variable_evp"

def modify_hpsim_variable_cndsr(filepath,search_string,value_toreplace):


    try:
        Evp_value=read_hpsim_variable_evp(filepath)
        print "Evaporator value =" +Evp_value
        cndsr_value=read_hpsim_variable_cndsr(filepath)
        print "Condenser value ="+cndsr_value
        f1=open(filepath,'r')
        f2=open(filepath+'.tmp','w')
        for line in f1:
            if search_string in line:
                tmp_line_1=line.split(",")[1]
                tmp_line_2=line.split(",")[2]
                #tmp_line_3=line.split(",")[3]
                evp_cndsr_line=str(value_toreplace)+","+tmp_line_1+","+tmp_line_2
                print evp_cndsr_line
                f2.write(evp_cndsr_line)
            else:
                f2.write(line)

        f1.close()
        f2.close()
        shutil.copyfile(filepath+'.tmp',filepath)
        os.remove(filepath+'.tmp')



                #line = line.replace(original_value,value_toreplace)


    except:
        print "Error in Function:modify_hpsim_variable_cndsr"

def change_check_cndsr_inc(filepath):
    try:
        converge_increment=0
        global cndsr_value
        cndsr_value=read_hpsim_variable_cndsr(filepath)
        print cndsr_value
        temp_cndsr_value=int(cndsr_value)

        for i in range(0,30):
            temp_cndsr_value=temp_cndsr_value+100
            modify_hpsim_variable_cndsr(filepath,"Condenser Air Flow Rate",temp_cndsr_value)
            condenser_test=call_executable()
            if(condenser_test==1):
                converged_value=temp_cndsr_value
                modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",800)
                modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",1)
                flag_evp_1=call_executable()
                ##RS: Debugging: Trying to get values from HPSim bounding below
                path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
                print path_hpsimout
                EvapGrossCapHi=read_hpsim_variable_evpcap(path_hpsimout)
##                modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",1000)
##                modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",1)
                modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",800)
                modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",0.8)
                flag_evp_2=call_executable()
                ##RS: Debugging: Trying to get values from HPSim bounding below
                path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
                print path_hpsimout
                EvapGrossCapLo=read_hpsim_variable_evpcap(path_hpsimout)
                if (flag_evp_1==1 or flag_evp_2==1):
                    converge_increment=1
                    print"converged while incrementing the condenser values"
                    print converged_value
                    print"Need to write the value to the input template file"
                    path_template_idf=os.path.join(application_path,"GenOpt\\HPSim_Variables_Template.idf")
                    modify_hpsim_variable_cndsr(path_template_idf,"Condenser Air Flow Rate",converged_value)
                    if(flag_evp_1==0):
                        EvapGrossCapHi=0
                    if(flag_evp_2==0):
                        EvapGrossCapLo=0

                break
        return converge_increment
    except:
        import pdb
        pdb.post_mortem()
        print "Error in Function: change_check_cndsr_inc"

def change_check_cndsr_dec(filepath):

    try:

        converge_decrement=0
        print cndsr_value
        #cndsr_value=read_hpsim_variable_cndsr(filepath)
        temp_cndsr_value=int(cndsr_value)
        for i in range(0,30):
            if(temp_cndsr_value<=0):
                print " Condenser value is less than or equal to Zero.Stopped decrementing the values"
            else:

                temp_cndsr_value=temp_cndsr_value-100
                modify_hpsim_variable_cndsr(filepath,"Condenser Air Flow Rate",temp_cndsr_value)
                condenser_test=call_executable()
                if(condenser_test==1):
                    converged_value=temp_cndsr_value
                    modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",800)
                    modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",1)
                    flag_evp_1=call_executable()
                    ##RS: Debugging: Trying to get values from HPSim bounding below
                    path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
                    print path_hpsimout
                    EvapGrossCapHi=read_hpsim_variable_evpcap(path_hpsimout)
##                    modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",1000)
##                    modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",1)
                    modify_hpsim_variable_evp(filepath,"Evaporator Air Flow Rate",800)
                    modify_hpsim_variable_comp(filepath,"Compressor Mass Flow Rate",0.8)
                    flag_evp_2=call_executable()
                    ##RS: Debugging: Trying to get values from HPSim bounding below
                    path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
                    print path_hpsimout
                    EvapGrossCapLo=read_hpsim_variable_evpcap(path_hpsimout)
                    if (flag_evp_1==1 or flag_evp_2==1):
                        converge_decrement=1
                        print"converged while decrementing the condenser values"
                        print converged_value
                        print"Need to write the value to the input template file"
                        application_path=os.getcwd()
                        path_template_idf=os.path.join(application_path,"GenOpt\\HPSim_Variables_Template.idf")
                        modify_hpsim_variable_cndsr(path_template_idf,"Condenser Air Flow Rate",converged_value)
                        if(flag_evp_1==0):
                            EvapGrossCapHi=0
                        if(flag_evp_2==0):
                            EvapGrossCapLo=0

                    break
        return converge_decrement

    except:
        print "Error in Function: change_check_cndsr_dec"

def check_converge():

    try:
        global EvapGrossCapHi
        global EvapGrossCapLo
        global EPlusQ
        flag_converge_success=0
        application_path=os.getcwd()
        file_path_src=application_path+"\GenOpt\HPSim_Variables_Template.idf"
        file_path_dest=application_path+"\GenOpt\HPsim_Variables.idf"
##
##
##        shutil.copyfile(file_path_src,file_path_dest)
##        application_path=os.getcwd()
##        path_test_program=application_path+"\GenOpt\TestProgram.exe"
##        #subprocess.call(path_test_program)
##        path_hpsimlog=os.path.join(application_path,"GenOpt\\YorkHP.log")#need to change the path...
##        f_handle_hmsimlog=open(path_hpsimlog,"r")
##        for line in f_handle_hmsimlog:
##            print line
##            if 'YorkHP.out successfully written' in line:
##                print "values converge No need to modify the values"
##                flag_converge_success=1
##                break
##        f_handle_hmsimlog.close()

        file_path_src=application_path+"\GenOpt\HPSim_Variables_Template.idf"
        file_path_dest=application_path+"\GenOpt\HPsim_Variables.idf"


        shutil.copyfile(file_path_src,file_path_dest)

        application_path=os.getcwd()
        path_hpsim_variables_idf=os.path.join(application_path,"GenOpt\\HPSim_Variables.idf")
        modify_hpsim_variable_evp(path_hpsim_variables_idf,"Evaporator Air Flow Rate",990)
        modify_hpsim_variable_comp(path_hpsim_variables_idf,"Compressor Mass Flow Rate",1)
        flag_converge_1=call_executable()
        ##RS: Debugging: Trying to get values from HPSim bounding below
        path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
        print path_hpsimout
        EvapGrossCapHi=read_hpsim_variable_evpcap(path_hpsimout)
        if(flag_converge_1==0):
            EvapGrossCapHi=0
##        modify_hpsim_variable_evp(path_hpsim_variables_idf,"Evaporator Air Flow Rate",1000)
##        modify_hpsim_variable_comp(path_hpsim_variables_idf,"Compressor Mass Flow Rate",1)
##RS: Debugging: Trying to compare high capacity against the Q requested by E+
        path_eplusQ=os.path.join(application_path,"GenOpt\\QEvap_E+.txt")
        EPlusQ=read_hpsim_variable_EQ(path_eplusQ)
        Difference = abs(EPlusQ)-EvapGrossCapHi
        if Difference > 0:   ##RS: Debugging: If Q requested > Qmax then return with Qmax
            flag_converge_success=2
            return flag_converge_success ##RS: Debugging: No need to check the lower limit

        modify_hpsim_variable_evp(path_hpsim_variables_idf,"Evaporator Air Flow Rate",990)
        modify_hpsim_variable_comp(path_hpsim_variables_idf,"Compressor Mass Flow Rate",0.8)
        flag_converge_2=call_executable()
        ##RS: Debugging: Trying to get values from HPSim bounding below
        path_hpsimout=os.path.join(application_path,"GenOpt\\YorkHP.out")#need to change the path...
        print path_hpsimout
        EvapGrossCapLo=read_hpsim_variable_evpcap(path_hpsimout)
        if(flag_converge_2==0):
            EvapGrossCapHi=0
        if(flag_converge_1==0 and flag_converge_2==0):
            print "Error : Not Converged:Need to Handle the Error"
            flag_increment = change_check_cndsr_inc(path_hpsim_variables_idf)
            if flag_increment==1:
                print " converged while incrementing condenser values"
                flag_converge_success=1

            else:
                print " Not converged while incrementing condenser values"
                print("Trying Now by decrementing condenser values")
                flag_decrement=change_check_cndsr_dec(path_hpsim_variables_idf)
                if flag_decrement==1:
                    flag_converge_success=1
                    print"converged while decrementing condenser values"
                else:
                    print"Not Converged while Decrementing condenser values as well"
                    print"unsuccessful :Not converged while Incrementing or Decrementing Condenser values"

        else:
            print "one of the values with 800 or 1000 converge.Need to call Genopt.jar "
            flag_converge_success=1


        return flag_converge_success

    except:
        #import pdb
        #pdb.post_mortem()
        print"Error in check_converge function"


def main():
    pass

if __name__ == '__main__':
    main()
    try:


        print("Cleaning up the Temporary Folders")
        Cleanup_temp()
        print("Folders Deleted")
        print(os.getcwd() + "\n")
        application_path=os.getcwd()
        print("my application path is"+application_path)

        script_dir=application_path
        path_log=os.path.join(script_dir,"GenOptstatus_log.txt")
        f_handle_log=open(path_log,"w")
        f_handle_log.write("genopt app started\n")
        path_hpsim_template_idf=os.path.join(application_path,"GenOpt\\HPSim_Variables_Template.idf")
        original_cndsr_value=read_hpsim_variable_cndsr(path_hpsim_template_idf)




            #check_converge()

    #Execution of other tasks

        f_name_path_energyplus=os.path.join(script_dir,"GenOpt\HPSim_Variables_Template.idf")
        f_name_path_genopt=os.path.join(script_dir,"GenOpt\data_Temp_python\HPSim_Variables_Template.idf")
        print f_name_path_energyplus
        print f_name_path_genopt
        f_handle_log.write(f_name_path_energyplus)
        f_handle_log.write(f_name_path_genopt)
        hpsimvariables=[]
        if not os.path.isfile(f_name_path_genopt):
            shutil.copyfile(f_name_path_energyplus,f_name_path_genopt)
            print "copying succesful"
            f_handle_log.write("copying successful: HPSim_Variables_template_idf\n")


        f_handle_hmsimvariables =open(f_name_path_energyplus,"r")
        f_handle_log.write("successfully opened input file\n")
        for line in f_handle_hmsimvariables:
            if 'TWiC' in line:
                hpsimvariables=line.strip().split(',')
                twic_1=float(hpsimvariables[0])
                f_handle_log.write("twic\n")
                print str(twic_1)
            elif 'TaiC' in line:
                hpsimvariables=line.strip().split(',')
                taic_1=float(hpsimvariables[0])
                f_handle_log.write("taic\n")
                print str(taic_1)
            elif 'TWiE' in line:
                hpsimvariables=line.strip().split(',')
                twie_1=float(hpsimvariables[0])
                f_handle_log.write("TWiE\n")
                print str(twie_1)
            elif 'TaiE' in line:
                hpsimvariables=line.strip().split(';')
                taie_1=float(hpsimvariables[0])
                print str(taie_1)
                f_handle_log.write("TaiE\n")

        f_handle_hmsimvariables.close()

        flag_1=checkifexists(twic_1,taic_1,twie_1,taie_1,)
        if flag_1==1:
            print"function matches.No need to execute genopt output values updated"
            f_handle_log.write("function matches.No need to execute genopt output values updated\n")
        else:
             flg_converge_success=check_converge()
             if flg_converge_success==0 :
                print "Not converged..Cannot launch Genopt"

             elif (flg_converge_success==2):   ##RS: Debugging: No need to optimize if request>required
                f_handle_log.write("appending Input output values")
                append_IO_Values()
                print "End of the application"
                f_handle_log.write("app ends")

             else:

                print "Need to execute genopt"
                status_genopt=ExecuteGenOpt()
                if status_genopt==1:
                    f_handle_log.write("appending Input output values")
                    append_IO_Values()
                    print "End of the application"
                    f_handle_log.write("app ends")
                else:
                    f_handle_log.write("Error in ExecuteGenopt function of application/Failure in Genopt Optimization")
                    print "Error in ExecuteGenopt function of application/Failure in Genopt Optimization"

        f_handle_log.write("End of the Application")

        print "Reset the condenser value in the hpsimvariables file if changed"
        print str(original_cndsr_value)
        modify_hpsim_variable_cndsr(path_hpsim_template_idf,"Condenser Air Flow Rate",original_cndsr_value)

        f_handle_log.close()


    except:



        print("Error in executing the Genopt python application ")



