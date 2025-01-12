% Author Name: [Logan Krowicki]
% Email: [Krowic78@rowan.edu]
% Course: MATLAB Programming - Fall 2024
% Assignment: Assignment 2
% Task: [Task Name]
% Date: [Submission Date]

%1-Population Growth Analysis
%Create vector that includes data for population
%population =  [5000, 5200, 5350, 5600, 5800];

%Define growth_rate as the rate of change of the population every year
%growth_rate = (population(2:end) - population(1:end-1)) ./ population(1:end-1);

%Matrix that has population in the first row and growth rate in the second
%row
%pop_data = [population; [0 growth_rate]];

%Header to print the year, population and growth rate
%fprintf('Year\tPopulation\tGrowth Rate (%%)\n');

%Loop that goes over the data for every year
%for i = 1:length(population)
    %Tells that the first year there is no growth
    %if i == 1
        %fprintf('%d\t%d\t\t0%%\n', i, population(i));
    %Goes over the population and growth for the rest of the years
    %else
        %fprintf('%d\t%d\t\t%.2f%%\n', i, population(i), growth_rate(i-1));
    %end
%end

%2-Simple Encryption Formula
%Define the function as encryption
%function message_encrypted = caesar_cipher(message, shift)
%Define variable as string
    %message_encrypted = '';
%Create for loop that takes and shifts the letters
    %for i = 1:length(message)
        %first_char = message(i);
        %shift_char = char(mod(double(first_char) - double('a') + shift, 26) + double ('a'));
        %message_encrypted(i) = shift_char
    %end
%Makes sure the code only accepts shitf values 1-25 using if statement        
    %if shift > 25 || shift < 1
%Tells the user if they inputed an invalid number
        %fprintf('Shifter value must be between 1 and 15');
    %end
%end
%Ask for user input for desired message and shift value
%shifted = input('Enter a shift value 1-25:');
%message = input('Enter a message to be encrypted:', 's')
%Define function
%message_encrypted = caesar_cipher(message, shift);
%Display the output
%fprintf('Your message: %s\n', message);
%fprintf('Your encrypted message: %s\n', message_encrypted)

%3-Weather Data Analysis 

% Read data from file
%data = readcell('weather_data.txt', 'Delimiter', ',');

% Extract numerical data (skipping header row)
%temperature = cell2mat(data(2:end, 2));
%humidity = cell2mat(data(2:end, 3));
%precipitation = cell2mat(data(2:end, 4));

%Calculate the averags and totals for all variables
%average_temp = mean(temperature);
%average_humid = mean(humidity);
%total_precip = sum(precipitation);

%Putting averages and totals with labels into string so it can be displayed
%as the results
%results = sprintf('Average Temperature: %.2f\nAverage Humidity: %.2f\nTotal Precipitation: %.2f\n', average_temp, average_humid, total_precip);

%Opening the weather_summary.txt and printing the results
%fid = fopen('weather_summary.txt', 'w');
%fprintf(fid, '%s', results);
%fclose(fid);

%Additionally displaying the results in the command window
%disp(results)

%4- Solar System Visualization
%Define function
%function solar_system_visualization()
    %Make vector containing values for distance and size
    %planet_distances = [0.39, 0.72, 1.00, 1.52, 5.20, 9.58, 19.22, 30.07];
    %planet_sizes = [0.38, 0.95, 1.00, 0.53, 11.21, 9.45, 4.01, 3.88];
    
    %Put scatterplot on top half of figure
    %subplot(2, 1, 1)
    %hold on; 
    %Set colors, size, and create scatter using for loop and variables
    %colors = lines(length(planet_sizes));
    %for i = 1:length(planet_sizes)
        %scatter(planet_distances(i), planet_sizes(i) * 1, 40 * planet_sizes(i), colors(i,:),'MarkerEdgeColor', 'k', 'DisplayName',  ['Planet ', num2str(i)]);
    %end
    %hold off; 
    %Set title and axis titles for scatter plot
    %title('Planet Distances vs Planet Sizes');
    %xlabel('Planet Distances (AU)');
    %ylabel('Planet Sizes (Relative to Earth)');
    
    %Set bar chart on bottom half of figure
    %subplot(2, 1, 2);
    %Set the planets and their values for the chart
    %categories = {'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'};
    %values = [0.38, 0.95, 1.00, 0.53, 11.21, 9.45, 4.01, 3.88];
    %bar(values);
    %set(gca, 'xticklabel', categories);
    %Set the title and titles of the axis for the chart
    %title('Planet Distances From the Sun (AU)');
    %xlabel('Planets');
    %ylabel('Distance In AU');
    %Save the chart as a png 
    %saveas(gcf, 'solar_system_visualization.png');
%end

%5-Stock Market Analysis

%Brings closing prices from other file
prices = load('stock_data.m');

%Calculates average, lowest, and highest prices using the data from the
%other file
average_price = mean(prices);
highest_price = max(prices);
lowest_price = min(prices);

%Calculates how much the stock increased
increase_price = sum(diff(prices) > 0);

%Creates line plot
figure;
plot(prices, '-o', 'LineWidth', 1.5);
hold on;

%Sets horizontal lines showing mean, and highest/lowest price
yline(average_price, '--r', 'Average Price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
yline(highest_price, '--g', 'Highest Price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
yline(lowest_price, '--b', 'Lowest Price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
hold off;

%Sets title for plot
title('Daily Closing Prices of Stock');
xlabel('Days');
ylabel('Closing Price');

%Saves plot as png file
saveas(gcf, 'stock_analysis.png');

%Creates seperate summary for price data
fid = fopen('stock_summary.txt', 'w'); %
fprintf(fid, 'Stock Analysis Summary:\nAverage Closing Price: %.2f\nHighest Closing Price: %.2f\nLowest Closing Price: %.2f\nNumber of Days Price Increased: %d\n', average_price, highest_price, lowest_price, increase_price);
fclose(fid); 