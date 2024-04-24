## DHFR Classification  

This project predicts drug activation labels for the DHFR dataset. DHFR stands for Dihydrofolate Reductase Inhibitors Data.

Sutherland and Weaver (2004) discuss QSAR models for dihydrofolate reductase (DHFR) inhibition. This data set contains values for 325 compounds. For each compound, 228 molecular descriptors have been calculated. Additionally, each samples is designated as "active" or "inactive". 

Based on this [Data Professor](https://www.youtube.com/watch?v=VzXfPCTHRTg) tutorial.

### Details

The data frame `dhfr` contains a column called Y with the outcome classification. The remainder of the columns are molecular descriptor values. 

### Value

`dhfr` data frame of chemical descriptors and the activity values

### Source

Sutherland, J.J. and Weaver, D.F. (2004). Three-dimensional quantitative structure-activity and structure-selectivity relationships of dihydrofolate reductase inhibitors, Journal of Computer-Aided Molecular Design, Vol. 18, pg. 309-331. 

https://search.r-project.org/CRAN/refmans/caret/html/dhfr.html
