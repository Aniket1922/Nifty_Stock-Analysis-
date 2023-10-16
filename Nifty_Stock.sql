# Display databases
show databases;

# Display tables
show tables;

use Company;

# To show the table structure
desc nifty_stock;

# Display all record which is present in nifty_stock table
SELECT * FROM company.nifty_stock;

#Find all stock symbols from the 'Nifty_stocks' table
Select symbol from nifty_stock;

#Find the highest low price for each stock
Select symbol, MAX(low) as highest_low_price from nifty_stock group by symbol;

#Calculate the average open price for each stock
Select symbol, avg(open) as avg_open_price from nifty_stock group by symbol;

#List the top stocks by volume in ascending order
Select symbol, volume_in_lacs from nifty_stock where volume_in_lacs>100 order by volume_in_lacs asc;

#Find the highest and lowest open and low value for the Nifty index
Select max(open) as highest_open, min(low) as lowest_closing from nifty_stock;

#Find the details where the Nifty index open value was higher than 100
Select * from nifty_stock where open> 100;

#Calculate the average daily price range (high - low) for each stock symbol
Select symbol, avg(open - low) as avg_price_range from nifty_stock group by symbol;

#Find the stock symbols along with their highest turnover values
Select symbol, MAX(turnover_crs) as highest_turnover_value From nifty_stock group by symbol;

#Find the top 5 stock symbols along with their highest low values, ordered by low value in descending order
Select symbol, MAX(low) as highest_closing_value from nifty_stock group by symbol order by highest_closing_value desc limit 1,5;

#Find the stock symbols and their respective average trading volumes, ordered by symbol in ascending order
Select symbol, avg(volume_in_lacs) as avg_trading_in_lacs from nifty_stock group by symbol order by symbol asc;

#Find the top 5 closing values of the Nifty index in descending order
Select symbol,low from nifty_stock order by low desc limit 5;

#find the stocks with a positive percentage change
Select Symbol,Chng, Percent_Chng From nifty_stock Where Chng > 0;

#Find the stock symbols with the highest turnover in crores
Select Symbol, max(Turnover_crs) as highest_turnover from nifty_stock group by symbol;

#Calculate the average change in percentage for all stocks
Select avg(Percent_Chng) as avg_percentage_change from nifty_stock;

#Find the stocks with a 52-week high above 100
Select Symbol,52w_H from nifty_stock where 52w_H > 100;

#Find the top 5 stocks with the highest 365-day percentage change
Select Symbol,365d_Percent_chng From nifty_stock Order by 365d_Percent_chng desc limit 5;

#Calculate the average volume for stocks with a percentage change above 1%
Select symbol, avg(Volume_in_lacs) as avg_volume from nifty_stock  where Percent_Chng > 1 group by symbol;

#find the stocks with a 30-day percentage change below -10%
Select Symbol,30d_Percent_chng from nifty_stock where 30d_Percent_chng< -10;

# Using Having clause

#Find stocks with an average volume greater than 100
Select Symbol, avg(Volume_in_lacs) as avg_volume from nifty_stock group by Symbol having avg_volume > 100;

#find stocks with more than 10% 365-day percentage chang
Select Symbol, 365d_Percent_chng from nifty_stock having 365d_Percent_chng > 10;

#Calculate the average percentage change for stocks with an average closing value above 100
Select Symbol, avg(Percent_Chng) as avg_percentage_change from nifty_stock group by Symbol having avg(low) > 100;

#Find stocks with a maximum 52-week high greater than 100
Select Symbol, MAX(52w_H) as max_52_week_high from nifty_stock group by Symbol having max_52_week_high > 100;

#find stocks with a maximum Chng value below -50 and an average LTP above 100
select Symbol, MAX(Chng) as max_change, avg(LTP) as avg_closing_value from nifty_stock group by Symbol having max_change < -50 and avg_closing_value > 100;

#Calculate the average 52-week low for stocks with a maximum 365-day percentage change greater than 20%
Select Symbol, avg(52w_L) as avg_52_week_low from nifty_stock group by Symbol having MAX(365d_Percent_chng) > 20;

#Find stocks with an average LTP above 100 and a maximum turnover greater than 300
Select Symbol, avg(LTP) as avg_closing_value, MAX(Turnover_crs) as max_turnover from nifty_stock group by Symbol having avg_closing_value > 100 and max_turnover > 300;

#Calculate the average opening value for stocks with a minimum 30-day percentage change of -5%
Select Symbol, avg(Open) as avg_opening_value from nifty_stock group by Symbol having min(30d_Percent_chng) < -5;

#Count the number of stocks with a maximum Chng value below -10
Select COUNT(*) as count_below_minus_10 from nifty_stock group by symbol having max(Chng) < -10 ;

#Count the number of stocks with a maximum 365-day percentage change above 10%
select COUNT(*) as count_above_10_percent_change from nifty_stock group by Symbol having max(365d_Percent_chng) > 10;

#Find stocks whose symbols start with the letter 'A'
select * from nifty_stock where Symbol like 'A%';

#find stocks with symbols containing the word 'BANK'
select *from nifty_stock where Symbol like '%BANK%';


#Using Sub Queries

#display symbol,open,high,low of those stock whose Turnover is smallest of any one of the symbol
select symbol,open,high,low from nifty_stock where Turnover_crs=(select min(Turnover_crs) from nifty_stock);

#display the records of symbol whose turnover is more than avg turnover
select * from nifty_stock where turnover_crs>(select avg(Turnover_crs) from nifty_stock);























