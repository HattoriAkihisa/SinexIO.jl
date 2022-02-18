# blocks
defined_blocks_str = "
FILE/REFERENCE
FILE/COMMENT
INPUT/HISTORY
INPUT/FILES
INPUT/ACKNOWLEDGEMENTS
NUTATION/DATA
PRECESSION/DATA
SOURCE/ID
SITE/ID
SITE/DATA
SITE/RECEIVER
SITE/ANTENNA
SITE/GPS_PHASE_CENTER
SITE/ECCENTRICITY
BIAS/EPOCHS
SOLUTION/EPOCHS
SOLUTION/STATISTICS
SOLUTION/ESTIMATE
SOLUTION/APRIORI
SOLUTION/MATRIX_ESTIMATE {p} {type}
SOLUTION/MATRIX_APRIORI {p} {type}
SOLUTION/NORMAL_EQUATION_VECTOR
SOLUTION/NORMAL_EQUATION_MATRIX {p}
"
p_list = ["L", "U"]
type_list = ["CORR", "COVA", "INFO"]

# 3. Header Line (Mandatory)
List_HEADER = [
   "First Character"              "A1"                          
   "Second Character"             "A1"                          
   "Document Type"                "A3"                          
   "Format Version"               "1X,F4.2"                     
   "File Agency Code"             "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Agency Code"                  "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Observation Code"             "1X,A1"                       
   "Number of Esttimates"         "1X,I5.5"                     
   "Constraint Code"              "1X,A1"                       
   "Solution Contents"            "6(1X,A1)"                    
]

# 4. FILE/REFERENCE Block (Mandatory)
List_FILE_REFERENCE = [
   "Information Type"             "1X,A18"                      
   "Information"                  "1X,A60"                      
]

# 5. FILE/COMMENT Block (Optional)
List_FILE_COMMENT = [
   "Comment"                      "1X,A79"                      
]

# 6. INPUT/HISTORY Block (Recommended)
List_INPUT_HISTORY = [
   "File Code"                    "1X,A1"                       
   "Document Type"                "A3"                          
   "Format Version"               "1X,F4.2"                     
   "Agency Code"                  "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Agency Code"                  "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Observation Technique"        "1X,A1"                       
   "Number of Esttimates"         "1X,I5.5"                     
   "Constraint Code"              "1X,A1"                       
   "Solution Contents"            "6(1X,A1)"                    
]

# 7. INPUT/FILES Block (Optional)
List_INPUT_FILES = [
   "Agency Code"                  "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"  
   "File Name"                    "1X,A29"                      
   "File Description"             "1X,A32"                      
]

# 8. INPUT/ACKNOWLEDGEMENTS Block (Optional)
List_INPUT_ACKNOWLEDGEMENTS = [
   "Agency Code"                  "1X,A3"                       
   "Agency Description"           "1X,A75"                      
]

# 9. NUTATION/DATA Block (Mandatory for VLBI)
List_NUTATION_DATA = [
   "Nutation Code"                "1X,A8"                       
   "Comments"                     "1X,A70"                      
]

# 10. PRECESSION/DATA Block (Mandatory for VLBI)
List_PRECESSION_DATA = [
   "Precess. Code"                "1X,A8"                       
   "Comments"                     "1X,A70"                      
]

# 11. SOURCE/ID (Mandatory for VLBI)
List_SOURCE_ID = [
   "Source Code"                  "1X,A4"                       
   "IERS des."                    "1X,A8"                       
   "ICRF des."                    "1X,A16"                      
   "Comments"                     "1X,A68"                      
]

# 12. SITE/ID Block (Mandatory)
List_SITE_ID = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Unique Monument Identification" "1X,A9"                       
   "Observation Code"             "1X,A1"                       
   "Station Description"          "1X,A22"                      
   "Approximate Longitude"        "1X,I3,1X,I2,1X,F4.1"         
   "Approximate Latitude"         "1X,I3,1X,I2,1X,F4.1"         
   "Approximate Height"           "1X,F7.1"                     
]

