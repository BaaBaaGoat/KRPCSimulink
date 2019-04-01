function KRPC_Wrapper_SetData2(pitch,roll,yaw)
global KRPC;
KRPC{'interfControl'}.pitch = pitch;
KRPC{'interfControl'}.roll = roll;
KRPC{'interfControl'}.yaw = yaw;
end