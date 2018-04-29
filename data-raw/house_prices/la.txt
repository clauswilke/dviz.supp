			Local Area Unemployment Statistics (LA)
				      la.txt

Section Listing

1. Survey Definition
2. Files listed in the survey directory.
3. Time series, series file, data file, & mapping file definitions and relationships
4. Series file format and field definitions
5. Data file format and field definitions
6. Mapping file formats and field definitions
7. Data Element Dictionary

================================================================================
Section 1
================================================================================

The following is a definition of:  LOCAL AREA UNEMPLOYMENT STATISTICS (LA)

Survey Description:  Labor force and unemployment estimates for States and
local areas are developed by State workforce agencies to measure local labor
market conditions under a Federal-State cooperative program.  The Department
of Labor develops the concepts, definitions, and technical procedures which
are used by State agencies for preparation of labor force and unemployment
estimates.

These estimates are derived from a variety of sources, including the Current
Population Survey, the Current Employment Statistics survey, the Quarterly
Census of Employment and Wages, various programs at the Census Bureau, and
unemployment insurance claims data from the State workforce agencies.

To establish uniform labor force concepts and definitions in all States and
areas consistent with those used for the U.S. as a whole, monthly national
estimates of employment and unemployment from the Current Population Survey
are used as controls (benchmarks) for the State labor force statistics.

Summary Data Available:  Monthly labor force and unemployment series are
available for approximately 7,500 geographic areas, including cities over
25,000 population, counties, metropolitan areas, States, and other areas.

For each area, the following estimates are presented by place of residence:

	* Total civilian labor force,
	* Total number of people employed,
	* Total number of people unemployed, and
	* Unemployment rate

These series begin in January 1976 for statewide data, and January 1990 for
most substate areas.

Frequency of Observations:  Data are monthly in all cases.

Annual Averages:  Annual averages are available for not-seasonally-adjusted
series.

Data Characteristics:  Rates are expressed as percents with one decimal
place.  Levels are measured as individual persons (not thousands) and are
stored with no decimal places.

Updating Schedule:  With each issuance of preliminary data for the latest 
month, revisions to estimates for the prior month also become available.  In 
addition, annual revisions typically result in updates to data for the
preceding five years by mid-April of the following year.

Other historical revisions occur periodically:  Administrative changes may
require that data for new areas be collected or that an existing series be
dropped.  Also, some series ID codes may change.

