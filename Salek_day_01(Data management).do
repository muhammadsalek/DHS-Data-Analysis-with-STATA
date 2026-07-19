/*******************************************************************************
*                         DHS DATA ANALYSIS WITH STATA
*                         Episode 01: Import, Clean & Explore
*                         =================================
*
*  Instructor: Md Salek Miah
*  Department of Statistics
*  Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
*  Email: saleksta@gmail.com
*  ORCID: 0009-0005-5973-461X
*  YouTube: Salek Data Lab
*
*  Dataset: BDHS 2022 Individual Recode (IR)
*  File: BDIR81FL.DTA
*
*  This do-file is designed for BEGINNERS
*  Each command is explained with comments
*  Follow step-by-step for complete data preparation
*
*  Note: DHS datasets must be obtained from https://dhsprogram.com
*  This code is for educational purposes only.
*
*******************************************************************************/

/*==============================================================================
  BLOCK 1: ENVIRONMENT SETUP & DATA IMPORT
  Purpose: Prepare Stata environment and load the DHS dataset
  ==============================================================================*/

*------------------------------------------------------------------------------
* STEP 1: Clear memory
*------------------------------------------------------------------------------
* clear all = Removes any previously loaded data from Stata's memory
* This ensures we start with a clean workspace
clear all

*------------------------------------------------------------------------------
* STEP 2: Increase variable limit
*------------------------------------------------------------------------------
* set maxvar 30000 = Tells Stata to allow up to 30,000 variables
* DHS datasets typically have 3,000+ variables
* Without this, Stata may show error: "too many variables"
set maxvar 30000

*------------------------------------------------------------------------------
* STEP 3: Set working directory
*------------------------------------------------------------------------------
* cd = Change Directory - tells Stata where your files are located
* Always update this path to match your computer's folder structure
cd "E:\f drives\Youtube\Plylists 2\BDHS data\BDIR81DT"

*------------------------------------------------------------------------------
* STEP 4: Load the DHS dataset
*------------------------------------------------------------------------------
* use = Opens (loads) a Stata dataset
* "BDIR81FL.DTA" = The DHS Individual Recode file
* clear = Removes any existing data before loading (safety measure)
use "BDIR81FL.DTA", clear

*------------------------------------------------------------------------------
* STEP 5: Quick dataset verification
*------------------------------------------------------------------------------
* describe = Shows variable names, types, and labels
* codebook, compact = Shows variable summary in compact format
describe
codebook, compact

