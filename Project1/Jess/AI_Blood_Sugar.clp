(deftemplate test_report
    (slot report_serum_sodium(type float))
    (slot report_fasting_glucose_blood(type float))
    (slot report_cholestrol(type float)) 
    (slot report_VLDL_Cholestrol (type float))
    (slot report_post_prandial_glucode_blood(type float))
    (slot report_blood_urea(type float))
    (slot report_serum_potassium(type float))    
    (slot report_HbAlc(type float))
    (slot report_HDL_Cholestrol(type float))
    (slot report_serum_creatinine(type float))   
    (slot report_direct_LDL(type float))
    (slot report_S_Triglycerides(type float))
    (slot report_sample (type integer))
    (slot report_Non_HDL_Cholestrol (type float))
    (slot report_serum_chloride(type float))
) /*Deftemplate test_report ends*/     

(deftemplate patient_details   
    (slot name)
    (slot age(type integer))
    (slot sex) 
    (slot diabetes_in_family)
    
) /*Deftemplate patient_details ends*/  

 
  

; Rule 1
; Print Test Report
(defrule initial
    (declare (salience 100))
    ?patient_details <- (patient_details (name ?name))
    ?test_report <- (test_report {(report_sample == nil)})
    =>
    (printout t "********************Your test report is ready********************" crlf)
    (printout t "Name "?patient_details.name crlf)
    (printout t "Age: " ?patient_details.age crlf)
    (printout t "Sex: " ?patient_details.sex crlf)
    (printout t "********************test_report********************" crlf)
    (printout t "Fasting Blood Glucose: " ?test_report.report_fasting_glucose_blood crlf)
    (printout t "Post Prandial Blood Glucose: " ?test_report.report_post_prandial_glucode_blood crlf)
    (printout t "Serum Sodium: " ?test_report.report_serum_sodium crlf)
    (printout t "Serum Potassium: " ?test_report.report_serum_potassium crlf)
    (printout t "Serum Chlorides: " ?test_report.report_serum_chloride crlf)
    (printout t "report_HbAlc: " ?test_report.report_HbAlc crlf)
    (printout t "Blood Urea: " ?test_report.report_blood_urea crlf)
    (printout t "Serum Creatinine: " ?test_report.report_serum_creatinine crlf)
    (printout t "report_cholestrol: " ?test_report.report_cholestrol crlf)
    (printout t "HDL Cholestrol: " ?test_report.report_HDL_Cholestrol crlf)
    (printout t "Direct LDL: " ?test_report.report_direct_LDL crlf)
    (printout t "S Triglycerides: " ?test_report.report_S_Triglycerides crlf)
    (printout t "Non HDL Cholestrol: " ?test_report.report_Non_HDL_Cholestrol crlf)
    (printout t "VLDL Cholestrol: " ?test_report.report_VLDL_Cholestrol crlf)
    (printout t "                                               " crlf)
) 

; Rule 2
; To check whether the fasting glucose is normal
(defrule Fasting_Glucose_check
    (declare (salience 98))
    ?a <- (test_report{(report_sample != nil)})
    =>
    (if (> ?a.report_fasting_glucose_blood 120) then
        (printout t "Have dinner on time. High Fasting glucose is high." crlf)
        )
    (if (< ?a.report_fasting_glucose_blood 60) then
        (printout t "Have dinner on time. Fasting glucose is low" crlf)
        )
     
)

; Rule 3
; To check whether the post prandial glucose is normal
(defrule Post_Prandial_Glucose_check
    (declare (salience 97 ))
    ?a <- (test_report )
    =>
    (if (> ?a.report_post_prandial_glucode_blood 150) then
        (printout t "Control the intake of carbohydrates. Post prandial glucose is high." crlf)
        )
) 

; Rule 4
; To check whether the serum sodium is normal
(defrule Serum_sodium_check
    (declare (salience 96))
    ?a <- (test_report)
    =>
    (if (> ?a.report_serum_sodium 146.0) then
        (printout t "Drink lot of water. Serum sodium is high." crlf)
        )
    (if(< ?a.report_serum_sodium 134.0) then
    	(printout t "Serum sodium is low, include sufficient pulses in your diet." crlf)
        )
) 

; Rule 5
; To check whether the serum sodium is normal
(defrule serum_potassium_check
    (declare (salience 95))
    ?a <- (test_report)
    =>
    (if ( > ?a.report_serum_potassium 4.5) then
        (printout t "Please undergo EKG test as soon as possible. Serum potassium is high. This causes HYPERKALEMIA." crlf)
        )
    (if (< ?a.report_serum_potassium 3.5) then
        (printout t "Please undergo blood pressure test. Serum potassium is low." crlf)
        )
) 


; Rule 6
; To check whether the serum sodium is normal
(defrule Serum_chloride_check
    (declare (salience 94))
    ?a <- (test_report)
    =>
    (if (< ?a.report_serum_chloride 95 ) then
        (printout t "Include sea food in your diet. Serum chloride is low." crlf)
        )
    (if(> ?a.report_serum_chloride 107) then
    	(printout t "Control the intake of salty foods. Serum chloride is high." crlf)
        )
)

