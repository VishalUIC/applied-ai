(import nrc.fuzzy.*)

(import nrc.fuzz.jess.*)

(load-package nrc.fuzzy.jess.FuzzyFunctions)

(deftemplate biochemistry
    (slot fasting_blood_glucose(type float))
    (slot post_prandial_blood_glucose(type float))
    (slot serum_sodium(type float))
    (slot serum_potassium(type float))
    (slot serum_chloride(type float))
    (slot HbAlc(type float))
    (slot blood_urea(type float))
    (slot serum_creatinine(type float))
    (slot cholestrol(type float))
    (slot HDL_Cholestrol(type float))
    (slot direct_LDL(type float))
    (slot S_Triglycerides(type float))
    (slot Non_HDL_Cholestrol (type float))
    (slot VLDL_Cholestrol (type float))
    (slot sample (type integer))

) /*Deftemplate biochemistry ends*/     

(deftemplate patient   
    (slot name)
    (slot age(type integer))
    (slot sex) 
    (slot diabetes_in_family)
    
) /*Deftemplate patient ends*/  

(deftemplate fasting_blood_glucose_data
    "Auto-generated"
    (declare (ordered TRUE)))

(deftemplate post_prandial_blood_glucose_data
    "Auto-generated"
    (declare (ordered TRUE)))

(deftemplate Age_data
    "Auto-generated"
    (declare (ordered TRUE)))

(deftemplate Cholesterol_data
    "Auto-generated"
    (declare (ordered TRUE)))

(deftemplate Sample_data
   "Auto-generated"
   (declare (ordered TRUE)))

(deftemplate chol_sample
   "Auto-generated"
   (declare (ordered TRUE)))

(deftemplate age_sample
   "Auto-generated"
   (declare (ordered TRUE)))


(defglobal ?*fasting_blood_glucose_Var* = (new FuzzyVariable "fasting_blood_glucose" 0.0 200.0))

(defglobal ?*post_prandial_blood_glucose_Var* = (new FuzzyVariable "post_prandial_blood_glucose" 0.0 300.0))

(defglobal ?*Age_data_Var* = (new FuzzyVariable "Age_data" 0 100))

(defglobal ?*Cholesterol_data_Var* = (new FuzzyVariable "Cholesterol_data" 0.0 300.0))

(defglobal ?*Sample_Var* = (new FuzzyVariable "Sample_data" 0 10))



(call nrc.fuzzy.FuzzyValue setMatchThreshold 0.1)

; Rule 0
; Initializing global variables
(defrule MAIN::init-FuzzyVariables
    (declare (salience 100))
    ?patient <- (patient (name ?name))
    ?biochemistry <- (biochemistry )
    =>

(import nrc.fuzzy.*)
(load-package nrc.fuzzy.jess.FuzzyFunctions)
    
    (?*fasting_blood_glucose_Var* addTerm "low" (new ZFuzzySet 10.0 70.0))
    (?*fasting_blood_glucose_Var* addTerm "medium" (new TrapezoidFuzzySet 55.0 70.0 85.0 110.0))
    (?*fasting_blood_glucose_Var* addTerm "High" (new SFuzzySet 80.0 190.0))
    (?*post_prandial_blood_glucose_Var* addTerm "low" (new ZFuzzySet 15 65))
    (?*post_prandial_blood_glucose_Var* addTerm "medium" (new TrapezoidFuzzySet 50 85 120 155))
    (?*post_prandial_blood_glucose_Var* addTerm "High" (new SFuzzySet 115 285))
    (?*Age_data_Var* addTerm "low" (new ZFuzzySet 10 25))
    (?*Age_data_Var* addTerm "medium" (new TrapezoidFuzzySet 20 40 60 70))
    (?*Age_data_Var* addTerm "high" (new SFuzzySet 55 90))
    (?*Cholesterol_data_Var* addTerm "low" (new ZFuzzySet 15.0 65.0))
    (?*Cholesterol_data_Var* addTerm "medium" (new TrapezoidFuzzySet 50.0 85.0 120.0 155.0))
    (?*Cholesterol_data_Var* addTerm "High" (new SFuzzySet 115.0 285.0))
    (?*Sample_Var* addTerm "low" (new ZFuzzySet 3.0 5.0))
    (?*Sample_Var* addTerm "medium" (new  TrapezoidFuzzySet 4.0 5.5 7.0 8.5))
    (?*Sample_Var* addTerm "High" (new SFuzzySet 7.0 10.0))
    (assert (fasting_blood_glucose_data (new FuzzyValue ?*fasting_blood_glucose_Var* (new SingletonFuzzySet ?biochemistry.fasting_blood_glucose))))
    (assert (post_prandial_blood_glucose_data (new FuzzyValue ?*post_prandial_blood_glucose_Var* (new SingletonFuzzySet ?biochemistry.post_prandial_blood_glucose))))
    (assert (Age_data (new FuzzyValue ?*Age_data_Var* (new SingletonFuzzySet ?patient.age))))
    (assert (Cholesterol_data (new FuzzyValue ?*Cholesterol_data_Var* (new SingletonFuzzySet ?biochemistry.S_Triglycerides))))        
    )
   