/*==============================================================================
  BLOCK 2: SURVEY DESIGN SETUP
  Purpose: Set up complex survey design for correct standard errors
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING DHS SURVEY DESIGN
*------------------------------------------------------------------------------
* DHS uses complex survey design with:
*  1. Sampling weight (v005) - Adjusts for unequal selection probability
*  2. Primary Sampling Unit (v021) - Clusters (villages/neighborhoods)
*  3. Strata (v022) - Geographic and urban-rural stratification
*
* Without proper survey design setup, all standard errors and p-values will be WRONG!
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 6: Create survey weight variable
*------------------------------------------------------------------------------
* gen = Generate (create) a new variable
* WGT = Name of the new variable (short for Weight)
* v005 = DHS variable for women's individual sample weight
* / 1000000 = DHS stores weights multiplied by 1,000,000 to preserve precision
* 
* Formula: gen new_variable_name = (existing_variable / 1000000)
gen WGT = (v005 / 1000000)

*------------------------------------------------------------------------------
* STEP 7: Label the weight variable
*------------------------------------------------------------------------------
* label variable = Attaches a descriptive label to a variable
* This label appears in tables and outputs
* 
* Syntax: label variable variable_name "Description"
label variable WGT "Survey Weight"

*------------------------------------------------------------------------------
* STEP 8: Declare survey design (MOST IMPORTANT STEP!)
*------------------------------------------------------------------------------
* svyset = Declare survey design for complex survey data
* [pw=WGT] = Probability weight (pw = pweight)
* psu(v021) = Primary Sampling Unit (cluster variable)
* strata(v022) = Stratification variable
* 
* This command tells Stata how to calculate correct standard errors
* Without this, all results will be WRONG!
svyset [pw=WGT], psu(v021) strata(v022)

*------------------------------------------------------------------------------
* STEP 9: Verify survey design
*------------------------------------------------------------------------------
* svydescribe = Shows survey design information (strata, PSU, weight)
* Confirms that svyset was set up correctly
svydescribe

*------------------------------------------------------------------------------
* STEP 10: Explore survey variables
*------------------------------------------------------------------------------
* describe v020 = Shows information about variable v020
* codebook v020 = Shows detailed information about v020
* svy: tab v020 = Weighted frequency table of v020
describe v020
codebook v020
svy: tab v020

/*==============================================================================
  BLOCK 3: OUTCOME VARIABLES - DEPRESSION & ANXIETY
  Purpose: Create binary outcome variables for analysis
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING OUTCOME VARIABLE CREATION
*------------------------------------------------------------------------------
* Rule for creating categorical variables:
*   STEP 1: gen variable_name = .  (create variable with missing values)
*   STEP 2: replace variable_name = value if condition (assign categories)
*   STEP 3: label define name_lbl value "Label" (define value labels)
*   STEP 4: label values variable_name name_lbl (apply labels)
*   STEP 5: label variable variable_name "Description" (add variable label)
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 11: Create DEPRESSION variable (PHQ-9 score)
*------------------------------------------------------------------------------
* mth22 = PHQ-9 depression score (0-27)
* Clinical cut-off: Score >= 10 indicates moderate depression
* 
* STEP 1: Create variable with missing values (.)
gen depression_cat = .

* STEP 2: Assign categories based on condition
* replace variable_name = value if condition
* !missing(mth22) = Exclude missing values (mth22 is not missing)
replace depression_cat = 1 if mth22 >= 10 & mth22 <= 27  // 1 = Yes (depression)
replace depression_cat = 0 if mth22 < 10 & !missing(mth22) // 0 = No (no depression)

*------------------------------------------------------------------------------
* STEP 12: Create ANXIETY variable (GAD-7 score)
*------------------------------------------------------------------------------
* mth24 = GAD-7 anxiety score (0-21)
* Clinical cut-off: Score >= 10 indicates moderate anxiety
gen anxiety_cat = .
replace anxiety_cat = 1 if mth24 >= 10 & mth24 <= 21
replace anxiety_cat = 0 if mth24 < 10 & !missing(mth24)

*------------------------------------------------------------------------------
* STEP 13: Define value labels (dictionary)
*------------------------------------------------------------------------------
* label define = Create a label definition (dictionary)
* yesno = Name of the label definition
* 0 "No" = Value 0 displays as "No"
* 1 "Yes" = Value 1 displays as "Yes"
label define yesno 0 "No" 1 "Yes"

*------------------------------------------------------------------------------
* STEP 14: Apply value labels to variables
*------------------------------------------------------------------------------
* label values = Attach a label definition to a variable
* This makes outputs display "No" and "Yes" instead of 0 and 1
label values depression_cat yesno
label values anxiety_cat yesno

*------------------------------------------------------------------------------
* STEP 15: Add variable labels
*------------------------------------------------------------------------------
* label variable = Add a descriptive label to the variable
* This is what appears in tables and outputs
label variable depression_cat "Depression (PHQ-9 >=10 = Yes)"
label variable anxiety_cat "Anxiety (GAD-7 >=10 = Yes)"

*------------------------------------------------------------------------------
* STEP 16: Check variable frequencies
*------------------------------------------------------------------------------
* tabulate = Creates a frequency table (shows counts and percentages)
* missing = Includes missing values in the table
* This helps verify that the coding worked correctly
tabulate depression_cat, missing
tabulate anxiety_cat, missing

*------------------------------------------------------------------------------
* STEP 17: Optional - Drop missing values (Complete-case analysis)
*------------------------------------------------------------------------------
* drop if missing(variable) = Removes observations with missing values
* Complete-case analysis keeps only observations with complete data
* Use caution - this can reduce sample size significantly
* Uncomment to use:
* drop if missing(depression_cat)
* drop if missing(anxiety_cat)

/*==============================================================================
  BLOCK 4: SOCIODEMOGRAPHIC VARIABLES
  Purpose: Recode demographic variables for analysis
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING AGE GROUP CREATION
*------------------------------------------------------------------------------
* AGE GROUPS: Creating 7 standard age categories (15-49 years)
* This follows standard DHS reporting format
* v012 = Age in years (continuous variable 15-49)
* 
* Step-by-step approach:
*   1. Create empty variable: gen women_age = .
*   2. Assign each category: replace women_age = value if condition
*   3. Define labels: label define agegroup ...
*   4. Apply labels: label values women_age agegroup
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 18: Create AGE GROUP variable
*------------------------------------------------------------------------------
* gen women_age = .  = Create variable with missing values
gen women_age = .

* inrange(v012, 15, 19) = Checks if v012 is between 15 and 19 (inclusive)
replace women_age = 1 if inrange(v012, 15, 19)   // 15-19 years
replace women_age = 2 if inrange(v012, 20, 24)   // 20-24 years
replace women_age = 3 if inrange(v012, 25, 29)   // 25-29 years
replace women_age = 4 if inrange(v012, 30, 34)   // 30-34 years
replace women_age = 5 if inrange(v012, 35, 39)   // 35-39 years
replace women_age = 6 if inrange(v012, 40, 44)   // 40-44 years
replace women_age = 7 if inrange(v012, 45, 49)   // 45-49 years

*------------------------------------------------------------------------------
* STEP 19: Label AGE GROUPS
*------------------------------------------------------------------------------
* label define = Create value labels for age groups
* replace = Update existing label definition
label define agegroup 1 "15–19" 2 "20–24" 3 "25–29" 4 "30–34" 5 "35–39" 6 "40–44" 7 "45–49", replace
label values women_age agegroup

*------------------------------------------------------------------------------
* STEP 20: Check age distribution
*------------------------------------------------------------------------------
* tab = Short form of tabulate (frequency table)
tab women_age

*------------------------------------------------------------------------------
* UNDERSTANDING EDUCATION RECODING
*------------------------------------------------------------------------------
* EDUCATION: Recoding into 3 standard categories
* v106 = Highest educational level (DHS variable)
*   0 = No education
*   1 = Primary
*   2 = Secondary
*   3 = Higher
* 
* We merge No education and Primary into "No/Primary"
* This is a common practice in DHS analysis
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 21: Create EDUCATION variable
*------------------------------------------------------------------------------
gen education_woman = .

* if v106 <= 1 = No education OR Primary
replace education_woman = 0 if v106 <= 1

* if v106 == 2 = Secondary (complete or incomplete)
replace education_woman = 1 if v106 == 2

* if v106 >= 3 = Higher education
replace education_woman = 2 if v106 >= 3

*------------------------------------------------------------------------------
* STEP 22: Label EDUCATION variable
*------------------------------------------------------------------------------
label define edu_lbl 0 "No/Primary" 1 "Secondary Incomplete" 2 "Secondary+"
label values education_woman edu_lbl

*------------------------------------------------------------------------------
* STEP 23: Check education distribution
*------------------------------------------------------------------------------
tab education_woman

/*==============================================================================
  BLOCK 5: EMPOWERMENT & IPV (INTIMATE PARTNER VIOLENCE)
  Purpose: Create composite empowerment index and IPV variables
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING EMPOWERMENT INDEX CREATION
*------------------------------------------------------------------------------
* EMPOWERMENT INDEX: Composite measure of women's autonomy
* We create 5 separate decision-making indicators
* Then combine them into a score (0-5)
* Finally categorize as "Empowered" or "Not Empowered"
* 
* Decision-making indicators:
*   v743a = Decision on own health
*   v743b = Decision on large purchases
*   v743f = Decision on household money
*   v743d = Decision on visits to family
*   v632 = Decision on family planning
* 
* inlist(v743a, 1, 2) = Checks if v743a is 1 OR 2
*   1 = Respondent alone decides
*   2 = Respondent and husband/partner jointly decide
*   3 = Husband/partner alone decides
*   4 = Someone else decides
*   
* "Respondent alone or joint" = Empowered (participates in decision)
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 24: Create individual empowerment indicators
*------------------------------------------------------------------------------
* gen emp_health = inlist(v743a, 1, 2)  = 1 if participant, 0 otherwise
gen emp_health = inlist(v743a, 1, 2)        // Decision on own health
gen emp_purchase = inlist(v743b, 1, 2)      // Decision on large purchases
gen emp_money = inlist(v743f, 1, 2)         // Decision on household money
gen emp_visit = inlist(v743d, 1, 2)         // Decision on visits to family
gen emp_fp = inlist(v632, 1, 3)             // Decision on family planning

*------------------------------------------------------------------------------
* STEP 25: Create composite empowerment score
*------------------------------------------------------------------------------
* Add all 5 indicators together -> Score ranges 0-5
gen emp_score = emp_health + emp_purchase + emp_money + emp_visit + emp_fp

*------------------------------------------------------------------------------
* STEP 26: Create binary empowerment variable
*------------------------------------------------------------------------------
* Score <= 2 = Not empowered (low decision-making autonomy)
* Score >= 3 = Empowered (high decision-making autonomy)
gen emp_level = .
replace emp_level = 0 if emp_score <= 2   // Not empowered
replace emp_level = 1 if emp_score >= 3   // Empowered

*------------------------------------------------------------------------------
* STEP 27: Label empowerment variable
*------------------------------------------------------------------------------
label define emp_lbl 0 "No" 1 "Yes"
label values emp_level emp_lbl

*------------------------------------------------------------------------------
* STEP 28: Check empowerment distribution
*------------------------------------------------------------------------------
tab emp_level

*------------------------------------------------------------------------------
* UNDERSTANDING IPV JUSTIFICATION VARIABLE
*------------------------------------------------------------------------------
* IPV = Intimate Partner Violence
* We measure attitudes justifying wife beating
* v744a-e = Justification for wife beating in various situations:
*   v744a = If wife goes out without telling husband
*   v744b = If wife neglects children
*   v744c = If wife argues with husband
*   v744d = If wife refuses sex
*   v744e = If wife burns food
*
* Values: 1 = Yes (justifies beating), 0 = No (does not justify)
*         2 = Don't know (we recode to missing)
* 
* We create binary variable: "Justifies IPV in any condition"
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 29: Check IPV variables
*------------------------------------------------------------------------------
tab v744a
tab v744b
tab v744c
tab v744d
tab v744e

*------------------------------------------------------------------------------
* STEP 30: Recode "Don't know" to missing
*------------------------------------------------------------------------------
* foreach = Loop through a list of variables
* var in v744a v744b v744c v744d v744e = List of variables to process
* replace `var' = . if `var' == 2 = Replace value 2 with missing for each variable
* The backticks (`var`) tell Stata to use the variable name
foreach var in v744a v744b v744c v744d v744e {
    replace `var' = . if `var' == 2
}

*------------------------------------------------------------------------------
* STEP 31: Create IPV justification binary variable
*------------------------------------------------------------------------------
gen ipv_justified = 0
* | = OR operator: true if ANY condition is true
replace ipv_justified = 1 if v744a == 1 | v744b == 1 | v744c == 1 | v744d == 1 | v744e == 1

*------------------------------------------------------------------------------
* STEP 32: Label IPV variable
*------------------------------------------------------------------------------
label define ipv_lbl 0 "Does not justify IPV" 1 "Justifies IPV"
label values ipv_justified ipv_lbl
label variable ipv_justified "Justification of intimate partner violence (any condition)"

*------------------------------------------------------------------------------
* STEP 33: Check IPV variable
*------------------------------------------------------------------------------
tab ipv_justified, missing

/*==============================================================================
  BLOCK 6: HOUSEHOLD MEDIA AND ASSETS
  Purpose: Create household-level variables for media access and assets
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING MEDIA ACCESS VARIABLE
*------------------------------------------------------------------------------
* Media access is a composite measure of household information access
* We combine 4 variables:
*   v120 = Has radio (0=No, 1=Yes)
*   v121 = Has TV (0=No, 1=Yes)
*   v157 = Reads newspaper (0=No, 1=Yes)
*   v169a = Has mobile phone (0=No, 1=Yes)
* 
* hh_media = 1 if household has ANY media access
* hh_media = 0 if household has NO media access
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 34: Check media variables
*------------------------------------------------------------------------------
tab v120
describe v120
codebook v120

tab v121
describe v121
codebook v121

tab v157
describe v157
codebook v157

tab v169a
describe v169a
codebook v169a

*------------------------------------------------------------------------------
* STEP 35: Rename media variables for clarity
*------------------------------------------------------------------------------
* rename = Changes variable name (makes code more readable)
rename v120 hh_radio
rename v121 hh_tv
rename v157 hh_newspaper
rename v169a hh_mobile

*------------------------------------------------------------------------------
* STEP 36: Create combined media variable
*------------------------------------------------------------------------------
gen hh_media = 0
* | = OR operator: any media access = 1
* hh_newspaper > 0 = Newspaper access (0=No, 1=Yes)
replace hh_media = 1 if hh_radio == 1 | hh_tv == 1 | hh_newspaper > 0 | hh_mobile == 1

*------------------------------------------------------------------------------
* STEP 37: Label media variable
*------------------------------------------------------------------------------
label define media_lbl 0 "No media" 1 "Has media"
label values hh_media media_lbl

*------------------------------------------------------------------------------
* STEP 38: Check media distribution
*------------------------------------------------------------------------------
tab hh_media

*------------------------------------------------------------------------------
* UNDERSTANDING HOUSEHOLD ASSETS VARIABLE
*------------------------------------------------------------------------------
* Household assets indicate socioeconomic status
* We combine 4 variables:
*   v122 = Refrigerator (0=No, 1=Yes)
*   v123 = Bicycle (0=No, 1=Yes)
*   v124 = Motorcycle/Scooter (0=No, 1=Yes)
*   v125 = Car/Truck (0=No, 1=Yes)
* 
* hh_assets = 1 if household owns ANY major asset
* hh_assets = 0 if household owns NO major assets
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 39: Check asset variables
*------------------------------------------------------------------------------
tab v122
describe v122
codebook v122

tab v123
describe v123
codebook v123

tab v124
describe v124
codebook v124

tab v125
describe v125
codebook v125

*------------------------------------------------------------------------------
* STEP 40: Create combined asset variable
*------------------------------------------------------------------------------
gen hh_assets = 0
* inlist(v122, 1) = Checks if v122 is 1 (Yes)
replace hh_assets = 1 if inlist(v122, 1) | inlist(v123, 1) | inlist(v124, 1) | inlist(v125, 1)

*------------------------------------------------------------------------------
* STEP 41: Label asset variable
*------------------------------------------------------------------------------
label define hh_assets_lbl 0 "No" 1 "Yes"
label values hh_assets hh_assets_lbl
label variable hh_assets "Household owns any major asset (refrigerator, bicycle, motorcycle/scooter, car/truck)"

*------------------------------------------------------------------------------
* STEP 42: Check asset distribution
*------------------------------------------------------------------------------
tab hh_assets

/*==============================================================================
  BLOCK 7: HOUSEHOLD MATERIALS
  Purpose: Create household materials quality variable (Improved vs Unimproved)
  ==============================================================================*/

