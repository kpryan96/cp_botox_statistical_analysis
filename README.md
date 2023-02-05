# cp_botox_statistical_analysis

# Background
In the last 25 years, the use of botulinum toxin type A (Botox) has become a common treatment to temporarily reduce muscle spasticity in children with Spastic Cerebral Palsy [1]. Usually, Botox is injected directly into the tightened muscles to loosen them and make the application of Physical Therapy easier. The goal of this analysis is to test the effectiveness of this common medical intervention; that is, is there an association between the injection of Botox and changes in gait patterns in pediatric patients? 

# Data Exploration 
The data for this analysis is publicly available at figshare.com and was used in a study on Botox treatments by Nieuwenhuys et al. in 2015 [2]. The data contains 43 gait measurements for 53 children before and after they received Botox injections in their affected muscles. All children were between 4 and 12 years of age with the average age being 5.6 years old. 35 of the 53 (66%) were boys and 36 of all 53 patients (67%) were diagnosed with bilateral cerebral palsy, meaning both legs were impacted by their disability. Almost 80% of children required no physical support when walking and all but 11 had a Gross Motor Function Classification of II or lower. This means they are capable of walking independently in most settings but may require some support when climbing stairs or on uneven terrain [3]. 

<img src="https://user-images.githubusercontent.com/123997370/216790850-ce697bdd-07c3-4637-bd62-206228c078f7.png" width=32% height=50% hspace = 2> <img src="https://user-images.githubusercontent.com/123997370/216790976-a8367076-5586-42c9-b893-3ad5b6919a3c.png" width = 32% height = 50% hspace = 2> <img src="https://user-images.githubusercontent.com/123997370/216791247-2a605eb0-d096-4656-bcb1-7e6759a02590.png" width = 32% height = 50% hspace = 2> 

Regarding treatment data and measurements, on average, baseline measurements were taken 28 days prior to the Botox treatment and second measurements were usually taken 61 days after injections. The 43 gait measurements focus on the knee, pelvis, hip, ankle and foot. These can further be broken down into three general categories. Movements occurring on the Sagittal Plane, the Coronal Plane, and the Transverse Plane.  All measurements are listed in degrees. They are summarized in the following table.

<img src="https://user-images.githubusercontent.com/123997370/216847860-03b51b71-0e24-44c4-ab83-2739fa3cb48f.png" width=100% height=50%>




# Statistical Analysis 
This analysis explores the null hypothesis that there is no association between Botox injection and change in gait measurements, i.e., the average difference in the angle of movement for a joint measurement is 0. The alternative hypothesis is that the average difference is not 0. To test this, a paired T-test was performed for all 43 gait measurements. To account for multiple comparison issues with so many comparisons being made, a Holm-Bonferroni correction was used. The Holm-Bonferroni method is similar to the Bonferroni correction but uses a ranked stepwise method to limit the number of Type II errors while accounting for Type I errors as in the Bonferroni method. It works in the following way, 

1) Rank the p-values of each comparison from smallest to largest 
2) Compute the adjusted alpha value using the formula: $a \over n - rank + 1$
3) Compare the p-value to the new adjusted alpha

# Results and Discussion 
Of the 43 gait measurements, only changes in 12 were found to have a statistically significant association with Botox treatment. They are listed and summarized the following table. 

<img src="https://user-images.githubusercontent.com/123997370/216848393-6dfe3b0c-088d-40d1-b8c5-24042d33b919.png">

It is interesting to note that significant changes were reported only in gait measurements of the foot and ankle. This suggests that Botox treatments should be more targeted to more specific joints involving the foot or ankle rather than other muscle groups in the lower extremities.     

# Next Steps
This study could be extended by taking measurements sooner following the Botox injections. It is possible that the effects of the treatment dissipated over time for the hip and pelvis joints. There is also no indication that these patients underwent any kind of physical therapy after injections. It would be interesting to see what the impact of physical rehabilitation would be post injection when muscles, in theory, would be more pliable.


# References 
[1] Multani I, Manji J, Hastings-Ison T, Khot A, Graham K. Botulinum Toxin in the Management of Children with Cerebral Palsy. Paediatr Drugs. 2019 Aug;21(4):261-281. doi: 10.1007/s40272-019-00344-8. PMID: 31257556; PMCID: PMC6682585.

[2] Nieuwenhuys A, Papageorgiou E, Pataky T, De Laet T, Molenaers G, Desloovere K. Literature Review and Comparison of Two Statistical Methods to Evaluate the Effect of Botulinum Toxin Treatment on Gait in Children with Cerebral Palsy. PLoS One. 2016 Mar 31;11(3):e0152697. doi: 10.1371/journal.pone.0152697. PMID: 27030973; PMCID: PMC4816309.

[3] https://cerebralpalsy.org.au/our-research/about-cerebral-palsy/what-is-cerebral-palsy/severity-of-cerebral-palsy/gross-motor-function-classification-system/
