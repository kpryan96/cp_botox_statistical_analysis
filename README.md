# cp_botox_statistical_analysis

# Background
In the last 25 years, the use of botulinum toxin type A (Botox) has become a common treatment to temporarily reduce muscle spasticity in children with Spastic Cerebral Palsy [1]. Usually, Botox is injected directly into the tightened muscles to loosen them and make the application of Physical Therapy easier. The goal of this analysis is to test the effectivness of this common medical intervention; that is, is there an association between the injection of botox and changes in gait patterns in pediatric patients? 

# Data Exploration 
The data for this analysis is publicly available at figshare.com and was used in a study on Botox treatments by Nieuwenhuys et al. in 2015 [2]. The data contains 43 gait measurements for 53 children before and after they recieved botox injections in their affected muscles. All children were between 4 and 12 years of age with the average age being 5.6 years old. 35 of the 53 (66%) were boys and 36 of all 53 patients (67%) were diagosed with bilateral cerebral palsy, meaning both legs were impacted by their disability. Almost 80% of children required no physical support when walking and all but 11 had a Gross Motor Function Classification of II or lower. This means they are capable of walking independendtly in most settings but may require some support when climbing stairs or on uneven terrain [3]. 

Regarding treatment data and measurmenets, on average, baseline measurements were taken 28 days prior to the botox treatment and second measurements were usually taken 61 days after injections. The 43 gait measurements focus on the knee and ankle. These can further be broken down into three general categories. Movements ooccuring on the Sagital Plane, the Coronnal Plane, and the Transverse Plane.  All measurements are listed in degrees. They are summarized in Table 2. 

# Statistical Analysis 
This analysis explores the null hypothesis that there is no association between botox injection and change in gait measurments, i.e. the average difference in the angle of movement for a knee or joint measurement is 0. The altenrative hypothesis is that the average difference is not 0. To test this, a paired T-test was performed for all 43 gait measurements. To account for multiple comparison issues with so many comparisons being made, a Holm-Bonferroni correction was used. The Holm-Bonferroni method is similar to the Bonferroni correction but uses a ranked stepwise method to limit the number of Type II errors while accounting for Type I errors as in the Bonferroni method. It works in the following way, 

1) Rank the p-values of each comparision from smallest to largest 
2) Compute the adjusted alpha value using the formula: $a \over n - rank + 1$
3) Compare the p-value to the new adjusted alpha

# Results and Discussion 
Of the 43 

# Next Steps 
