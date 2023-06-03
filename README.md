# Artificial-Intelligence

SCC363 - AI - Lancaster University

NLP – Sentiment Analysis

**Introduction**

I am attempting to create a script that can automatically determine sentiment from recorded tweets from a provided set. We will use several classification models and evaluate their effectiveness and conclude which is the best.

**Data and Preparation**

Data was filtered by removing stop words and words that occurred less than 100 times. Subsequent tf idf matrix built to turn text into numbers. First half was used to train the algorithm with corresponding label vector, the second half to test.

**Methodology**

Use the training set to train the model to recognise tweets. An algorithm is created to spot tweets based on the model decided by the user. It can analyse new tweets given to it based on the tweets it has seen prior. I chose K nearest neighbour for its fast calculation, Bayes since it doesn’t require much training data and decision tree as it is easy to visualize, is easy to understand and it automatically handles missing values.
Each of these has disadvantages too, the decision tree model leads to overfitting of data which can give a high variance in the output. Bayes has a weakness of assigning zero probability to categorical variable whose category in the test data set wasn’t available in the training dataset. K Nearest neighbour gets slow with larger data sets and is very sensitive to outliers.

**Results**
The decision tree model gave the most accurate results with 45.58%. The K-nearest neighbour was the next most accurate with 37.94%. The bayes was the least effective with 30.47%.
**Decision-Tree**
This model gave great happiness predictions with 585 correct cases. This contributed to it being the most accurate model with 45.58%.
**K-Nearest Neighbour**
This model gave decent happiness predictions with 423 correct cases.
**Decision-Tree**

**Conclusion**
The most accurate model is the decision tree model and so I would use this one. The decision tree model has many benefits:
• Easy to visualise
• High precision
• Requires little data prep
• High sensitivity
• Low specificity
• Able to handle both numerical and categorical data
