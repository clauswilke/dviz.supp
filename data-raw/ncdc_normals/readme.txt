All materials downloaded from: ftp://ftp.ncdc.noaa.gov/pub/data/normals/1981-2010/
Accessed: 2018-01-01

README FILE FOR NOAA'S 1981-2010 CLIMATE NORMALS

OUTLINE

I.   CONTENTS
II.  FILENAMING
III. FILE FORMATS
IV.  UNITS
V.   SPECIAL VALUES
VI.  FLAGS

I.  CONTENTS

    readme.txt - this file
    
    status.txt - describes the latest status of the 1981-2010 Normals
		 
    Below are descriptions of the five directories at this level. Note that 
    directories A-D describe the most popular elements of the 1981-2010 Normals
    products. This includes daily/monthly/seasonal/annual normals of temperature,
    precipitation, snowfall, and snow depth; various additional parameters based on
    these variables such as heating and cooling degree days, threshold exceedances,
    and others; and hourly normals of a number of different variables. Additional
    normals products are found in E - the supplemental directory - which contains its
    own readme and status files. See E below for additional details.    

    A. products directory

       The 1981-2010 Normals are located in the products directory. Within 
       products, there are four subdirectories:       
         
       1. hourly - contains all normals derived from hourly data, including
          temperature, dew point temperature, heat index, wind chill, wind, 
          cloudiness, heating and cooling degree hours, and pressure normals.
       2. precipitation - contains all precipitation, snowfall, and snow depth 
          normals files including percentiles, frequencies, and averages.
       3. temperature - contains all temperature-related normals files, including 
          maximum and minimum temperature normals, heating and cooling degree 
          day normals, and others.
       4. auxiliary - contains free-formatted files in two subdirectories:
       	  a. station - contains all daily, monthly, seasonal, and annual normals
             found in the below temperature and precipitation directories, but
             organized as one file per station. Users wanting to visually inspect 
	     normals for just one or a few stations should use the files in this 
	     subdirectory.
	  b. high-precision-degree-days - contains daily heating and cooling 
	     degree days at various bases. Values are reported to the hundredths
	     place as opposed to whole degrees. These files are intended for users
	     that need extra precision for ensuring consistency between daily
	     heating and cooling degree day normals and their associated monthly,
	     seasonal, and annual totals.

    B. station-inventories directory

       This directory contains station inventories for each product class. These
       inventories include the GHCN-Daily ID, latitude, longitude, state, and 
       station names. The temperature and precipitation inventories also specify 
       whether the station is a pseudonormal station. 

       1. allstations.txt contains all stations in the most recent Normals release
       2. hly-inventory.txt contains all stations used in the hourly analysis
       3. prcp-inventory.txt contains all stations used in the precipitation analysis
       4. snow-inventory.txt contains all stations used in the snowfall analysis
       5. snwd-inventory.txt contains all stations used in the snow depth analysis
       6. temp-inventory.txt contains all stations used in the temperature analysis
       7. zipcodes-normals-stations.txt contains zip codes and post office names for
          the vast majority of stations listed in allstations.txt

    C. documentation directory

       The documentation directory contains technical information about how the
       normals were computed and other relevant information.
      
       1.  1981-2010-normals-overview.pdf provides an overview of the 1981-2010
           Climate Normals products (not including supplemental normals)
       2.  daily-temperature-normals-methodology.pdf explains the methodology used to
           compute daily temperature normals
       3.  hourly-filenames.txt lists the filenames and descriptions of files
           containing the normals derived from hourly data
       4.  hourly-methodology-addendum-2014.pdf describes minor changes to the hourly
           normals methodology and the increase in station count for the 2014 refresh
	   of the hourly normals
       5.  hourly-methodology.pdf describes the methodology utilized to compute all
           normals calculated from hourly data
       6.  hourly-normals.pdf provides an overview of the initial release of the 
           hourly normals
       7.  monthly-precipitation-normals.pdf provides an overview of the monthly
           precipitation, snowfall, and snow depth normals
       8.  pairwise.pdf describes the pairwise homogeneity adjustment algorithm used
           to account for changes in station observing practices (applies to all
	   temperature normals products, but not to precipitation-related products)
       9.  precipitation-filenames.txt lists the filenames and descriptions of files
           containing the precipitation-related normals
       10. precipitation-methodology.pdf describes the methodology utilized to
           compute precipitation, snowfall, and snow depth normals
       11. temperature-filenames.txt lists the filenames and descriptions of files
           containing the temperature-related normals
       12. temperature-methodology.pdf describes the methodology utilized to 
           compute all temperature-related normals
       13. tobadj.inventory.txt is an inventory of stations for which a time of 
           observation (TOB) adjustment was applied     

    D. source-datasets directory

       The source-datasets directory contains source datasets used to compute the 
       1981-2010 Normals found in this collection. This includes the major source 
       datasets as well as a few intermediate steps in the processing of the Normals.      
      
       1. coop.52g.20110530.FLs.52g.tar.gz contains standardized monthly temperatures
       2. coop.52g.20110530.tad.tar.gz contains TOB adjustments 
       3. ghcnd-all.tar.gz contains GHCN-Daily
       4. ghcnd-stations.txt is a list of stations present in the GHCN-Daily files
       5. ghcnd-version.txt contains the specific version of GHCN-Daily used
       6. isdlite-normals.tar.gz contains the ISD-Lite hourly data
       7. mly-prcp-filled.txt contains filled monthly precipitation values
       8. mly-tmax-filled.txt contains filled monthly maximum temperature values
       9. mly-tmin-filled.txt contains filled monthly minimum temperature values
       
       The *-filled.txt files are intermediate values used in the computation of the
       Normals. Users wishing to utilize these files for another purpose should
       contact NCDC for formatting and other information.
       
    E. supplemental directory
    
       The supplemental directory contains NOAA's 1981-2010 Supplemental Normals.
       A separate readme and status file describing this product class is found in 
       the supplemental directory. Supplemental normals include agriculture-related
       normals such as frost-freeze dates; air freezing index return periods; and 
       10-year (2001-2010) hourly normals. A variety of monthly temperature normals
       computed using something other than a strict 30-year average; including 5-, 
       10-, 15-, and 20-year averages, OCN, and Hinge Fit; will be released in the
       future.

