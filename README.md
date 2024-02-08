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
and enter the required details, 
Then select Import option
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
Expand the calendar table to meet requirements
Once the Date table has been expanded to the required level, save and reopen the model view window.
Connect the date table to the orders table on Dates to Order Dates & Shipping Dates) by simply draging the Order date & shipping Date over to the Date table. (creating a many to one relationship ( i.e Many order dates and a singular Date in the date table . The connection from Dates and shipping dates will be a dotted line.

Save and back up Power Bi File
#### **Start Visualisation**
The first call in starting the visualisation is create a new table called Measures. The reason for this is that a lot of calculations will be created during the construction of the visuals and by having a table called measures, it makes the whole structure more tidy and easier to work with plus keeping all the Dax calculations in one place.
**Creating Report Pages**
The are 4 report pages to create (Executive, Customer, Product and Stores.
on the bottom of the Report view window page 1 tab will appear, Rename this Executive, then select the icon next to it (Green + symbol) press it 3 times and pages 2,3,4 will appear and rename them accordingly.
Select the colour scheme you require.
Select the executive Page and Insert a navigation pane. To do this insert a rectangle shape and drag and resize accordingly and place it on the left hand side of the screen, and change the colour.
Copy and paste shape onto the other pages nd place it on the left hand side of the view screen.
**Build a visualisation on the Customer Page**
The following visualisation to be created on the Customer Page
1. Headline Visual Cards x5
   TO create a visual Card, First select a rectangluar shape, and alter in to the required size and shape. (Use the Format menu to change colour and certain elements)
   Then select the singular Card visual option and drag over the rectangle, and in the format menu bring forward the card so it appears above the rectangle, and align it accordingly to the rectangle.
   Select both the card and rectangle and right click the mouse and select group option, Copy and passte x5,
   Arrange all Cards with rectangle shape accordingly along the top of the Customer page.
   Next stage is to drag the relevant measure and place it in the values box as illustrated below
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/36303af7-f911-4f20-9f46-af5a393e18db)
   Repeat the same process for all 5 visual cards.
   The following dax measures are being used
'''
Total Customers = DISTINCTCOUNT(Orders[User ID])
Revenue per Customer = [Total Revenue]/[Total Customers]
Total Revenue = SUMX(Orders,Orders[Product Quantity]*RELATED(Product_lookup[Sales Price]))
Top Customer = MAXX(TOPN(1,Customers_lookup,[Revenue per Customer],DESC),Customers_lookup[Full Name])
Top Customer Revenue = MAXX(TOPN(1,Customers_lookup,[Revenue per Customer],DESC),[Total Revenue])
'''
   As you can see the benefit of Dax formulas is that you can incorporate other Dax forumlas into other Dax Formulas
3. Line Chart
   Build a line Chart visualisation with trending line.
   Select the visual line chart Icon and place in required position in the report window
   Select the correct measure and the correct data field by means of draging from the table list into repective visual blank boxesOpen the format pane of the visual and change the relevant section
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/9900b770-d5fc-4d92-9bdb-d399656c3401)
   Once line graph has been position and relevant details have been added, the next step is to format various element off the graph by selecting the format option and modify the relevant options listed in the format,     
   like changing text size, text colour, adding a title. etc
   The final step is to create a trend line, you do this by selecting the further analyse tool and switch on the trend line and switching on the forecast and setting to the requirements.
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/a74b5f29-83d0-49c1-ba73-d07e6ccd301f)
   Save the file once line graph is completed
5. Bar Chart
   Build a bar chart to show Number of Customers by Category
   The first step is to create therequired measure calculation
'''
Total Customers = DISTINCTCOUNT(Orders[User ID])
'''
This method using the distinct function will count all customers just once and will ignore any further orders made by existing customer.
   After the measure has been created, select the relevant icon from the visual options, place resize accordingly. Then drag the Total Customers into the Y axis box, making sure it does not sum the total
   again, Then open the product table and drag the category field into the the X axis box. Then open the format element of the visual panel and make relevantadjustment to the graph, For example give the graph a title, 
   change the font size and colour.
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/b11f2357-9e39-44b6-ada7-925c7c02d61f)
7. Data Table
   Create a data table showing the top 20 customers.
   Asbefore check to see if all the measures have been created previously, and if necessary createnew measures
   The measures which will be used are
