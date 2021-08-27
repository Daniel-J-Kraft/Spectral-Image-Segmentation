masterPrune = master(2400:end,:);
xEst = [ones(length(masterPrune(:,1)),1),masterPrune(:,6)];
figure(1);
betaEst = xEst\masterPrune(:,7);
plot(xEst(:,2),xEst*betaEst); hold on;
scatter(xEst(:,2),masterPrune(:,7),'.');

xReal = xEst;
betaReal = xReal\masterPrune(:,8);
figure(2);
plot(xReal(:,2),xReal*betaReal);hold on;
scatter(xReal(:,2), masterPrune(:,8),'.');