; Rule 1
; Print Test Report
(defrule initial
    (declare (salience 100))
    ?patient <- (patient (name ?name))
    ?biochemistry <- (biochemistry )
    =>
    (printout t "********************Your test report is ready********************" crlf)
    (printout t "Name "?patient.name crlf)
    (printout t "Age: " ?patient.age crlf)
    (printout t "Sex: " ?patient.sex crlf)
    (printout t "********************BIOCHEMISTRY********************" crlf)
    (printout t "Fasting Blood Glucose: " ?biochemistry.fasting_blood_glucose crlf)
    (printout t "Post Prandial Blood Glucose: " ?biochemistry.post_prandial_blood_glucose crlf)
    (printout t "Serum Sodium: " ?biochemistry.serum_sodium crlf)
    (printout t "Serum Potassium: " ?biochemistry.serum_potassium crlf)
    (printout t "Serum Chlorides: " ?biochemistry.serum_chloride crlf)
    (printout t "HbAlc: " ?biochemistry.HbAlc crlf)
    (printout t "Blood Urea: " ?biochemistry.blood_urea crlf)
    (printout t "Serum Creatinine: " ?biochemistry.serum_creatinine crlf)
    (printout t "Cholestrol: " ?biochemistry.cholestrol crlf)
    (printout t "HDL Cholestrol: " ?biochemistry.HDL_Cholestrol crlf)
    (printout t "Direct LDL: " ?biochemistry.direct_LDL crlf)
    (printout t "S Triglycerides: " ?biochemistry.S_Triglycerides crlf)
    (printout t "Non HDL Cholestrol: " ?biochemistry.Non_HDL_Cholestrol crlf)
    (printout t "VLDL Cholestrol: " ?biochemistry.VLDL_Cholestrol crlf)
    (printout t "                                               " crlf)
) 


; Rule 2
; To check whether the applicant's GPA satisfies the University's criteria  
(defrule Low_Sugar
    (declare (salience 98))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "low")) 
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "low"))
    =>   
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "low or low"))))
    

; Rule 3
(defrule High_Sugar
    (declare (salience 97))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "High"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "High"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "High or High"))))

; Rule 4
(defrule Medium_Sugar
    (declare (salience 96))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "medium"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "medium"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "medium or medium"))))
    

; Rule 5
(defrule Low_High_Sugar
    (declare (salience 95))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "low"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "High"))
     =>
    (printout t "High Sugar" crlf)
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "low or High"))))
    

; Rule 6
(defrule High_Low_Sugar
    (declare (salience 94))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "High"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "low"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "High or low"))))

; Rule 7
(defrule Low_Medium_Sugar
    (declare (salience 93))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "low"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "medium"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "low or medium"))))

; Rule 8
(defrule Medium_Low_Sugar
    (declare (salience 92))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "medium"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "low"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "medium or low"))))
    

; Rule 9
(defrule High_Medium_Sugar
    (declare (salience 91))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "High"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "medium"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "High or medium"))))

; Rule 10
(defrule Medium_High_Sugar
    (declare (salience 90))
    (fasting_blood_glucose_data ?a &:(fuzzy-match ?a "medium"))
    (post_prandial_blood_glucose_data ?e &:(fuzzy-match ?e "High"))
     =>
    (assert(Sample_data (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "medium or High")))
)