*------------------------------------------------------------------------------
* UNDERSTANDING HOUSEHOLD MATERIALS VARIABLE
*------------------------------------------------------------------------------
* We measure housing quality using construction materials
* Three components:
*   v128 = Wall material
*   v127 = Floor material
*   v129 = Roof material
* 
* "Improved" materials indicate better housing quality
* This is a common socioeconomic indicator in DHS
* 
* Improved materials = Cement, Brick, Tiles, Tin, Concrete
* Unimproved materials = Mud, Straw, Wood, Bamboo, Other
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 43: Check materials variables
*------------------------------------------------------------------------------
tab v128
describe v128
codebook v128

tab v127
describe v127
codebook v127

tab v129
describe v129
codebook v129

*------------------------------------------------------------------------------
* STEP 44: Create household materials variable
*------------------------------------------------------------------------------
gen hh_materials = 0   // default = unimproved

* WALL MATERIAL: Assign 1 if improved
* These codes represent improved wall materials in DHS
replace hh_materials = 1 if inlist(v128, 31, 34, 35, 36, 37, 38, 39)

* FLOOR MATERIAL: Assign 1 if improved
replace hh_materials = 1 if inlist(v127, 34, 30, 31, 32, 33)

* ROOF MATERIAL: Assign 1 if improved
replace hh_materials = 1 if inlist(v129, 31, 35, 36, 37, 38, 39)

