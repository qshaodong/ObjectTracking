%% HEADER
% @file applyKalman.m
% @author Benjamin Brown (bbrown1867@gmail.com)
% @author Taylor Dotsikas (taylor.dotsikas@mail.mcgill.ca)
% @date February 20th, 2015
% @brief Function to apply Kalman filter equations for improved position
% @param z: 2x1 measurment vector containing (x,y) position
% @param x_old: 4x1 state vector containing (x,y) position and velocity
% from the previous iteration (k-1)
% @param P_old: 4x4 covariance matrix containing Kalman confidence from the
% previous iteration (k-1)
% @param t_step: A value containing the time between measurements
% @retval x_new: 4x1 state vector containing (x,y) position and velocity
% from the current iteration (k)
% @retval P_new: 4x4 covariance matrix containing Kalman confidence from the
% current iteration (k)

function [x_new, P_new] = applyKalman(z, x_old, P_old, t_step)

%% INITIALIZE USER DETERMINED, STATIC VARIABLES
F = [1 0 t_step 0; 0 1 0 t_step; 0 0 1 0; 0 0 0 1];
H = [1 0 0 0; 0 1 0 0];
w = [1 1 1 1]'; %TODO: What is the error in the theoretical model?
v = [1 1]'; %TODO: What is the error in the measurement process?
Q = diag([var(w) var(w) var(w) var(1)]);
R = diag([var(v) var(v)]);

%% PREDICTION EQUATIONS
x_new_pred = F * x_old;
P_new_pred = F*P_old*F' + Q;

%% INTERMEDIATE CALCULATIONS
y = z - H*x_new_pred;
S = H*P_new_pred*H' + R;
K = P*H'\S;

%% UPDATE EQUATIONS
x_new = x_new_pred + K*y;
P_new = (eye(4) - K*H)*P_new_pred;

end

