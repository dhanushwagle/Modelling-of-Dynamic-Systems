package pressure
	/*
	Package for simulating tank
	author: Dhanush Wagle
	version: 1.alpha
	date: 9/11/2020
	*/
	//simulation module that defines input

	model SimTank
		//creating instance
		PressureTank P1;
		// input flow
		Real _Pi "influent pressure";
		output Real _P "tank pressure";
	equation
		_Pi = 2;
		//inject this input to ModTank
		P1.Pi = _Pi;
		_P = P1.P;	
	end SimTank;
	//output module with diferential equations
 model PressureTank
 	//Parameters
 	parameter Real V = 10 "volume of the tank, m3";
 	parameter Real Pa = 1.01e5 "atmspheric pressure";
 	parameter Real Ps = Pa "scaling pressure";
 	parameter Real T = 283 "tank temperature, C";
 	parameter Real Ki = 1;
 	parameter Real Ke = 1; 
 	//constant
 	constant Real M = 18.01528 "molar mass of water, g/mol";
 	constant Real R = 8.31 "gas constant, unit";
 	//variables
 	Real mdi;
 	Real mde;
 	Real P;
 	Real n;
 	Real del_Pi;
 	Real del_Pe;
 	Real m(start = 1, fixed=true);
 	//input
 	input Real Pi;
 equation
 	der(m) = mdi - mde;
 	P*V = n*R*T;
 	m = n*M;
 	mdi = Ki*sqrt(del_Pi/Ps);
 	mde = Ke*sqrt(del_Pe/Ps);
 	del_Pi = Pi - P;
 	del_Pe = P - Pa;
 end PressureTank;
end pressure;
