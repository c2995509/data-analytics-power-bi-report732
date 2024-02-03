# Power Bi Project
## Prepare the Data
### Install Power Bi Deskstop
First first stage is to download the Power Bi Deskstop version only. There are multi different versions of Power BI and unfortunately Microsoft charge a fee to use, 
also if you which to publish Power Bi reports of the web, a publishing license is aslo required. This is my understanding of the legal framework
### Load Data Tables
The following data tables are required to be loaded into Power BI
1. Customer Table
2. Product List
3. Order Table
4. Stores Table
5. Calendar Table

#### Order Table
The orders table is stored on the Azure SQL Database. The process of transfer the data from Azure to Power Bi is as follows:
Create a new Power Bi File and in this instance we called it OrderBi. The file extension is .pbix
When the new file has been created. Select icon labelled Get Data under the Home menu.
A list will appear, go to the bottom of the list and select more, A full list of software packages will appear where Power Bi can work with.
Seelect The Azure option. Then a further sub list will appear and highlight Azure SQL Server. Click on Connect
A log in box will appear and input the  following
 - server_name = my-server-maya.database.windows.net
 - database_name = Leave Blank
 - username = maya
 - password = AiCore127!
import or direct (Select Import)
The difference between import and direct is very simple. Import will extract the table to local machine and is stored within PowerBI program. Where as Direct the data is kept
on the cloud within the Azure Databas and all queyies will pull all relevant data from this, But no data is stored locally.
Highlight Orders_db, And then Select Connect (bottom left)
Once you have the data, you will have too option either load or transform. (It is adviseable to always select transform, mainly because of data quality issues)
Select transform, and a query editor windows will appear with the data table.
In the editor Que/sowindow do the following steps
1. Remove the card column
2. Split Order DateTime column into two columns (Date & Time) (Using the split by delimitinator function)
3. Change data type of split columns
4. Rename split columns
5. Split Shipping Date Column into two Columns (Date & Time) (Using the split by delimitinator function)
6 Change Date Type of shipping Date & Time Columns
7. Rename Shipping Data & Time columns accordingly and all other columns
8. Rename all query steps taken to somethink more meaningful description
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/4cd41545-162e-436b-83f4-3909c8785817)
9. on the home menu select Close & Apply. This will then save your query
10. The Structural relationship screen will appear showing the query table. Fill in the properties with relevant details.
    ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/7acae41d-f1f1-4f7e-8519-4918c2359ee9)
    As this table is classified as main table unqiue column is required, therefore level Key Column blank.
#### Installing Product List
The PRoduct table is supplied by AI Core training Website. Select file *csv) and download and save to local drive.
Open Power BI and select Get Data Icon and select text/CSV option.
Like with Customer table. Once you have the data in the Query editor. Review the data quality.
The project requirements was to make the weights colum into kg and split the numerical number and text into two columns.
With this in mind theafter reviewing this column with data is 80 x 25g, 12ml,25kg,28g,16oz. 
With this in mind I did the following steps.
 1. filter the weight column to look for all rows containing "kg"
 2. Rename the table as Product 1
 3. Split Weights Column by deliminator (use 'k') As the deliminator
 4. Replace the second Weights column from g to kg/ Rename column **UNITS**
 5. Change first split column data type to decimal and Rename **Weights**
 6. Select Apply and Close on home tab
Then go to get data and repeat process but 
 B1. Filter all rows containing "g" and Not containing "X" and "k"
 B2. Rename the Table Product 2
 B3. Split Weights Column by deliminator (use 'g') As the deliminator
 B4. Change data type of numerical colum to decimal
 B5. Under Columns menu select new column and select numerical Weights column and divide by 1000 (Converting g into kg)
 B6. Remove original two split columns
 B7. Add a new Column called "Units" and enter = "kg"
 B8. Apply and Close
