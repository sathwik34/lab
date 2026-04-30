from pyspark.sql import SparkSession

# Create Spark session (THIS WAS MISSING)
spark = SparkSession.builder \
    .appName("Create CSV Example") \
    .getOrCreate()

# Your data
data = [("Alice", 25), ("Bob", 30), ("Charlie", 22)]
columns = ["Name", "Age"]

# Now this will work
df = spark.createDataFrame(data, columns)

# Show DataFrame
df.show()

# Save as CSV
df.write.csv("sample.csv", header=True)

# Stop Spark
spark.stop()

from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Create Spark session
spark = SparkSession.builder \
    .appName("CSV with Schema Example") \
    .getOrCreate()

# Define schema
schema = StructType([
    StructField("Name", StringType(), True),
    StructField("Age", IntegerType(), True)
])

# Read CSV with schema
df = spark.read.csv(
    "sample.csv",   # path to your CSV
    header=True,
    schema=schema   # apply schema here
)

# Show data
df.show()

# Print schema (to verify)
df.printSchema()

spark.stop()