; Rule 7
; To check whether the report_HbAlc is normal
(defrule HbAlc_check
    (declare (salience 93))
    ?a <- (test_report)
    =>
    (if (> ?a.report_HbAlc 7) then
        (printout t "Reduce your weight. HbAlc is high." crlf)
        )
)

; Rule 8
; To check whether the serum sodium is normal
(defrule blood_urea_check
    (declare (salience 92))
   ?a <- (test_report)
    =>
    (if (> ?a.report_blood_urea 45) then
        (printout t "Please undergo BUN test. Blood Urea is high." crlf)
        )
    (if(< ?a.report_blood_urea 15) then
        (printout t "Please undergo BUN test. Blood Urea is low." crlf)
        )
)

; Rule 9
; To check whether the serum creatinine is normal
(defrule Serum_creatinine_check
    (declare (salience 91))
    ?a <- (test_report)
    =>
    (if (< ?a.report_serum_creatinine 0.7) then
        (printout t "Include protiens in your diet. Else, it might cause muscular dystrophy. Serum Creatinine is low." crlf)
        )
    (if (> ?a.report_serum_creatinine 1.2) then
        (printout t "Undergo, Creatinine blood test. Serum Creatinine is too high." crlf)
        )
)

; Rule 10
; To check whether the cholesterol is normal
(defrule Cholestrol_check
    (declare (salience 90))
    ?a <- (test_report)
    =>
    (if (> ?a.report_cholestrol 200) then
        (printout t "Indulge in fibre diet. Cholestrol is high." crlf)
        )
)

; Rule 11
; To check whether the HDL Cholesterol is normal
(defrule HDL_Cholestrol_check
    (declare (salience 89))
    ?a <- (test_report)
    =>
    (if (<= ?a.report_HDL_Cholestrol 35) then
        (printout t "Eat salmon and excersise regularly. HDL Cholestrol is low." crlf)
        )
)

; Rule 12
; To check whether the Direct LDL is normal
(defrule direct_LDL_check
    (declare (salience 88))
    ?a <- (test_report)
    =>
    (if ( > ?a.report_direct_LDL 100) then
        (printout t "Reduce the intake of trans fat and saturated fat. Direct LDL cholestrol is high." crlf)
        )
)

; Rule 13
; To check whether the S Triglyceride is normal
(defrule Triglycerides_check
    (declare (salience 87))
    ?a <- (test_report)
    =>
    (if ( > ?a.report_S_Triglycerides 150) then
        (printout t "Use mono or poly saturated fats. S Triglycerides is high." crlf)
        )
)

; Rule 14
; To check whether the Non HDL Cholesterol is normal
(defrule Non_HDL_Cholestrol_check
    (declare (salience 86))
    ?a <- (test_report)
    =>
    (if (> ?a.report_Non_HDL_Cholestrol 130) then
        (printout t "Exercise regularly. Non HDL Cholestrol is high." crlf)
        )
)

; Rule 15
; To check whether the VLDL Cholesterol is normal
(defrule VLDL_Cholestrol_check
    (declare (salience 85))
    ?a <- (test_report)
    =>
    (if (> ?a.report_VLDL_Cholestrol 30) then
        (printout t "Avaoid sugary food and alcohol. VLDL Cholestrol is high." crlf)
        )
)

; Rule 16
; To check if the patient has diabetes
(defrule diagnose_test
    (declare (salience 100))
    ?a <- (test_report {(report_sample == nil)})
    =>
    /* If fasting glucose is low, no need to consider the post prandial glucose levels */
    (if (and (< ?a.report_fasting_glucose_blood 60)  ) then
        (printout t "Increase the intake of carbohydrates. You have low sugar." crlf)
        (printout t " " crlf)  
        
    elif(and(> ?a.report_fasting_glucose_blood 120) (> ?a.report_post_prandial_glucode_blood 200))then
    	(printout t "Take insulin shots after consulting the doctor. You have high sugar." crlf)
        (printout t " " crlf)  
        
        
    elif(and(<= ?a.report_fasting_glucose_blood 120) (>= ?a.report_fasting_glucose_blood 60) (<= ?a.report_post_prandial_glucode_blood 200))then
    	(printout t "Great News! You do not have diabetes" crlf) 
        (printout t " " crlf)  
        
    else(printout t "You are pre-diabetic" crlf)
        (printout t " " crlf) 
        
    )
	(bind ?a.report_sample 10)     
)


;Rule 17
(defrule printFacts
    (declare (salience 1))
    =>
    (facts)
    )
(reset)



(assert (patient_details (name "Mike")
            (age 40)
            (sex "Male") 
    		(diabetes_in_family "N"))) 

/* Values for pre diabetes */
(assert (test_report(report_fasting_glucose_blood 130)
        (report_post_prandial_glucode_blood 150)
    	(report_serum_sodium 135.0)
        (report_serum_potassium 2.0)
        (report_serum_chloride 98)
        (report_HbAlc 2)
        (report_blood_urea 30)
        (report_serum_creatinine 0.5)
        (report_cholestrol 150)
        (report_HDL_Cholestrol 56)
        (report_direct_LDL 110)
        (report_S_Triglycerides 90)
        (report_Non_HDL_Cholestrol 80)
        (report_VLDL_Cholestrol 25)))
(run)                                     

                