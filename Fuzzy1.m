clear all;

a=newfis('settletime')

%Range dari -30 sampai 30
a=addvar(a, 'input', 'preasure', [-30 30]);

%angka 1 merujuk pada input pertama
a=addmf(a, 'input',1, 'NB', 'gaussmf', [-30 -30 -20]);
a=addmf(a, 'input',1, 'NS', 'trimf', [-28.8 -18.8 -6.27]);
a=addmf(a, 'input',1, 'Z', 'trimf', [-17.3 -6.94 4.68]); 
a=addmf(a, 'input',1, 'PS', 'trimf', [-6.63 5.35 16.5]);
a=addmf(a, 'input',1, 'PB', 'trapmf', [5.32 17 30 30 ]);
figure;plotmf(a, 'input', 1);

%range dari 0 sampai 30
a=addvar(a, 'input', 'temperature', [0 30]); 
%angka 2 merujuk pada input kedua
a=addmf(a, 'input',2, 'low', 'trapmf', [0 0 5 12.49]);
a=addmf(a, 'input',2, 'medium', 'trimf', [0.2904 12.3 24.31]);
a=addmf(a, 'input',2, 'high', 'trapmf', [12.29 24.3 36.31 36.31]);
figure;plotmf(a, 'input', 2);

%range dari 0 sampai 15
a=addvar(a, 'output', 'time', [0 15]);
%angka 1 merujuk pada output pertama
a=addmf(a, 'output',1, 'short', 'trapmf', [0 0 4 7.568]);
a=addmf(a, 'output',1, 'average', 'trimf', [0.1223 7.54 14.96]);
a=addmf(a, 'output',1, 'long', 'trapmf', [7.512 10 15 15]);
figure;plotmf(a, 'output', 1);

%pembuatan rule
%1 keempat merupakan bobot
%1 terakhir yaitu operator -> "AND = 1" "OR = 2"
rule=[ 1 3 1 1 1; 2 2 2 1 1; 3 3 2 1 1; 4 0 3 1 1];

a=addrule(a, rule);
 
%defaultnya centroid
aa=setfis(a, 'Defuzzmethod', 'centroid');
time1=evalfis([-22 15], aa)

%bb=setfis(a, 'Defuzzmethod', 'mom')
%time2=evalfis([-22 15], bb)