References:     BLS Handbook of Methods, Chapter 4
		Measurement of Unemployment in States and Local Areas
		(http://www.bls.gov/opub/hom/pdf/homch4.pdf)

==================================================================================
Section 2
==================================================================================

The following Local Area Unemployment Statistics files are on the BLS internet in
the sub-directory pub/time.series/la:

       	
	la.data.0.CurrentU90-94      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual average, 1990-94
	la.data.0.CurrentU95-99      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual average, 1995-99
	la.data.0.CurrentU00-04      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual average, 2000-04
	la.data.0.CurrentU05-09      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual average, 2005-09
	la.data.0.CurrentU10-14      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual averages, 2010-14
	la.data.0.CurrentU15-19      	-  All LAUS areas, not seasonally adjusted,
					   monthly and annual averages, 2015-forward
	la.data.1.CurrentS      	-  All seasonally adjusted data, monthly,
					   1976-forward
	la.data.2.AllStatesU		-  States, not seasonally adjusted
	la.data.3.AllStatesS		-  States, seasonally adjusted
	la.data.4.RegionDivisionU	-  Regions/Divisions, not seasonally adjusted
	la.data.5.RegionDivisionS	-  Regions/Divisions, seasonally adjusted
	la.data.7.Alabama        	-  (state code = 01) AL = ALABAMA
	la.data.8.Alaska         	-  (state code = 02) AK = ALASKA
	la.data.9.Arizona        	-  (state code = 04) AZ = ARIZONA
	la.data.10.Arkansas      	-  (state code = 05) AR = ARKANSAS
	la.data.11.California    	-  (state code = 06) CA = CALIFORNIA
	la.data.12.Colorado      	-  (state code = 08) CO = COLORADO
	la.data.13.Connecticut   	-  (state code = 09) CT = CONNECTICUT
	la.data.14.Delaware      	-  (state code = 10) DE = DELAWARE
	la.data.15.DC            	-  (state code = 11) DC = DISTRICT OF COLUMBIA
	la.data.16.Florida       	-  (state code = 12) FL = FLORIDA
	la.data.17.Georgia       	-  (state code = 13) GA = GEORGIA
	la.data.18.Hawaii        	-  (state code = 15) HI = HAWAII
	la.data.19.Idaho         	-  (state code = 16) ID = IDAHO
	la.data.20.Illinois      	-  (state code = 17) IL = ILLINOIS
	la.data.21.Indiana       	-  (state code = 18) IN = INDIANA
	la.data.22.Iowa          	-  (state code = 19) IA = IOWA
	la.data.23.Kansas        	-  (state code = 20) KS = KANSAS
	la.data.24.Kentucky      	-  (state code = 21) KY = KENTUCKY
	la.data.25.Louisiana     	-  (state code = 22) LA = LOUISIANA
	la.data.26.Maine         	-  (state code = 23) ME = MAINE
	la.data.27.Maryland      	-  (state code = 24) MD = MARYLAND
	la.data.28.Massachusetts 	-  (state code = 25) MA = MASSACHUSETTS
	la.data.29.Michigan      	-  (state code = 26) MI = MICHIGAN
	la.data.30.Minnesota     	-  (state code = 27) MN = MINNESOTA
	la.data.31.Mississippi   	-  (state code = 28) MS = MISSISSIPPI
	la.data.32.Missouri      	-  (state code = 29) MO = MISSOURI
	la.data.33.Montana       	-  (state code = 30) MT = MONTANA
	la.data.34.Nebraska      	-  (state code = 31) NE = NEBRASKA
	la.data.35.Nevada        	-  (state code = 32) NV = NEVADA
	la.data.36.NewHampshire  	-  (state code = 33) NH = NEW HAMPSHIRE
	la.data.37.NewJersey     	-  (state code = 34) NJ = NEW JERSEY
	la.data.38.NewMexico     	-  (state code = 35) NM = NEW MEXICO
	la.data.39.NewYork       	-  (state code = 36) NY = NEW YORK
	la.data.40.NorthCarolina 	-  (state code = 37) NC = NORTH CAROLINA
	la.data.41.NorthDakota   	-  (state code = 38) ND = NORTH DAKOTA
	la.data.42.Ohio          	-  (state code = 39) OH = OHIO
	la.data.43.Oklahoma      	-  (state code = 40) OK = OKLAHOMA
	la.data.44.Oregon        	-  (state code = 41) OR = OREGON
	la.data.45.Pennsylvania  	-  (state code = 42) PA = PENNSYLVANIA
	la.data.46.PuertoRico    	-  (state code = 72) PR = PUERTO RICO
	la.data.47.RhodeIsland   	-  (state code = 44) RI = RHODE ISLAND,
	la.data.48.SouthCarolina 	-  (state code = 45) SC = SOUTH CAROLINA
	la.data.49.SouthDakota   	-  (state code = 46) SD = SOUTH DAKOTA
	la.data.50.Tennessee     	-  (state code = 47) TN = TENNESSEE
	la.data.51.Texas         	-  (state code = 48) TX = TEXAS
	la.data.52.Utah          	-  (state code = 49) UT = UTAH
	la.data.53.Vermont       	-  (state code = 50) VT = VERMONT
	la.data.54.Virginia      	-  (state code = 51) VA = VIRGINIA
	la.data.56.Washington    	-  (state code = 53) WA = WASHINGTON
	la.data.57.WestVirginia  	-  (state code = 54) WV = WEST VIRGINIA
	la.data.58.Wisconsin     	-  (state code = 55) WI = WISCONSIN
	la.data.59.Wyoming       	-  (state code = 56) WY = WYOMING
	la.data.60.Metro       	        -  Metropolitan Statistical Areas and
					   NECTAs (area_type_code = B)
	la.data.61.Division    	        -  Metropolitan Divisions and NECTA
					   Divisions (area_type_code = C)
	la.data.62.Micro                -  Micropolitan Statistical Areas and
					   NECTAs (area_type_code = D)
	la.data.63.Combined		-  Combined Statistical Areas and NECTAs
					   (area_type_code = E)
	la.data.64.County               -  Counties and equivalents (area_type_code = F)
	la.data.65.City                 -  Cities and towns (area_type_code = G or H)
	la.area				-  Area code (mapping file)
	la.area.type			-  Area type codes (mapping file)
	la.contacts			-  Contacts for la survey
	la.footnote			-  Footnote codes (mapping file)
	la.measure			-  Measure codes (mapping file)
	la.period			-  Period codes	(mapping file)
	la.series			-  All series and their beginning and end dates
	la.txt				-  General information

In addition, the following two files relate to the functionality of the Create
Customized Maps application:  la.areamaps and la.map_info.  They are not relevant for
processing LA time series data.
	
=================================================================================
Section 3
=================================================================================

The definition of a time series, and its relationship to and the interrelationship
among series, data, and mapping files are detailed below:

A time series refers to a set of data values observed over an extended period of
time at consistent intervals (i.e. monthly, quarterly, semi-annually, annually).  
BLS time series data are typically produced at monthly intervals and represent data 
ranging from a specific consumer item in a specific geographical area whose price 
is gathered monthly to a category of worker in a specific industry whose employment
is being recorded monthly, etc.

The files are organized such that data users are provided with the following set of
files to use in their efforts to interpret data files:

a)  a series file (only one series file per survey)
b)  mapping files
c)  data files