II. FILENAMING

    Except for the auxiliary normals files, all other product files are named
    following the form RRR-EEEE-SSSSSS[-CCCCCCC].txt, where the portion in brackets 
    is only used when necessary. The four components are defined as follows.

    A. RRR is the Reporting period, which can take the following values:

       ann = annual
       djf = December, January, February (winter)
       dly = daily
       hly = hourly
       jja = June, July, August (summer)
       mam = March, April, May (spring)
       mly = monthly
       mtd = month-to-date
       rtp = return periods (used for Air Freezing Index)
       son = September, October, November (autumn)
       ytd = year-to-date

    B. EEEE is the meteorological element, which can take the following values:

       cldd = cooling degree days
       cldh = cooling degree hours
       clod = clouds
       dewp = dew point temperature
       dutr = diurnal temperature range
       hidx = heat index
       htdd = heating degree days
       htdh = heating degree hours
       prcp = precipitation
       pres = sea level pressure
       snow = snowfall
       snwd = snow depth
       tavg = daily mean temperature (average of tmax and tmin)
       temp = temperature
       tmax = daily maximum temperature
       tmin = daily minimum temperature
       wchl = wind chill
       wind = wind

    C. SSSSSS = Statistic, which can take the following values:

       10pctl = Climatological 10th percentile
       1stdir = Prevailing Wind Direction
       1stpct = Prevailing Wind Percentage
       2nddir = Secondary Wind Direction
       2ndpct = Secondary Wind Percentage
       25pctl = Climatological 25th percentile
       50pctl = Climatological 50th percentile
       75pctl = Climatological 75th percentile
       90pctl = Climatological 90th percentile
       avgnds = Average Number of Days (followed by a condition)
       avgspd = Average Wind Speed
       baseNN = Average of base NN (other than 65F) Heating or Cooling Degree Days
                NN can be 40,45,50,55,57,60 for Heating Degree Days
	        NN can be 45,50,55,57,60,70,72 for Cooling Degree Days
       normal = Climatological Average
       pctall = Probability of Occurrence (followed by a condition)
       pctbkn = Percent Broken (clouds)
       pctclm = Percent Calm (winds)
       pctclr = Percent Clear (clouds)
       pctfew = Percent Few (clouds)
       pctovc = Percent Overcast (clouds)
       pctsct = Percent Scattered (clouds)
       vctdir = Mean Wind Vector Direction
       vctspd = Mean Wind Vector Magnitude

    D. CCCCCCC = Condition used only in conjunction with average numbers of days per 
                 month and probabilities of occurrence; can take the following values:

       geNNNhi = greater than or equal to NNN hundredths of inches
	         NNN can be 001,010,050,100 (for precipitation)
       geNNNti = greater than or equal to NNN tenths of inches
	         NNN can be 001,010,030,050,100 (for snowfall)
       geNNNwi = greater than or equal to NNN whole inches
	         NNN can be 001,003,005,010 (for snow depth)
       grthNNN = greater than or equal to NNN whole degrees Fahrenheit
	         NNN can be 040,050,060,070,080,090,100
       lsthNNN = less than or equal to NNN whole degrees Fahrenheit
	         NNN can be 000,010,020,032,040,050,060

    E. Examples:

       1. Long-term averages of monthly precipitation totals:
  	  mly-prcp-normal.txt
       2. The average number of days per month with snowfall greater than 1 inch:
          mly-snow-avgnds-ge010ti.txt
       3. Daily average base-65 heating degree days:
          dly-htdd-normal.txt.
       4. Daily average base-50 heating degree days:
          dly-htdd-base50.txt
       5. Hourly heat index normals:
          hly-hidx-normal.txt  

    Station-based normals file (one file per station) are named following this
    format: GGGGGGGGGGG-normals.txt, where GGGGGGGGGGG is the GHCN Daily ID.

