function KRPC_Wrapper_SetData(motor_power,throttle)
global KRPC;
KRPC{'interfControl'}.throttle = throttle;
for i=1:4
    KRPC{'interfEngines'}{i}.thrust_limit = motor_power(i);
end
end