* Treat "not dejure resident" as unimproved
replace hh_materials = 0 if inlist(v128, 97) | inlist(v127, 97) | inlist(v129, 97)

*------------------------------------------------------------------------------
* STEP 45: Label materials variable
*------------------------------------------------------------------------------
label define hh_materials_lbl 0 "Unimproved" 1 "Improved"
label values hh_materials hh_materials_lbl
label variable hh_materials "Household materials quality (Improved vs Unimproved)"

*------------------------------------------------------------------------------
* STEP 46: Check materials distribution
*------------------------------------------------------------------------------
tab hh_materials

/*==============================================================================
  BLOCK 8: ADDITIONAL SOCIODEMOGRAPHIC VARIABLES
  Purpose: Create remaining demographic variables
  ==============================================================================*/

*------------------------------------------------------------------------------
* STEP 47: PLACE OF RESIDENCE (Urban/Rural)
*------------------------------------------------------------------------------
* v025 = Type of place of residence (1=Urban, 2=Rural)
rename v025 area

* Check distribution before labeling
tab area, mis

* Define and apply labels
label define area_label 1 "Urban" 2 "Rural"
label values area area_label

* Check after labeling
tabulate area

*------------------------------------------------------------------------------
* STEP 48: ADMINISTRATIVE DIVISION
*------------------------------------------------------------------------------
* v024 = Region/Division (1-8 for Bangladesh)
rename v024 hh_division

