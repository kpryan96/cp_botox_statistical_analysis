# cp_botox_statistical_analysis

# Background
In the last 25 years, the use of botulinum toxin type A (Botox) has become a common treatment to temporarily reduce muscle spasticity in children with Spastic Cerebral Palsy [1]. Usually, Botox is injected directly into the tightened muscles to loosen them and make the application of Physical Therapy easier. The goal of this analysis is to test the effectiveness of this common medical intervention; that is, is there an association between the injection of Botox and changes in gait patterns in pediatric patients? 

# Data Exploration 
The data for this analysis is publicly available at figshare.com and was used in a study on Botox treatments by Nieuwenhuys et al. in 2015 [2]. The data contains 43 gait measurements for 53 children before and after they received Botox injections in their affected muscles. All children were between 4 and 12 years of age with the average age being 5.6 years old. 35 of the 53 (66%) were boys and 36 of all 53 patients (67%) were diagnosed with bilateral cerebral palsy, meaning both legs were impacted by their disability. Almost 80% of children required no physical support when walking and all but 11 had a Gross Motor Function Classification of II or lower. This means they are capable of walking independently in most settings but may require some support when climbing stairs or on uneven terrain [3]. 

<img src="https://user-images.githubusercontent.com/123997370/216790850-ce697bdd-07c3-4637-bd62-206228c078f7.png" width=33% height=50% hspace = 15> <img src="https://user-images.githubusercontent.com/123997370/216790976-a8367076-5586-42c9-b893-3ad5b6919a3c.png" width = 33% height = 50% hspace = 15> 



Regarding treatment data and measurements, on average, baseline measurements were taken 28 days prior to the Botox treatment and second measurements were usually taken 61 days after injections. The 43 gait measurements focus on the knee, pelvis, hip, ankle and foot. These can further be broken down into three general categories. Movements occurring on the Sagittal Plane, the Coronal Plane, and the Transverse Plane.  All measurements are listed in degrees. They are summarized in Table 2. 

# Statistical Analysis 
This analysis explores the null hypothesis that there is no association between Botox injection and change in gait measurements, i.e., the average difference in the angle of movement for a joint measurement is 0. The alternative hypothesis is that the average difference is not 0. To test this, a paired T-test was performed for all 43 gait measurements. To account for multiple comparison issues with so many comparisons being made, a Holm-Bonferroni correction was used. The Holm-Bonferroni method is similar to the Bonferroni correction but uses a ranked stepwise method to limit the number of Type II errors while accounting for Type I errors as in the Bonferroni method. It works in the following way, 

1) Rank the p-values of each comparison from smallest to largest 
2) Compute the adjusted alpha value using the formula: $a \over n - rank + 1$
3) Compare the p-value to the new adjusted alpha

# Results and Discussion 
Of the 43 gait measurements, only changes in 12 were found to have a statistically significant association with Botox treatment. They are listed and summarized in table 3. 


It is interesting to note that significant changes were reported only in gait measurements of the foot and ankle. This suggests that Botox treatments should be more targeted to more specific joints involving the foot or ankle rather than other muscle groups in the lower extremities.     

# Next Steps
This study could be extended by taking measurements sooner following the Botox injections. It is possible that the effects of the treatment dissipated over time for the hip and pelvis joints. There is also no indication that these patients underwent any kind of physical therapy after injections. It would be interesting to see what the impact of physical rehabilitation would be post injection when muscles, in theory, would be more pliable.

# Next Steps
This study could be extended by taking measurements sooner following the botox injections. It is possible that the effects of the treatment dissipated over time for the hip and pelvis joints. There is also no indication that these patients underwent any kind of phyiscal therapy after injections. It would be interesting to see what the impact of physical rehabilitaton would be post injection. 

# References 
[1]
[2]
[3]