; Rule 11
(defrule Low_Cholesterol
    (declare (salience 89))
    (Cholesterol_data ?p &:(fuzzy-match ?p "low"))
     =>
    (assert(chol_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "low")))
)
; Rule 12
(defrule High_Cholesterol
    (declare (salience 88))
    (Cholesterol_data ?p &:(fuzzy-match ?p "High"))
     =>
    (assert(chol_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "High")))
)
; Rule 13
(defrule Medium_Cholesterol
    (declare (salience 87))
    (Cholesterol_data ?p &:(fuzzy-match ?p "medium"))
     =>
    (assert(chol_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "medium")))
)

; Rule 14
(defrule Low_Age
    (declare (salience 87))
    (Age_data ?u &:(fuzzy-match ?u "low"))
     =>
    (assert(age_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "low")))
)

; Rule 15
(defrule Medium_Age
    (declare (salience 87))
    (Age_data ?u &:(fuzzy-match ?u "medium"))
     =>
    (assert(age_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "medium")))
)

; Rule 16
(defrule High_Age
    (declare (salience 87))
    (Age_data ?u &:(fuzzy-match ?u "High"))
     =>
    (assert(age_sample (new nrc.fuzzy.FuzzyValue ?*Sample_Var* "High")))
)

; Rule 17
; If all criteria are met, the portal motivates the applicant to move further with his applicant and submit
(defrule diagnose
    (declare (salience 1))
    ?f <- (Sample_data ?z)
	?q <- (chol_sample ?r)
    ?s <- (chol_sample ?t)
    =>
    (str-cat "Sample_Var: " (?z momentDefuzzify))
	(bind ?calculated-rating (integer (?z momentDefuzzify)))
    
    (str-cat "Sample_Var: " (?r momentDefuzzify))
	;(bind ?calculated-chol (integer (?r momentDefuzzify)))
    
    (str-cat "Sample_Var: " (?t momentDefuzzify))
	;(bind ?calculated-age (integer (?t momentDefuzzify)))
    
    (bind ?calculated-chol (integer(+  (* .1 (?t momentDefuzzify)) (* .9 (?r momentDefuzzify)))))
    (if(> ?calculated-rating 1) then
    (if(<= ?calculated-rating 2) then 
    	(printout t "YOU HAVE LOW SUGAR, INCREASE THE INTAKE OF CARBOHYDRATES" crlf)
        (printout t " " crlf) 
        (if(>= ?calculated-chol 6)then
               (printout t "YOU HAVE HIGH CHOLESTEROL WHICH MIGHT CAUSE CARDIAC PROBLEMS" crlf)
        	   (printout t " " crlf) 
        elif(< ?calculated-chol 6)then
        		(printout t "YOU HAVE NORMAL CHOLESTEROL, HENCE INCREASED INTAKE OF CARBOHYDRATES SHOULD NOT CAUSE PROBLEMS": ?calculated-chol crlf)
        	   	(printout t " " crlf) )
    
    elif(and(> ?calculated-rating 2)(< ?calculated-rating 6))then
    	(printout t "GOOD NEWS! YOU DO NOT HAVE DIABETES" crlf) 
        (printout t " " crlf)
        (if(>= ?calculated-chol 6)then
               (printout t "BUT YOU HAVE HIGH CHOLESTEROL WHICH MIGHT CAUSE CARDIAC PROBLEMS": ?calculated-chol crlf)
        	   (printout t " " crlf) 
         elif(< ?calculated-chol 6)then
        		(printout t "YOU HAVE NORMAL CHOLESTEROL AS WELL!!" crlf)
        	   	(printout t " " crlf) )
    
	elif(and(>= ?calculated-rating 6)(< ?calculated-rating 8)) then
    	(printout t "YOU ARE PRE DIABETIC. PLEASE TAKE NECESSARY PRECAUTIONS AFTER CONSULTING A DOCTOR" crlf)
        (printout t " " crlf) 
        (if(>= ?calculated-chol 6)then
               (printout t "YOU HAVE HIGH CHOLESTEROL WHICH MIGHT CAUSE CARDIAC PROBLEMS" crlf)
        	   (printout t " " crlf) 
         elif(< ?calculated-chol 6)then
        		(printout t "YOU HAVE NORMAL CHOLESTEROL WHICH WILL HELP YOU IN PREVENTING DIABETES": ?calculated-chol crlf)
        	   	(printout t " " crlf) )
    else
        (printout t "YOU HAVE HIGH SUGAR, TAKE INSULIN SHOTS AFTER CONSULTING THE DOCTOR." crlf)
        (printout t " " crlf) 
        (if(>= ?calculated-chol 6)then
               (printout t "YOU HAVE HIGH CHOLESTEROL ALONG WITH HIGH DIABETES WHICH MIGHT CAUSE SEVERE CARDIAC PROBLEMS. PLEASE CONSULT A DOCTOR" crlf)
        	   (printout t " " crlf) 
        elif(< ?calculated-chol 6)then
        		(printout t "YOU HAVE NORMAL CHOLESTEROL WHICH WILL HELP YOU IN PREVENTING DIABETES" crlf)
        	   	(printout t " " crlf) )
        )
	else
        (printout t "YOU HAVE HIGH SUGAR, TAKE INSULIN SHOTS AFTER CONSULTING THE DOCTOR.": ?calculated-rating crlf)
        (printout t " " crlf) )
    
)


