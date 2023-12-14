# Chapter 13

sales_data <- read.csv('sales_data.csv')


library(ggplot2)
# Plot the number of items sold by item name
ggplot(sales_data, aes(x=Item_Name, y=Number_Sold, fill=Item_Price)) + 
geom_bar(stat='identity') + 
# "+" is used to add a layer to the plot created by ggplot().
# geom_bar() is a function used to create a bar plot.
# stat='identity' specifies that the height of the bars should be determined by the data values.
scale_fill_gradient(low='yellow', high='blue') +
# fill the bars with a color gradient ranging from blue to yellow mapped with Item_Price.
theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
# to customize the appearance of the plot.
# axis.text.x specifies the x-axis text.
# element_text() is a function used to customize the appearance of text.
# angle = 45 specifies the angle at which the x-axis labels should be rotated.
# hjust = 1 specifies the horizontal justification of the x-axis labels.
labs(x='Item Name', y='Number of ItemsSold', title='Store Sales by Item')
# labs() is a function used to customize the plot labels.



