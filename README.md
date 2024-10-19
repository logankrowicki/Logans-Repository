% Author Name: [Logan Krowicki]
% Email: [Krowic78@rowan.edu]
% Course: MATLAB Programming - Fall 2024
% Assignment: Assignment 2
% Task: [Population Growth Analysis]
% Date: [10/18/2024]

%1-Population Growth Analysis
%Create vector that includes data for population
population =  [5000, 5200, 5350, 5600, 5800];

%Define growth_rate as the rate of change of the population every year
growth_rate = (population(2:end) - population(1:end-1)) ./ population(1:end-1);

%Matrix that has population in the first row and growth rate in the second
%row
pop_data = [population; [0 growth_rate]];

%Header to print the year, population and growth rate
fprintf('Year\tPopulation\tGrowth Rate (%%)\n');

%Loop that goes over the data for every year
for i = 1:length(population)
    %Tells that the first year there is no growth
    if i == 1
        fprintf('%d\t%d\t\t0%%\n', i, population(i));
    %Goes over the population and growth for the rest of the years
    else
        fprintf('%d\t%d\t\t%.2f%%\n', i, population(i), growth_rate(i-1));
    end
end