# 13. SITE/DATA Block (Optional)
List_SITE_DATA = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Observation Code"             "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Agency Code"                  "1X,A3"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
]

# 14. SITE/RECEIVER Block (Mandatory for GNSS)
List_SITE_RECEIVER = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Observation Code"             "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Receiver Type"                "1X,A20"                      
   "Receiver Serial Number"       "1X,A5"                       
   "Receiver Firmware"            "1X,A11"                      
]

# 15. SITE/ANTENNA Block (Mandatory for GNSS)
List_SITE_ANTENNA = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Observation Code"             "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Antenna Type"                 "1X,A20"                      
   "Antenna Serial Number"        "1X,A5"                       
]

# 16a. SITE/GPS_PHASE_CENTER Block (Mandatory for GPS)
List_SITE_GPS_PHASE_CENTER = [
   "Antenna Type"                 "1X,A20"                      
   "Antenna Serial Number"        "1X,A5"                       
   "L1 Phase Center Up Offset"    "1X,F6.4"                     
   "L1 Phase Center North Offset" "1X,F6.4"                     
   "L1 Phase Center East Offset"  "1X,F6.4"                     
   "L2 Phase Center Up Offset"    "1X,F6.4"                     
   "L2 Phase Center North Offset" "1X,F6.4"                     
   "L2 Phase Center East Offset"  "1X,F6.4"                     
   "Antenna Calibration model"    "1X,A10"                      
]

# 16b. SITE/GAL_PHASE_CENTER Block (Mandatory for Galileo)
List_SITE_GAL_PHASE_CENTER = [
   "Antenna Type"                 "1X,A20"                      
   "Antenna Serial Number"        "1X,A5"                       
   "L1 Phase Center Up Offset"    "1X,F6.4"                     
   "L1 Phase Center North Offset" "1X,F6.4"                     
   "L1 Phase Center East Offset"  "1X,F6.4"                     
   "L5 Phase Center Up Offset"    "1X,F6.4"                     
   "L5 Phase Center North Offset" "1X,F6.4"                     
   "L5 Phase Center East Offset"  "1X,F6.4"                     
   "Antenna Calibration model"    "1X,A10"                      
]

# 17. SITE/ECCENTRICITY Block (Mandatory)
List_SITE_ECCENTRICITY = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Observation Code"             "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Eccentricity Reference System" "1X,A3"                       
   "Up / X Eccentricity"          "1X,F8.4"                     
   "North / Y Eccentricity"       "1X,F8.4"                     
   "East / Z Eccentricity"        "1X,F8.4"                     
]

# 18. SATELLITE/ID Block (Recommended for GNSS, if available)
List_SATELLITE_ID = [
    "Site Code"                   "1X,A4"
    "PRN"                         "1X,I2"
    "COSPAR ID"                   "1X,A9"
    "Observation Code"            "1X,A1"
    "Time"                        "1X,I2.2,1H:,I3.3,1H:,I5.5"
    "Time"                        "1X,I2.2,1H:,I3.3,1H:,I5.5"
    "Antenna Type"                "1X,A20"
]

# 19. SATELLITE/PHACE CENTER Block (Mandatory for GNSS, if satellite antenna
#     offsets are not estimated)
List_SATELLITE_PHASE_CENTER = [
    "Site Code"                   "1X,A4"
    "Frequency Code"              "1X,A1"
    "Phase Center Z Offset"       "1X,F6.4"
    "Phase Center X Offset"       "1X,F6.4"
    "Phase Center Y Offset"       "1X,F6.4"
    "Frequency Code"              "1X,A1"
    "Phase Center Z Offset"       "1X,F6.4"
    "Phase Center X Offset"       "1X,F6.4"
    "Phase Center Y Offset"       "1X,F6.4"
    "Antenna Calibration model"   "1X,A10"
    "PCV Type"                    "1X,A1"
    "PCV Model Application"       "1X,A1"
]

