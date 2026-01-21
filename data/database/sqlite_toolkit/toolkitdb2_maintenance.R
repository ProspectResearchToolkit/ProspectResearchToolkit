# script abandoned for now in favor of the chunked version

# packages
library(DBI)

# connect to database (will create a new .db file if path doesn't exist)
toolkit_db2 <- dbConnect(RSQLite::SQLite(), "data/database/sqlite_toolkit/toolkit_db2.db")


# initial data import
tools_csv <- read.csv("data/database/database_import/tools.csv")
companies_csv <- read.csv("data/database/database_import/companies.csv")
features_csv <- read.csv("data/database/database_import/features.csv")
research_datapoints_csv <- read.csv("data/database/database_import/research_datapoints.csv")
research_methods_csv <- read.csv("data/database/database_import/research_methods.csv")
research_obstacles_csv <- read.csv("data/database/database_import/research_obstacles.csv")
research_usecases_csv <- read.csv("data/database/database_import/research_usecases.csv")
universities_csv <- read.csv("data/database/database_import/universities.csv")
university_tools_csv <- read.csv("data/database/database_import/university_tools.csv")

# import preprocessing
names(tools_csv)[1] <- "tool_id"
names(companies_csv) <- c("company_id", "company_name", "company_website")


# initializing tables
# sqlite notes: not null needs to be specified explicitly for primary keys
dbExecute(toolkit_db2, "CREATE TABLE companies (
          company_id INTEGER NOT NULL PRIMARY KEY,
          company_name TEXT,
          company_website TEXT,
          );")

# disconnect from database
dbDisconnect()