The series file contains a set of codes which, together, compose a series 
identification code that serves to uniquely identify a single time series.  
Additionally, the series file contains the following series-level information:

a) the period and year corresponding to the first data observation
b) the period and year corresponding to the most recent data observation

The mapping files are definition files that contain explanatory text descriptions
that correspond to each of the various codes contained within each series
identification code.

The data file contains one line of data for each observation period pertaining to a
specific time series.  Each line contains a reference to the following:

a) a series identification code
b) year in which data value is observed
c) period for which data value is observed (M13 indicates annual average)
d) data value
e) footnote code (if applicable)

=================================================================================
Section 4
=================================================================================

File Structure and Format:  The following represents the file format used to define 
la.series.  Note that the Field Numbers are for reference only; they do not exist 
in the database.  Data files are in ASCII text format.  Data elements are separated 
by tabs; the first record of each file contains the column headers for the data
elements stored in each field.  Each record ends with a new line character.

Field #/Data Element	Length		Value (Example)		

1.  series_id		  20		LASBS060000000000003          

2.  area_type_code	   1		L

3.  area_code	  	  15		BS0600000000000

4.  measure_code	   2		03

5.  seasonal		   1  		S

6.  srd_code		   2		06

7.  series_title	 120		Unemployment Rate: Balance of California, state less
					Los Angeles-Long Beach-Glendale MD (S)

8.  footnote_codes	   1		A

9.  begin_year		   4		1976

10. begin_period	   3		M01	

11. end_year		   4		2013		

12. end_period		   3		M11						

The series_id (LASBS060000000000003) can be broken out into:

Element					Value

survey abbreviation	=		LA
seasonal	 	=		S
area_code		=		BS0600000000000
measure_code		=		03

The series_title [Unemployment Rate: Balance of California, state less Los Angeles-Long
Beach-Glendale MD (S)] is a concatenation of the measure, area text, and seasonal
adjustment values:

Element			Value

measure		=	Unemployment Rate:
area_text	=	Balance of California, state less Los Angeles-Long Beach-Glendale MD
seasonal	=	(S)

