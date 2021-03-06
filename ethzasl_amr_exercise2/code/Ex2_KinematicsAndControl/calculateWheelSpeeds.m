function [ LeftWheelVelocity, RightWheelVelocity ] = calculateWheelSpeeds( vu, omega, parameters )
%CALCULATEWHEELSPEEDS This function computes the motor velocities for a differential driven robot

wheelRadius = parameters.wheelRadius;
halfWheelbase = parameters.interWheelDistance/2;

LeftWheelVelocity = (vu-omega*halfWheelbase)/wheelRadius;
RightWheelVelocity = (vu+omega*halfWheelbase)/wheelRadius;
end
