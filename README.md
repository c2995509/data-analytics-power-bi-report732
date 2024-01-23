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