III.FILE FORMATS

    A. FORMAT OF ANNUAL/SEASONAL FILES
       (ann-*.txt, djf-*.txt, mam-*.txt, jja-*.txt, son-*.txt)

       Each file contains the annual/seasonal values of one parameter at all 
       qualifying stations. There is one record (line) per station.

       The variables in each record include the following:

       Variable  Columns  Type
       ----------------------------
       STNID       1- 11  Character
       VALUE      19- 23  Integer
       FLAG       24- 24  Character
       ----------------------------

       These variables have the following definitions:

       STNID   is the GHCN-Daily station identification code. See the lists in the
               station-inventories directory.
       VALUE1  is the annual/seasonal value.
       FLAG1   is the completeness flag for the annual/seasonal value. See Flags
               section below.

    B. FORMAT OF MONTHLY FILES 
       (mly-*.txt)

       Each file contains the values of one parameter for each month of the year 
       at all qualifying stations. There is one record per station.

       The variables in each record include the following:

       Variable  Columns  Type
       ----------------------------
       STNID       1- 11  Character
       VALUE1     19- 23  Integer
       FLAG1      24- 24  Character
       - - - - - - - - - - - - - -
       VALUE12    96-100  Integer
       FLAG12    101-101  Character
       ----------------------------

       These variables have the following definitions:

       STNID   is the GHCN-Daily station identification code.
       VALUE1  is the January value.
       FLAG1   is the completeness flag for January. See Flags section below.
       - - - -
       Value12 is the December value.
       Flag12  is the completeness flag for December.

    C. FORMAT OF DAILY, MONTH-TO-DATE, AND YEAR-TO-DATE FILES
       (dly-*.txt, mtd-*.txt, ytd-*.txt)          

       Each file contains the values of one parameter for each day of the year 
       at all qualifying stations. There is one record per station-calendar month.

       The variables in each record include the following:

       Variable  Columns  Type
       ----------------------------
       STNID       1- 11  Character
       MONTH      13- 14  Integer
       VALUE1     19- 23  Integer
       FLAG1      24- 24  Character
       - - - - - - - - - - - - - - 
       VALUE31   229-233  Integer
       FLAG31    234-234  Character
       ----------------------------

       These variables have the following definitions:

       STNID   is the GHCN-Daily station identification code.
       MONTH   is the month in the 30-year period used. 01=January; 12=December
       VALUE1  is the value for the first day of the month.
       FLAG1   is a completeness flag based on the WMO normals classification, for 
               the first day of the month. See Flags Section below.
       - - - -
       Value31 is the value for day 31 of the month.
       Flag31  is the completeness flag for day 31 of the month.

    D. FORMAT OF HOURLY FILES
       (hly-*.txt)

       Each file contains the values of one parameter for each hour of the day 
       at all qualifying stations. There is one record per station-calendar day.

       The variables in each record include the following:

       Variable  Columns  Type
       ----------------------------
       STNID       1- 11  Character
       MONTH      13- 14  Integer
       DAY        16- 17  Integer
       VALUE1     19- 23  Integer
       FLAG1      24- 24  Character
       - - - - - - - - - - - - - - 
       VALUE24   180-184  Integer
       FLAG24    185-185  Character
       ----------------------------

       These variables have the following definitions:

       STNID   is the GHCN-Daily station identification code
       MONTH   is the month in the 30-year period used. 01=January; 12=December
       DAY     is the day in the 30-year period used. Varies from 1 to 31 in each 
               record.
       VALUE1  is the value for the first hour of the day
       FLAG1   is a completeness flag based on the WMO normals classification, for 
               the first hour of the day. See Flags Section below.
       - - - -
       Value24 is the value for last hour of the month.
       Flag24  is the completeness flag for the last hour of the day

    E. FORMAT OF STATION INVENTORIES
       (*-inventory.txt, allstations.txt)

       Each file contains on station per line.

       The variables in each record include the following:
       ------------------------------
       Variable   Columns   Type
       ------------------------------
       ID            1-11   Character
       LATITUDE     13-20   Real
       LONGITUDE    22-30   Real
       ELEVATION    32-37   Real
       STATE        39-40   Character
       NAME         42-71   Character
       GSNFLAG      73-75   Character
       HCNFLAG      77-79   Character
       WMOID        81-85   Character
       METHOD*	    87-99   Character
       ------------------------------

       These variables have the following definitions:

       ID         is the station identification code.  Note that the first two
                  characters denote the FIPS country code, the third character 
                  is a network code that identifies the station numbering system 
                  used, and the remaining eight characters contain the actual 
                  station ID.
       LATITUDE   is latitude of the station (in decimal degrees).
       LONGITUDE  is the longitude of the station (in decimal degrees).
       ELEVATION  is the elevation of the station (in meters, missing = -999.9).
       STATE      is the U.S. postal code for the state (for U.S. stations only).
       NAME       is the name of the station.
       GSNFLAG    is a flag that indicates whether the station is part of the GCOS
                  Surface Network (GSN). The flag is assigned by cross-referencing 
                  the number in the WMOID field with the official list of GSN 
                  stations. There are two possible values:

                  Blank = non-GSN station or WMO Station number not available
                  GSN   = GSN station 

       HCNFLAG    is a flag that indicates whether the station is part of the U.S.
                  Historical Climatology Network (HCN).  There are two possible 
		  values:

                  Blank = non-HCN station
                  HCN   = HCN station

       WMOID      is the World Meteorological Organization (WMO) number for the
                  station. If the station has no WMO number, then the field is blank.
       METHOD*    is an indication of whether a "traditional" or a "pseudonormals"
                  approach was utilized for temperature or precipitation. This field
		  in only found in prcp-inventory.txt and temp-inventory.txt