# 20. SOLUTION/EPOCHS Block (Mandatory)
List_SOLUTION_EPOCHS = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Observation Code"             "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
]

# 21. BIAS/EPOCHS Block (Mandatory if bias parameters are included)
List_BIAS_EPOCHS = [
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Bias Type"                    "1X,A1"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
]

# 22. SOLUTION/STATISTICS Block (Recommended if available)
List_SOLUTION_STATISTICS = [
   "Information Type"             "1X,A30"                      
   "Information"                  "1X,F22.15"                   
]

# 23. SOLUTION/ESTIMATE Block (Mandatory)
List_SOLUTION_ESTIMATE = [
   "Estimated Parameters Index"   "1X,I5"                       
   "Parameter Type"               "1X,A6"                       
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Parameter Units"              "1X,A4"                       
   "Constraint Code"              "1X,A1"                       
   "Parameter Estimate"           "1X,E21.15"                   
   "Parameter Standard Deviation" "1X,E11.6"                    
]

# 24. SOLUTION/APRIORI Block (Mandatory)
List_SOLUTION_APRIORI = [
   "Parameter Index"              "1X,I5"                       
   "Parameter Type"               "1X,A6"                       
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Parameter Units"              "1X,A4"                       
   "Constraint Code"              "1X,A1"                       
   "Parameter Apriori"            "1X,E21.15"                   
   "Parameter Standard Deviation" "1X,E11.6"                    
]

# 25. SOLUTION/MATRIX_ESTIMATE Block (Mandatory)
List_SOLUTION_MATRIX_ESTIMATE = [
   "Matrix Estimate Row Number"      "1X,I5"                       
   "Matrix Estimate Column Number"   "1X,I5"                       
   "First Matrix Estimate Element"   "1X,E21.14"                   
   "Second Matrix Estimate Element"  "1X,E21.14"                   
   "Third  Matrix Estimate Element"  "1X,E21.14"                   
]

# 26. SOLUTION/MATRIX_APRIORI Block (Recommended/Mandatory)
List_SOLUTION_MATRIX_APRIORI = [
   "Matrix Apriori Row Number"       "1X,I5"                       
   "Matrix Apriori Column Number"    "1X,I5"                       
   "First Matrix Estimate Element"   "1X,E21.16"                   
   "Second Matrix Estimate Element"  "1X,E21.16"                   
   "Third  Matrix Estimate Element"  "1X,E21.16"                   
]

# 27. SOLUTION/NORMAL_EQUATION_VECTOR Block (Mandatory for normal equations)
List_SOLUTION_NORMAL_EQUATION_VECTOR = [
   "Estimated Parameters Index"   "1X,I5"                       
   "Parameter Type"               "1X,A6"                       
   "Site Code"                    "1X,A4"                       
   "Point Code"                   "1X,A2"                       
   "Solution ID"                  "1X,A4"                       
   "Time"                         "1X,I2.2,1H:,I3.3,1H:,I5.5"   
   "Parameter Units"              "1X,A4"                       
   "Constraint Code"              "1X,A1"                       
   "Right hand side of normal equation" "1X,E21.15"                   
]

# 28. SOLUTION/NORMAL_EQUATION_MATRIX Block (Mandatory for normal equations)
List_SOLUTION_NORMAL_EQUATION_MATRIX = [
   "NEQ-Matrix Row Number"        "1X,I5"                       
   "NEQ-Matrix Column Number"     "1X,I5"                       
   "First Matrix Element"         "1X,E21.14"                   
   "Second Matrix Element"        "1X,E21.14"                   
   "Third  Matrix Element"        "1X,E21.14"                   
]

# 29. Footer Line  (Mandatory)
List_Footer = [
   "End of SINEX"                 "A7"                          
]