;Rule 18
(defrule printFacts
    (declare (salience 1))
    =>
    (facts)
    )
(reset)
 

; Rule 19
(defrule init
    (declare (salience 200))
=>
    
(assert (patient (name "Tom")
            (age 50)
            (sex "Male") 
    		(diabetes_in_family "Y"))) 

;Condition where the user do not have diabetes or any other risks
(assert (biochemistry(fasting_blood_glucose 55.0)
	    (post_prandial_blood_glucose 115.0)
    	(serum_sodium 50.0)
        (serum_potassium 2.0)
        (serum_chloride 80)
        (HbAlc 5)
        (blood_urea 10)
        (serum_creatinine 0.5)
        (cholestrol 150)
        (HDL_Cholestrol 30)
        (direct_LDL 70)
        (S_Triglycerides 50)
        (Non_HDL_Cholestrol 80)
        (VLDL_Cholestrol 25)
            ))
               
        
;Condition where the user has high diabetes and other risks   
/*(assert (biochemistry(fasting_blood_glucose 150.0)
	    (post_prandial_blood_glucose 250.0)
    	(serum_sodium 50.0)
        (serum_potassium 2.0)
        (serum_chloride 80)
        (HbAlc 5)
        (blood_urea 10)
        (serum_creatinine 0.5)
        (cholestrol 150)
        (HDL_Cholestrol 30)
        (direct_LDL 70)
        (S_Triglycerides 220)
        (Non_HDL_Cholestrol 80)
        (VLDL_Cholestrol 25)
            ))*/
 
;Condition where the user has low blood sugar and other risks   
/* (assert (biochemistry(fasting_blood_glucose 50.0)
	    (post_prandial_blood_glucose 45.0)
    	(serum_sodium 50.0)
        (serum_potassium 2.0)
        (serum_chloride 80)
        (HbAlc 5)
        (blood_urea 10)
        (serum_creatinine 0.5)
        (cholestrol 150)
        (HDL_Cholestrol 30)
        (direct_LDL 70)
        (S_Triglycerides 250)
        (Non_HDL_Cholestrol 80)
        (VLDL_Cholestrol 25)
            ))*/
    
;Condition where the user is prediabetic and has other problems.
/*(assert (biochemistry(fasting_blood_glucose 60.0)
	    (post_prandial_blood_glucose 110.0)
    	(serum_sodium 50.0)
        (serum_potassium 2.0)
        (serum_chloride 80)
        (HbAlc 5)
        (blood_urea 10)
        (serum_creatinine 0.5)
        (cholestrol 150)
        (HDL_Cholestrol 30)
        (direct_LDL 70)
        (S_Triglycerides 250)
        (Non_HDL_Cholestrol 80)
        (VLDL_Cholestrol 25)))*/
    )  
(run)