IV. UNITS

    tenths of degrees Fahrenheit for maximum, minimum, average, dew point, heat 
    index, wind chill, and air temperature normals and standard deviations. 
    e.g., "703" is 70.3F

    tenths of days for the number of days per month above or below certain threshold, 
    such as days above 90F. e.g., "256" is 25.6 days.

    whole degrees Fahrenheit for heating and cooling degree days (except high
    precision files while are in hundredths of degrees Fahrenheit).

    hundredths of inches for average monthly/seasonal/annual precipitation, 
    month-to-date/year-to-date precipitation, and percentiles of precipitation. 
    e.g., "1" is 0.01" and "1486" is 14.86"

    tenths of inches for average monthly/seasonal/annual snowfall, 
    month-to-date/year-to-date snowfall, and percentiles of snowfall. 
    e.g. "39" is 3.9"

    whole inches for percentiles of snow depth.

    tenths of percent for probabilities of precipitation, snowfall, or snow 
    depth exceeding a specific threshold, as well as cloud and wind percentages. 
    e.g., "207" is 20.7%
    
    tenths of degree hours for heating and cooling degree hours. e.g., "152" is 15.2
    
    tenths of millibars for mean sea level pressure normals. 
    e.g., "10147" is 1014.7 mb
    
    tenths of percent for prevailing and secondary wind direction percentages. 
    e.g., "299" is 29.9%
    
    prevailing and secondary wind directions can take on 8 values: 
    1=N, 2=NE, 3=E, 4=SE, 5=S, 6=SW, 7=W, 8=NW
    
    tenths of mph for wind speeds and vector magnitudes. e.g. "73" is 7.3 mph
    
    whole degrees for mean vector wind directions