* Check distribution
tab hh_division, mis

*------------------------------------------------------------------------------
* STEP 49: RELIGION
*------------------------------------------------------------------------------
* v130 = Religious affiliation (coded in DHS)
rename v130 religion

* Check distribution
tab religion

*------------------------------------------------------------------------------
* STEP 50: HOUSEHOLD WEALTH INDEX
*------------------------------------------------------------------------------
* v190 = Wealth index quintile (1=Poorest, 2=Poorer, 3=Middle, 4=Richer, 5=Richest)
rename v190 hh_wealth
label variable hh_wealth "Household Wealth Index"

* Check distribution
tab hh_wealth, mis

*------------------------------------------------------------------------------
* STEP 51: HOUSEHOLD SIZE (Categorical)
*------------------------------------------------------------------------------
* v136 = Number of household members
tab v136, mis

* Create binary household size category
gen hh_size_cat = .
replace hh_size_cat = 1 if v136 <= 5   // Small household (1-5 members)
replace hh_size_cat = 0 if v136 > 5    // Large household (6+ members)

* Define and apply labels
label define hh_size_cat_lbl 1 "<=5" 0 ">5"
label values hh_size_cat hh_size_cat_lbl
label variable hh_size_cat "Categories of size of household"

* Check distribution
tab hh_size_cat, mis

