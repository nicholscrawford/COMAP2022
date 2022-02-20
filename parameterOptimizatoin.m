%% Effect of of varying U
Q = 0.5*ones(5,1);
u = 0:0.01:1;
W1 = zeros(size(u));
W2 = zeros(size(u));
W3 = zeros(size(u));
for i = 1:length(u)
    Y1 = unitIncomes(u(i),Q,0.25);
    Y2 = unitIncomes(u(i),Q,0.5);
    Y3 = unitIncomes(u(i),Q,0.75);
    W1(i) = WF(Y1);
    W2(i) = WF(Y2);
    W3(i) = WF(Y3);
end
figure(1)
sgtitle('Effect of Varying U')
subplot(3,1,1)

plot(u,W1, "LineWidth", 2)
xlabel('U')
ylabel('W_F')
ylim([0 1])
set (gcf, 'color', 'w');
set (gca, 'linewidth', 4)

subplot(3,1,2)

plot(u,W2, "LineWidth", 2)
xlabel('U')
ylabel('W_F')
ylim([0 1])
set (gcf, 'color', 'w');
set (gca, 'linewidth', 4)

subplot(3,1,3)

plot(u,W3, "LineWidth", 2)
xlabel('U')
ylabel('W_F')
ylim([0 1])
set (gcf, 'color', 'w');
set (gca, 'linewidth', 4)

%% Two export rates model
U = 0;
W1 = zeros(size(u));
W2 = zeros(size(u));
W3 = zeros(size(u));
for x = 0:0.01:1
    Q = [x;x;x;1-x;1-x];
    Y1 = unitIncomes(U,Q,0.25);
    Y2 = unitIncomes(U,Q,0.5);
    Y3 = unitIncomes(U,Q,0.75);
    W1(i) = WF(Y1);
    W2(i) = WF(Y2);
    W3(i) = WF(Y3);
end
figure(2)

%% Functions

function out = unitIncomes(U,Q,E)
    P = [1.0228; 0.7476; 4.6411;1.3406;0.0431];
    S = [0.5393;0.2383;0.2152;0.0070;0.0002];
    T = [0.43 , 0.12 , 0.26 , 0.069 , 0.066 ;
        0.23 , 0.67 , 0.21 , 0.39 , 0.084 ;
        0.31 , 0.19 , 0.47 , 0.34 , 0.8 ;
        0.015 , 0.016 , 0.043 , 0.19 , 0.008 ;
        0.019 , 0.0082 , 0.024 , 0.0065 , 0.037];
    out = (1-U)*S+(T-eye(5))*S.*Q + E*U*sum(S)*P;
end

function out =  WF(Yraw)
    P = [1.0228; 0.7476; 4.6411;1.3406;0.0431];
    Y = Yraw./P;
    out = YBar(Y)*exp(-TL(Y));
end

function out = YBar(Y)
    out = mean(Y);
end

function out = TL(Y)
    out = mean( Y ./ YBar(Y) .* log(Y ./ YBar(Y)) );
end