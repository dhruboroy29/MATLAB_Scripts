# Add the following folders to your MATLAB path:

	/MATLAB_Scripts/Features
	/MATLAB_Scripts/Features/AcclnBased
	/MATLAB_Scripts/Features/FftBased
	/MATLAB_Scripts/Features/PhaseBased
	/MATLAB_Scripts/Features/VelocityBased
	/MATLAB_Scripts/MatlabLibrary
	/MATLAB_Scripts/Scripts
	/MATLAB_Scripts/Scripts/OSC_PCT_Scripts
	/MATLAB_Scripts/Scripts/Paper_plots
	/MATLAB_Scripts/Scripts/Simple
	/MATLAB_Scripts/Scripts/VisualizeInAfrica
	/MATLAB_Scripts/Scripts/matlab2weka
	/MATLAB_Scripts/Scripts/mi
	/MATLAB_Scripts/Scripts/test
	/MATLAB_Scripts/Scripts/yaonazoude
	/MATLAB_Scripts/Haar Features
	/MATLAB_Scripts/eMote_scripts
	/MATLAB_Scripts/Library/UserExtensions
	/MATLAB_Scripts/Library/Products
	/MATLAB_Scripts/Library/Products/BubleBee Design
	/MATLAB_Scripts/Library/Products/BumbleBee Tests
	/MATLAB_Scripts/Library/Products/BumbleBee Tests/Tests
	/MATLAB_Scripts/Library/MatLab
	/MATLAB_Scripts/Library/MatLab/NewFolder1
	/MATLAB_Scripts/Library/MatLab/NewFolder2
	/MATLAB_Scripts/Library/MatLab/NumAnal
	/MATLAB_Scripts/Library/MatLab/SigPro
	/MATLAB_Scripts/Library/MatLab/Tests
	/MATLAB_Scripts/Library/MatLab/Visualization
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/ClockAnalyzer
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/LinkDetection
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/LinkDetection/WriteUp
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/Microphone
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/Radar
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/Radar/Jin
	/MATLAB_Scripts/Library/Data Collection/MatLab Scripts/Radar/Nived

# Add the following JAR files to your MATLAB static Java classpath:

	/MATLAB_Scripts/JAR files/weka.jar
	/MATLAB_Scripts/JAR files/LibSVM/LibSVM.jar
	/MATLAB_Scripts/JAR files/libsvm.jar
	/MATLAB_Scripts/JAR files/InfoTheoreticRanking_1.7.jar

The classpath can be edited through the following MATLAB command (need admin rights):

	>> edit classpath.txt

# Create/add your own working directories in /MATLAB_Scripts/Scripts/SetEnvironment.m, e.g.:

	str_pathbase_radar_dhrubo_Ubuntu = '/home/royd/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael';
	str_pathbase_data_dhrubo_Ubuntu = '/home/royd/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/Data_Repository';
	str_pathbase_model_dhrubo_Ubuntu = '/home/royd/Box Sync/All_programs_data_IPSN_2016/Simulation/toDhruboMichael/IIITDemo/Models/royd';
	
	%% assign path roots to global variables.
	...
	elseif strcmp(getenv('USER'),'royd'      )==1
	    g_str_pathbase_radar = str_pathbase_radar_dhrubo_Ubuntu;
	    g_str_pathbase_data  = str_pathbase_data_dhrubo_Ubuntu;
	    g_str_pathbase_model = str_pathbase_model_dhrubo_Ubuntu;
	...
	
