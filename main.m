clc; close all;


% Note: You can change N in "Wave.m" to get a different resolution

%% PART A: Synthesis 
%--------------------
CMS_1 = [1 3 5 7]; %Harmonics
CMS_2 = [1 6 1 2]; %Coeffeicients

% Creating & plotting individual harmonics
w1 = Wave(CMS_1(1), CMS_2(1));      w1.plt(4,2,1, "signal 1:   F=" + w1.k);
w2 = Wave(CMS_1(2), CMS_2(2));      w2.plt(4,2,2, "signal 2:   F=" + w2.k);
w3 = Wave(CMS_1(3), CMS_2(3));      w3.plt(4,2,3, "signal 3:   F=" + w3.k);
w4 = Wave(CMS_1(4), CMS_2(4));      w4.plt(4,2,4, "signal 4:   F=" + w4.k);


% Creating & plotting the final synthesized wave
result = Wave(CMS_1,CMS_2);
result.plt(4,2,[5 6], "Final Wave");


%% Part B: Decomposition
%----------------------
% we have a wave stored in object *result*. So now we are going 
% to desynthesize *result* to get the original functions.
% To be fair, i wont use the object result but instead use "signal"

signal = result.wave;

% calculating the period:
for bb = 2:length(signal)
    if signal(1) == signal(bb)
        N=bb-1 % Period N
        break;
    end    
end

k = 1:9;
ak = zeros(1,9);
temp=0;
for ii=1:9
    for n = 1:N
        temp = temp + signal(n) * exp(1j*(2*pi/N)*ii*n);
    end
    ak(ii) = round(abs(2*temp/N)); 
    temp=0;
end

k
ak

subplot(4,2,[7 8]);
stem(k,ak, 'r');
xlabel("Forier Spectrum");
axis([0, 10, 0, max(ak)+2]), grid;