/*==============================================================================
  BLOCK 9: DATA CLEANING & FINAL SAVE
  Purpose: Handle missing data and save cleaned dataset
  ==============================================================================*/

*------------------------------------------------------------------------------
* STEP 52: Check missing values
*------------------------------------------------------------------------------
* misstable summarize = Shows missing values for all variables
misstable summarize

* Check missing in key variables
misstable summarize depression_cat anxiety_cat women_age education_woman hh_wealth

*------------------------------------------------------------------------------
* UNDERSTANDING MISSING DATA HANDLING
*------------------------------------------------------------------------------
* Options for handling missing data:
*   1. Complete-case analysis: Drop observations with any missing values
*   2. Imputation: Fill in missing values (advanced)
*   3. Keep missing: Include missing in analysis (handled by Stata)
* 
* Complete-case analysis (most common in DHS studies):
*   drop if missing(var1, var2, var3) = Drops if ANY variable is missing
* 
* CAUTION: Dropping cases can reduce sample size and introduce bias
* Always report the number of observations dropped
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* STEP 53: Optional - Drop missing values (Complete-case analysis)
*------------------------------------------------------------------------------
* Uncomment these lines to perform complete-case analysis
* drop if missing(depression_cat)
* drop if missing(anxiety_cat)
* drop if missing(women_age)
* drop if missing(education_woman)

