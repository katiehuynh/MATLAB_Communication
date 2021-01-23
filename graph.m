% calculate "hour bins"
% bin 1 -> first hour of trials, based on obj.startTimes

% bin1 = obj.startTimes();


% size(hour_vector); % 1 x 2000
% if(obj.responded == )
% hour_vector = 


% size(hour_vector) -> 1 x 2000, unique(hour_vector) = [1, 2, 3, 4, ... 24];
% for each hour bin, calculate the correct rate (after adjusting for responded trials) -> obj.responseCorrect(obj.responded);


%size(hour_correct_vector);
%plot(hour_correct_vector);
int x, y, y2;
x = linspace(0,2*pi,50);
y = sin(x);
plot(x,y,':');

hold on;
y2 = cos(x);
plot(x,y2,'--ro');
hold off;