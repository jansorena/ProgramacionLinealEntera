set INDIVIDUOS;

param hi {i in INDIVIDUOS} symbolic;
param hi2 {i in INDIVIDUOS} symbolic;
param di {i in INDIVIDUOS};
param qi {i in INDIVIDUOS};
param ri {i in INDIVIDUOS};

param qprom;
param rmin;

var x {i in INDIVIDUOS} binary;

maximize Z: sum {i in INDIVIDUOS} di[i] * x[i];

subject to Restriccion1:
	sum{i in INDIVIDUOS: hi[i] = 'Programador' or hi2[i] = 'Programador'} x[i] <= 3;

subject to Restriccion2:
	sum{i in INDIVIDUOS: hi[i] = 'Realidad Virtual' or hi2[i] = 'Realidad Virtual'} x[i] <= 2;

subject to Restriccion3:
	sum{i in INDIVIDUOS: hi[i] = 'Atacante' or hi2[i] = 'Atacante'} x[i] >= 1;

subject to Restriccion4: 
    x['Elon_Musk'] + x['Mark_Zuckerberg'] <= 1;

subject to Restriccion5: 
    (sum {i in INDIVIDUOS} qi[i] * x[i]) / 6 >= qprom;

subject to Restriccion6: 
    (sum {i in INDIVIDUOS} ri[i] * x[i]) >= rmin;

subject to Restriccion7: 
    sum {i in INDIVIDUOS} x[i] = 6;

