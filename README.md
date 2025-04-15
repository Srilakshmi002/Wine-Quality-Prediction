# Wine-Quality-Prediction

### About
The original dataset in the UCI Machine Learning Repository which includes two datasets about red wine and white wine. 

### Approaches Followed:
#### Classification
- Random Forest
- SVM
- Decision Tree
- KNN
  
#### Regression
- Linear Regression
- Polynomial Regression
- Logistical Regression

#### Understanding the Red wine dataset
It has a total of 11 physiochemical features and 1 target variable (Quality).
Let's understand these features.
**1. Fixed Acidity**
- Non-volatile acids like tartaric, malic, citric acids that don't evaporate easily. It is measured in g/dm^3 (grams per cubic decimeter). It contributes to the wine's **tartness**. Higher values indicate better freshness, but excessive amounts result in harsh taste.
**2. Volatile Acidity**
- Acids like acetic acid that evaporate. It is measured in g/dm^3. High values of these acids results in low quality of wine. Generally, lower is better, as it negatively influences quality.
**3. Citric Acid**
- A type of acid, occurs naturally in grapes. Measured in g/gm^3. It adds freshness and flavour. Moderate amounts are good. Having too little leads to flat wine, too much leads to sour.
**4. Residual Sugar**
- It's a sugar left after fermentation. Measured in g/dm^3. Slightly high sugar gives smoother taste. Too much leads to sweet wine. Generally, doesn't vary much in dry wines.
**5. Chlorides**
- Salt content in the wine. Measured in g/dm^3. High chlorides leads to poor quality. It often comes from bad storage or contaminated water.
**6. Free Sulphur Dioxide**
- The SO<sub>2</sub> available which acts as an antioxidant/preservative. Measured in mg/dm^3. It protects against microbial growth. Needed in small amounts. Having too high can affect taste/smell.
**7. Total Sulphur Dioxide**
- It's a total of bound and free SO<sub>2</sub>.
  Bound: SO<sub>2</sub> attached to other molecules like sugars or aldehydes. It doesn't protect or preserve the wine directly. Since we can’t smell or taste it, but it still                 contributes to the total.
  Total SO<sub>2</sub> = Free SO<sub>2</sub> + Bound SO<sub>2</sub>
  Measured in mg/dm^3. Having too little leads to spoilage or microbial growth. Too much leads to bad smell, irritation, lower quality. Ideally, free SO<sub>2</sub> is at safe levels, and bound SO<sub>2</sub> is kept low to reduce total SO<sub>2</sub>.
**8. Density**
- It's a wine density (mass/volume). Measured in grams/cm^3. Related to sugar/alcohol content. Higher density leads to sweeter or unfinished fermentation. Too high density means lower quality. Typically wine density ranges from 0.990 - 0.996 is a good sign of dry red or white wines. If it's above 0.997, the wine might be sweet (if intentional), unfermented or unfinished.
**9. pH**
- It's a acidity level. Lower pH means more acidic. Measures through the pH scale of 0-14. It affects preservation, color, stability. Ideal winr pH is ~3-4. Extreme values results it bad wine.
**10. Sulphates**
- Sulphur compounds acting as preservatives (Not same as SO<sub>2</sub>). Measured in g/dm^3. Small amounts improve helf life. Can also affect mouthfeel. Having on high amounts is better for preservation but not always better quality.
**11. Alcohol**
- It's the Ethanol content from fermentation. Measured in % by volume. It is a major contributor to flavour, aroma, and body. Higher alcohol is often associated with higher quality, but balance is key.
**12. Quality (Target Variable)**
- It's a human rated wine quality score. Average sensory tests by wine experts.

### Quick Insights on Impact (from typical correlations).
| Feature | Common Impact on Quality |
| --- | ---|
| Volatile Acidity | Negative |
| Alcohol | Positive |
| Sulphates | Positive (moderate) |
| Residual Sugar | Neutral/Low Impact |
| Total Sulphur Dioxide | Negative (if too low) |
| pH | Weak to moderate impact |
| Density | Negative (if too high) |
