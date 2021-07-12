# SMARTEN
SMARTEN: A multiscale simulation software for smartgrid management

SMARTEN (Smart Management AlgoRiThm of Electricity Network) is a multi-scale calculation tool for the management of mixed electrical energy flows developed by the scientists from the Physics and Mathematical Engineering Laboratory for Energy and Environment (PIMENT), University of La Reunion, 117 rue du Général Ailleret, 97430 Le Tampon, France and the Higher Institute of Technology of Antananarivo (I.S.T), Ministry of Higher Education and Scientific Research, Iadiambola Ampasampito, Po Box 8122, Antananarivo 101, Madagascar.

The software has been gradually built up for more than six years through research projects.  The first step was to think of management scenarios of the systems. The second stage was to build the specific algorithms that define the smart grids. The algorithms of SMARTEN were compared with the best software (i.e., HOMER) available in the field of smart grids simulation. Finally, a graphical user interface was created in Matlab to enable the computation of larger matrixes.

This repository contains all codes necessary to run SMARTEN v1.0 and it allows the community to re-use and improve the software.

In this "main" repository, all the codes and files related to SMARTEN v1.0 are available.
In order to run SMARTEN v1.0 in Matlab, the user has to download all the files in this "main" repository.
Then, open the main code "smarten_v1.m" and run it.
The other codes are secondary codes, which perform specific actions related to the main code.
There are also images in ".png" and ".jpg" format. There are used for the Graphical User Interface (GUI) of SMARTEN v1.0.

The file "smarten_v1.fig" is the editable Graphic User Interface of SMARTEN. The disposition of the Interface can be modified in this file.
The file "visualisation.fig" is also an editable Graphic User Interface; This time, it concerns the Interface of the 2D visualization of SMARTEN v1.0

*____________________ The other folder in this repository___________________________

The architecture of the codes and the relation between these codes are shown in the file "Architecture_SMARTEN.pdf" in the "Informations" folder.

An Instruction Manual named "SmartenV1_Instruction_Manual.pdf" is available in the "Informations" folder. This manual explains how to install SMARTEN v1.0. The minimum configuration requirements, the necessary library to run SMARTEN v1.0 are also indicated in this manual. Finally, it shows how to run a simulation on the software.

A video named "Presentation of SMARTEN v1.mp4" is also available in the "Informations" folder. This video explains how to run and perform a simulation in SMARTEN v1.0.

The calculation algorithms of Strategy 1 and Strategy 2 of SMARTEN are also available in the "Informations" folder.
There are the main algorithms named "main_algorithm_strategy1.pdf" and "main_algorithm_strategy2.pdf" respectively for each strategy. 
Then, there are calculation algorithms named :
- "calculation_algorithm_strategy1"
- "calculation_algorithm_strategy2_Part1"
- "calculation_algorithm_strategy2_Part2"
- "calculation_algorithm_strategy2_Part3"

In the "Data" folder, there are necessary files to run a simulation in SMARTEN v1.0 as explained in the video "Presentation of SMARTEN v1.mp4":
- "andravoahangy_tsena.shp" is an example of a map that is necessary to run the 2D visualization of SMARTEN.
- "smarten_inputs_20buildings.xlsx" is an example of the inputs file. In this case, 20 buildings are used in the simulation.
- "smarten_parameters_20buildings.xlsx" is an example of the parameters file. In this case, also, it corresponds to the parameters of 20 buildings.

We hope you will be able to run correctly SMARTEN v1.0 with this information. If you have any questions or comments, you can leave them directly here in the repository.
Thank you for your interest in our work.