==================================================================================
Section 5
==================================================================================

File Structure and Format:  The following represents the file format used to define
each data file.  Note that the field numbers are for reference only; they do not 
exist in the database.  Data files are in ASCII text format.  Data elements are 
separated by tabs; the first record of each file contains the column headers for 
the data elements stored in each field.  Each record ends with a new line character. 

The la.data file is partitioned into a number of separate files:  See Section 2.

All of the above-referenced data files have the following format:

Field #/Data Element	Length		Value (Example)		

1. series_id		  20		LASBS060000000000003          

2. year			   4		1976

3. period		   3		M01

4. value		  12      	9.4
				 
5. footnote_codes	  10		It varies
				

The series_id (LASBS060000000000003) can be broken out into:

Code					Value

survey abbreviation	=		LA
seasonal		=		S
area_code		=		BS0600000000000
measure_code		=		03

================================================================================
Section 6
================================================================================

File Structure and Format:  The following represents the file format used to define
each mapping file.  Note that the field numbers are for reference only; they do not
exist in the database.  Mapping files are in ASCII text format.  Data elements are
separated by tabs; the first record of each file contains the column headers for the
data elements stored in each field.  Each record ends with a new line character. 


File Name:  la.area

Field #/Data Element		Length		Value (Example)

1. area_type_code		1		A

2. area_code			15		ST0100000000000

3. area_text			80		Alabama


File Name:  la.area.type

Field #/Data Element		Length		Value (Example)

1. area_type_code		1		A

2. area_type_text		80		Statewide


File Name:  la.footnote

Field #/Data Element		Length		Value (Example)

1. footnote_code		1		C

2. footnote_text		100		Corrected.

				
File Name:  la.measure

Field #/Data Element		Length		Value (Example)

1. measure_code			2		03

2. measure_text			30		unemployment rate


File Name:  la.period		

Field #/Data Element		Length		Value (Example)

1.  period			3		M01

2.  period_abbr			5		JAN
				
3.  period_name			20		January

=========================================================================================
Section 7
=========================================================================================

LOCAL AREA UNEMPLOYMENT STATISTICS (LA) DATABASE ELEMENTS


Data Element    Length          Value (Example)          	Description

area_code       15              ST0100000000000		Code identifying the geographic
							area to which the data refer.
							
area_text       80         	Alabama   		Name of the geographic area to
		           			  	which the data refer.
				
area_type_code  1               A		        Unique code defining the type of
							area (A through N).
				
area_type_text  80         	Statewide  		Name of the area type.
				
begin_period    3               M01	 		Identifies first data observation
							within the first year for which data
							are available for a given series.

begin_year      4               1976            	Identifies first year for which data
							are available for a given series.

end_period      3               M11	 		Identifies last data observation
							within the last year for which data
							are available for a given series.

end_year        4               2014            	Identifies last year for which data
							are available for a given series.

footnote_code	1		C			Identifies footnote for the data
							value or series.
							
footnote_text	100		Corrected.		Contains the text of the footnote.

measure_code    2               03	     		Code identifying element measured
							by the data (03, 04, 05 and 06).

measure_text    30         	unemployment rate	Name of element measured by the
		           				data.
				
period_abbr     5         	JAN		    	Abbreviation of period name.

period          3               M01	 		Identifies period for which the
							data value is observed.

period_name     20         	January  		Full name of period to which the
		           				data value refers.
				
seasonal        1               S		    	Code identifying whether the
				 		    	data are seasonally adjusted (S)
				 		    	or not seasonally adjusted (U).

series_id       20              LASST010000000000003	Code identifying the specific
				      			series.

series_title	120		Unemployment Rate:	Concatenation of the measure,
				Alabama (S)		area text, and seasonal values.

srd_code	2		01			State, region, or division code.

value           12              6.1		      	Data value for series in a specifc
							year and period.
				
year            4               2014            	Identifies year of data value
							(1976-forward).