'''
Total Orders = COUNTX(Orders,Orders[Product Quantity])
Total Revenue = SUMX(Orders,Orders[Product Quantity]*RELATED(Product_lookup[Sales Price]))
Total Customers = DISTINCTCOUNT(Orders[User ID])
Top 20 Customers = MAXX(TOPN(20,Customers_lookup,[Revenue per Customer],DESC),Customers_lookup[Full Name])
Revenue per Customer = [Total Revenue]/[Total Customers]
'''
   Select the visual item for data tables and dragit across into the report windows,and drag the three measures mentioned above and the Customer Full Name intocolumns visual box (illustrated in diagram.
   TO filter the top 2o customer, the filter pane is also required making sure the Full name is listed at the top, select top n option and select the coreesponding option and enter the number 20 in relevant box, After 
   this you be needing to informed it would the top 20 customer is being baised on, for this drag another measure Revenue per customer
   ![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/bad8ce81-795d-41a5-879e-392a14a5152e)
9. Doonut
   Select the relevant visual icon, drag and resize to meet reequirements. In the relevant boxes drag and drop the required measures. Reformat to make it visually effective
11. SLider
    A slider is a mechanism that the audience of the visualisation can interact with and apply specific designated filters to various graphs, etc. In the instance the Year from the calendar has been assigned to the slider
 After all the visualisation pages have been built all is left is general tidy up, for example set control of what visualisation filtering can effect what 
**Build a visualisation on the Executive Page**
Simply repeat process but select slightly different visually, Taken into account the executive page nees to give a complete overhaul of all pages as a grand summary.
In the intances showing performance elements like Revenue by Country, Revenue by store type and the most popular sold items.
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/0f871740-519b-4728-a9e9-6e025868a90b)
**Product Visualisation**
The product summary is purely based on products, category of  groups of products and profit per orders by category etc. Below is the visualisation highlighting the various elements. The only extra element is two slicers have been added, To access these slicers the user would be required to select the required icon on the left of the page.
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/fe437f69-73d9-4d88-b8c8-844d5926b672)
**Stores Page**
The stores page is simply a map of the would with values being geographical hierarchy and the bubble value being assigned the measure profit YTD.
With a drill down page with performance of stores selected on the map via the drill down option and a top tip being added showing a gauge showing profit YTD for that selected store.
The final finishing touches are assigning navigation buttons to assist the audience to navigation between pages and the interaction between the various visualisations on each page by selecting the visual, in the main menu selecting Format and the icon edit interaction. Then one all the other visuals 3 small icons will appear and just select on of those items, the circle item will stop the interaction with selected visualisation. Highlighted below circled in red.
![image](https://github.com/c2995509/data-analytics-power-bi-report732/assets/2935215/0e6bcd84-80c3-4cd5-a924-8a095ae83b6f)

****Data Analyses data with external partners****
Sometimes it is necessary to send controlled data to external partners who will not have access to power Bi and almost certainly stop external partners from knowing certain elements of the organisation, Therefore it is sometime required to produce certain data tables with answers to certain questions. The type of question that may get asked are:
How many staff are there in all of the UK stores?
'''
SELECT country,sum(staff_numbers) as Total_Staff_Numbers
FROM dim_store
WHERE country_code='GB'
GROUP BY country;
'''
Which month in 2022 has had the highest revenue?
'''
SELECT D.month_name,ROUND(CAST(sum(O.product_quantity*P.sale_price) as BIGINT)) as Monthly_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
WHERE D.year=2022 
GROUP BY D.month_name
ORDER BY Monthly_Revenue DESC
'''
Which German store type had the highest revenue for 2022?
'''
SELECT P.category,D.month_name,S.store_type,ROUND(CAST(sum(O.product_quantity*P.sale_price) as BIGINT)) as Monthly_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
JOIN dim_store as S ON O.store_code=S.store_code
WHERE D.year=2022 AND S.country='Germany'
GROUP BY S.country,D.month_name,S.store_type
ORDER BY Monthly_Revenue DESC
'''
Create a view where the rows are the store types and the columns are the total sales, percentage of total sales and the count of orders
'''
CREATE VIEW StoresSummary_Alan AS (
with summary AS(
SELECT ROUND(SUM(P.sale_price * O.product_quantity) ::numeric,2) AS total_sales,
COUNT(O.order_date_uuid) AS count_orders,
S.store_type as store_type
FROM orders as O
JOIN dim_product as P on P.product_code = O.product_code
JOIN dim_store as S on S.store_code = O.store_code
GROUP BY S.store_type)
,
grand_total_sales AS
(SELECT
SUM(summary.total_sales) AS grand_total_sales
FROM summary)
SELECT
summary.store_type,
summary.total_sales,
summary.count_orders,
ROUND((summary.total_sales/(SELECT grand_total_sales FROM grand_total_sales))*100::numeric,2) AS perc_sales
FROM summary
)
'''
Which product category generated the most profit for the "Wiltshire, UK" region in 2021?
'''
SELECT P.category,ROUND(CAST(sum(O.product_quantity*P.sale_price) as BIGINT)) as Category_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
JOIN dim_store as S ON O.store_code=S.store_code
WHERE D.year=2022 AND S.country_region = 'Wiltshire'
GROUP BY P.category
ORDER BY Category_Revenue DESC
'''



