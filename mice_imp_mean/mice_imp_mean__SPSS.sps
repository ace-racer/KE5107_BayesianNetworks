DATA LIST FILE= "/Users/davidleonardi/Projects/KE5107_BayesianNetworks/mice_imp_mean/mice_imp_mean__SPSS.txt"  free (TAB)
   / Imputation_ GV_CURBWGT GV_DVLAT GV_DVLONG GV_ENERGY 
  GV_LANES GV_MODELYR GV_OTVEHWGT GV_SPLIMIT GV_WGTCDTR 
  OA_AGE OA_BAGDEPLY OA_HEIGHT OA_MAIS OA_MANUSE OA_SEX 
  OA_WEIGHT VE_GAD1 VE_ORIGAVTW VE_WHEELBAS VE_PDOF_TR 
  GV_FOOTPRINT .


VARIABLE LABELS
  Imputation_ "Imputation_" 
 GV_CURBWGT "GV_CURBWGT" 
 GV_DVLAT "GV_DVLAT" 
 GV_DVLONG "GV_DVLONG" 
 GV_ENERGY "GV_ENERGY" 
 GV_LANES "GV_LANES" 
 GV_MODELYR "GV_MODELYR" 
 GV_OTVEHWGT "GV_OTVEHWGT" 
 GV_SPLIMIT "GV_SPLIMIT" 
 GV_WGTCDTR "GV_WGTCDTR" 
 OA_AGE "OA_AGE" 
 OA_BAGDEPLY "OA_BAGDEPLY" 
 OA_HEIGHT "OA_HEIGHT" 
 OA_MAIS "OA_MAIS" 
 OA_MANUSE "OA_MANUSE" 
 OA_SEX "OA_SEX" 
 OA_WEIGHT "OA_WEIGHT" 
 VE_GAD1 "VE_GAD1" 
 VE_ORIGAVTW "VE_ORIGAVTW" 
 VE_WHEELBAS "VE_WHEELBAS" 
 VE_PDOF_TR "VE_PDOF_TR" 
 GV_FOOTPRINT "GV_FOOTPRINT" 
 .

VALUE LABELS
 / GV_LANES 
   1 "1"
   2 "2"
   3 "3"
   4 "4"
   5 "5"
   6 "6"
   7 "7"
 / GV_MODELYR 
   1 "2000"
   2 "2001"
   3 "2002"
   4 "2003"
   5 "2004"
   6 "2005"
   7 "2006"
   8 "2007"
   9 "2008"
   10 "2009"
   11 "2010"
   12 "2011"
   13 "2012"
 / GV_WGTCDTR 
   1 "Passenger Car"
   2 "Truck (<=10000 lbs.)"
   3 "Truck (<=6000 lbs.)"
 / OA_BAGDEPLY 
   1 "Deployed"
   2 "Not Deployed"
 / OA_MAIS 
   1 "0"
   2 "1"
   3 "2"
   4 "3"
   5 "4"
   6 "5"
   7 "6"
 / OA_MANUSE 
   1 "0"
   2 "1"
 / OA_SEX 
   1 ""
   2 "Female"
   3 "Male"
 / VE_GAD1 
   1 ""
   2 "Front"
   3 "Left"
   4 "Rear"
   5 "Right"
 .

EXECUTE.
SORT CASES by Imputation_.
SPLIT FILE layered by Imputation_.
