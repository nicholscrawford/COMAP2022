%% Calculate welfare for a variety of values
P = [1, 5];
y1 = 0:1:100;
y2 = 0:1:100;

Z = zeros(length(y1),length(y2));
for i = 1:length(y1)
    for j = 1:length(y2)
        Y = [y1(i), y2(j)];
        Z(i,j) = WF(Y,P);
    end
end

%% Create Heatmap
[X,Y] = meshgrid(y1,y2);
figure(1)
imagesc(flipud(Z));

set(gca, 'YTickLabel', 90:-10:0);
set (gcf, 'color', 'w');

xlabel("Y_1", 'fontsize', 25)
ylabel("Y_2", 'fontsize', 25);
set (gca, 'linewidth', 4)

%// Add colour bar
colorbar;


%%
WF([5,25],P)


%% Necessary Functions

function out =  WF(Yraw,P)
    Y = Yraw./P
    out = YBar(Y)*exp(-TL(Y));
end

function out = YBar(Y)
    out = mean(Y);
end

function out = TL(Y)
    out = mean( Y ./ YBar(Y) .* log(Y ./ YBar(Y)) );
end