V. SPECIAL VALUES

    -9999: missing or insufficient data; values cannot be computed
    -8888: date not defined (e.g. February 30, September 31) - used in daily files to
           achieve fixed-length records 
    -7777: a non-zero value that would round to zero, for variables bound by zero.
    -6666: parameter undefined; used in precipitation/snowfall/snow depth percentiles 
           when number of nonzero values is insufficient
    -5555: parameter not available because it was inconsistent with another parameter          

VI. FLAGS

    Flags accompany every Normals value and indicate the completeness of the data 
    record used to compute each value, accounting for methodological differences for
    different product classes. There are six flag options described generally below.
    Due to methodological differences, the flags are applied somewhat differently
    between the temperature-based normals and the precipitation-based and hourly 
    normals. For the precipitation-based and hourly normals, the following flags were
    assigned independently for each normals value reported based on number of years
    available for that individual calculation. For temperature-based normals, strong 
    precedence is given to the monthly normals of maximum and minimum temperature, 
    and all other temperature-related normals at the daily, monthly, seasonal, and 
    annual timescales are equivalent to or derived from the flags for these two 
    variables. 
 	
    C = complete (all 30 years used)
    S = standard (no more than 5 years missing and no more than 3 consecutive 
        years missing among the sufficiently complete years)
    R = representative (observed record utilized incomplete, but value was scaled
        or based on filled values to be representative of the full period of record)
    P = provisional (at least 10 years used, but not sufficiently complete to be 
        labeled as standard or representative). Also used for parameter values on 
        February 29 as well as for interpolated daily precipitation, snowfall, and
        snow depth percentiles. 
    Q = quasi-normal (at least 2 years per month, but not sufficiently complete to 
        be labeled as provisional or any other higher flag code. The associated
        value was computed using a pseudonormals approach or derived from monthly
        pseudonormals.
    Blank = the data value is reported as a special value such as -9999
   
    Notes: Flags Q and R are not applicable for hourly normals. Flags Q and R also
    aren't applicable to average number of days with different precipitation, 
    snowfall, and snow depth threshold exceedance; precipitation/snowfall/snow 
    depth probabilities of occurrence; and daily precipitation/snowfall/snow depth 
    percentiles. Further, Q flags are not applicable for standard deviations. High-
    precision degree day values are presented without corresponding flags. 
