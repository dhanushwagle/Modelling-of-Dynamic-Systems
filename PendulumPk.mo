package PedulumPk
	//
 model SimPendulum
 	// Model to simulate core model in Pendulum
 	Pendulum pend "instance of Pendulum class";
 	Real _F "input to model pend, N";
 equation
 	_F = 4*sin(2*pend.PI*time);
 	pend.F = _F;
 end SimPendulum;
	//
	model Pendulum
		/*
		Core model of pendulum
		author: Dhanush Wagle
		date: 9/6/2020
		*/
		// Table 1 Parameters
		// Constants
		constant Real g = 9.81 "acceleration of gravity, m/s2";
		constant Real PI = 3.141592 "pi, -";
		// Parameters
		parameter Real m = 5 "mass of pendulum, kg";
		parameter Real L = 2 "length of pendulum, m";
		// Table 2: Operationg conditions
		// Initial State Parameters
		parameter Real alpha0 = PI/2 "initial angle, rad";
		parameter Real omega0 = 0 "initial angular velocity";
		// Define state variables
		Real alpha(start = alpha0) "pendulum angle, rad";
		Real omega(start = omega0) "pendulum angular velocity, rad/s";
		// Define input
		input Real F "input force, N";
	equation
		der(alpha) = omega;
		der(omega) = (-g/L)*(sin(alpha)) + (F/m*L)*(sin(alpha));
	end Pendulum;
end PedulumPk;
