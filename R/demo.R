require(SparkR)

# Read diamonds.csv dataset as SparkDataFrame
diamonds <- read.df("/databricks-datasets/Rdatasets/data-001/csv/ggplot2/diamonds.csv",
                  source = "com.databricks.spark.csv", header="true", inferSchema = "true")
diamonds <- withColumnRenamed(diamonds, "", "rowID")

# Split data into Training set and Test set
trainingData <- sample(diamonds, FALSE, 0.7)
testData <- except(diamonds, trainingData)

# Exclude rowIDs
trainingData <- trainingData[, -1]
testData <- testData[, -1]

print(count(diamonds))
print(count(trainingData))
print(count(testData))