Repeat process B1 to B8 to capture weights columns with ml
With the excpt calling table Product 3 and spliting the weight column using "m" as the deliminator
and convert to a new column into kg
Do the same for weight with "oz" but rename the table Product 4.
For weights columns containing 8 x 20g repeat the same process except split the weight column twice and labell table Product 5
First split the column by 'X'. This will give 3 columns. The last column Split again by using Deliminator "g"
Add a new column called Weights Containing a calculation (the first split Column multiply by the numerical (2nd Split) divided by 1000 (converting into ky
Remove all split columns and add new column labelled units with value "kg"
Apply and Close
**Final step**
Select product 1 and select Append Query.3 or more Tables option.
Select all product tables 1 to 5 and select OK
(Please note all tables should be contain the same amount of columns and the retrospective columns are the same data type.
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/9d51021a-a7dd-4d71-9b6b-c65e8e424beb)
Rename the new Query as Product_lookup.
Applied steps to clean columns headings and under home menu select coumns icon and select those columns you want to keep.
Apply and Close
Open the table properties and enter complete as below (similar to Orders) The only difference enter the unique column in the key Columnns box

![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/869f9bbd-92ee-4492-b606-84d611a0bfd9)

#### Installing Customer Table
The Customer list is supplied in a zip file. Download and unzip the file onto local drive folder.
Select Get Data Icon from the main menu and select the folder option, and select the unzipped folder
The query editor screen will display a table containing all the files within the folder, The very first column, the column header a symbol is shown, select the symbol
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/da65c91d-ebfc-45ff-b311-cc55e6f4f688)
This will open up and merge all files listed in the table into one.
Select the transform option, and select the relevant query options to cleanse and sort the merged table inot a usable format.
Rename the merged table query editor as Customer_lookup, illustrated below
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/13218f2d-6919-41e4-bd38-b5650d1a073d)
Once all the necessary changes have occured select Apply and close option from the home tab
#### Installing Stores Table
The Stores data table is stored on Azure Blob. To retrieve the file select the relevnt option list in the Get Data Icon. And follow the relevant steps that appear.
Once the query editor in open make the relevant changes using the tools available in the query editor until the data is transformed into a usuable format.
Change the name of the table to Stores_lookup
Then select Apply and close on the home tab.
Just like all other tables in the relationship window update the tables properties with the necessary information explaining what is in the table and any unique fields.
By doing this when you and building the schema all the tables will automatically join together with under one to many relationship. 

Save file and upload to github 
The next stage is to create a Date table, for time intelligence calculations e.g Revenue YTD, Previous Year's revenue etc.
The date table inthis instance is created slightly differently to the rest, and is not done in the Query editor mode, but in the table view mode.
Please note as for this project we are dealing with static dates, otherwise a rolling calendar would be required which is created in the Quey Editor wmode.
To create a date table in the table view mode, in the home tab select the new table icon.
A new table is opened, 
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/66604084-fc3f-442e-a748-3b4b6fea71a9)
In the formula box indicated above, enter the following DAX code "Calendar_lookup = CALENDAR(MIN(Orders[Order Date]), MAX(Orders[Shipping Date]))
Select the option mark table as date table, in the Table tools menu, A continous column containing all thedates listed in the orders table will apeear, Cange the data type to Date,
and reformat the date format to dd/mm/yyyy. 
There is the option to create a full date table using the advance editor function, but in this instance the date table was expanded manually column by column.
To create a new columns select new column option in the table menu enter the following,
1. WeekDay = FORMAT([Dates],"dddd")
2. Month No = MONTH(Calendar_lookup[Dates])
3. Month Name = FORMAT([Dates],"mmm")
4. Quarter = "Qtr " & QUARTER([Dates])
5. Year = YEAR([Dates])
6. Day of Week = WEEKDAY([Dates],2)
7. Start of Week = [Dates]+1-WEEKDAY([Dates]-1)
8. Start of Month = STARTOFMONTH(Calendar_lookup[Dates])
9. Start of Quarter = STARTOFQUARTER(Calendar_lookup[Dates])
10. Start of Year = STARTOFYEAR(Calendar_lookup[Dates])
Once the Date table has been expanded to the required level, save and reopen the model view window.
Connect the date table to the orders table on Dates to Order Dates & Shipping Dates) by simply draging the Order date & shipping Date over to the Date table. (creating a many to one relationship ( i.e Many order dates and a singular Date in the date table . The connection from Dates and shipping dates will be a dotted line.

##Save and back up Power Bi File
**Start Visualisation**
The first call in starting the visualisation is create a new table called Measures. The reason for this is that a lot of calculations will be created during the construction of the visuals and by having a table called measures, it makes the whole structure more tidy and easier to work with plus keeping all the Dax calculations in one place.