*------------------------------------------------------------------------------
* STEP 54: Save the cleaned dataset
*------------------------------------------------------------------------------
* save = Save the dataset to disk
* "clean_IR" = Name of the new dataset
* replace = Overwrite existing file if it exists
save "E:\f drives\Youtube\Plylists 2\BDHS data\clean_IR", replace

*------------------------------------------------------------------------------
* STEP 55: Final dataset summary
*------------------------------------------------------------------------------
* describe = Show dataset structure
describe

* browse in 1/10 = View first 10 observations (opens data viewer)
browse in 1/10

* summarize = Show descriptive statistics for key variables
summarize depression_cat anxiety_cat women_age education_woman, separator(0)

*------------------------------------------------------------------------------
* STEP 56: Weighted frequencies for outcomes (After complete data preparation)
*------------------------------------------------------------------------------
* Weighted frequencies = Population-representative estimates
* svy: tab = Weighted frequency table with proper standard errors
svy: tab depression_cat
svy: tab anxiety_cat

/*******************************************************************************
*                           END OF DATA PREPARATION
*
*  This completes the data preparation pipeline:
*  =============================================
*  
*  BLOCK 1: Environment Setup & Data Import
*    - clear all, set maxvar, cd, use, describe
*  
*  BLOCK 2: Survey Design Setup
*    - gen WGT, label variable, svyset, svydescribe
*  
*  BLOCK 3: Outcome Variables (Depression & Anxiety)
*    - gen, replace, label define, label values, label variable
*  
*  BLOCK 4: Sociodemographic Variables
*    - Age groups, Education
*  
*  BLOCK 5: Empowerment & IPV
*    - Composite empowerment index, IPV justification
*  
*  BLOCK 6: Household Media and Assets
*    - Combined media access, combined assets
*  
*  BLOCK 7: Household Materials
*    - Improved vs Unimproved housing materials
*  
*  BLOCK 8: Additional Variables
*    - Residence, Division, Religion, Wealth, Household size
*  
*  BLOCK 9: Data Cleaning & Save
*    - misstable, drop if missing, save, browse, summarize
*  
*
*  RECOMMENDED NEXT STEPS:
*  ========================
*  1. Run descriptive statistics for all variables
*  2. Create publication-ready tables using table command
*  3. Run weighted logistic regression (svy: logistic)
*  4. Generate odds ratios and confidence intervals
*  5. Create forest plots for visualization
*  6. Prepare tables for manuscript submission
*
*
*  INSTRUCTOR: Md Salek Miah
*  Department of Statistics, SUST
*  Email: saleksta@gmail.com
*  ORCID: 0009-0005-5973-461X
*  YouTube: Salek Data Lab
*
*  "Turning complex data into simple public health solutions"
*
*******************************************************************************/