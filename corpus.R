# install.packages("RPostgreSQL")
require("RPostgreSQL")

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "superset"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "postgres",
                 host = "localhost", port = 5432,
                 user = "superset", password = pw)
rm(pw) # removes the password

# check for the cartable
dbExistsTable(con, "mpesa")
print(dbExistsTable(con, "mpesa"))
# TRUE

# query the data from postgreSQL 
df_paidin <- dbGetQuery(con, "SELECT paidin from mpesa")
df_paidout <- dbGetQuery(con, "SELECT withdraw from mpesa")
df_details <- dbGetQuery(con, "SELECT details from mpesa")


print(df_paidout)
