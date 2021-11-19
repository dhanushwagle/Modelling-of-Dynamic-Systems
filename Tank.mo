package Tank
	/*
	Package for simulating tank
	author: Dhanush Wagle
	version: 1.alpha
	date: 9/6/2020
	*/
	// define
	model SimTank
		// instantiate/create a model from ModTank
		ModTank tank1;
		ModTank tank2(h0=0.3);
		// input flow
		Real _md_i "influent mass flow rate, kg/s";
		output Real _h1 "tank level, dm";
		output Real _h2 "second tank level, dm";
	equation
		_md_i = 2;
		//inject this input to ModTank
		tank1.md_i = _md_i;
		tank2.md_i = _md_i;
		_h1 = tank1.h;
		_h2 = tank2.h;
	end SimTank;
	// define 
	model ModTank
		// Table 2.8: constants and parameters
		// constants
		constant Real rho = 1 "liquid density, kg/L";
		// parameters
		parameter Real A = 5 "cross sectional area, dm2";
		parameter Real K = 5 "valve constant, kg/s";
		parameter Real h_s = 3 "level scaling, dm";
		// Table 2.9: Operating condition
		// initial parameters
		parameter Real h0 = 1.5 "initial level, dm";
		parameter Real m0 = rho*h0*A "initial mass.kg";
		// differential variable
		Real m(start = m0) "mass in tank, kg";
		// algebraic variables
		Real md_e "effluent mass flow, kg/s";
		Real V "liquid tank volume, L";
		Real h "liquid level, dm";
		// input
		input Real md_i "influent mass flow, kg/s";
	equation
		der(m) = md_i - md_e;
		m = rho*V;
		V = A*h;
		md_e = K*sqrt(h/h_s);
	end ModTank;
end Tank;
