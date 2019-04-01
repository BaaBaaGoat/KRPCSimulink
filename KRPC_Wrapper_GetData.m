function [timeout,Time,PositionECEF,VelocityECEF,Quaternion,AngularVelocity, ...
    Latitude,Longitude,Height,ControlPitch,ControlRoll,ControlYaw ...
    ,pitch,roll,yaw] = KRPC_Wrapper_GetData(t)
global KRPC;
global KRPC_t0;

timeout = true;tic();
while(toc() < 1.0)
    Time = KRPC{'streamTime'}();
    if(Time > t+KRPC_t0)
        timeout = false;
        break;
    end
end

PositionECEF = cell2mat(cell(KRPC{'streamPositionECEF'}()));
VelocityECEF = cell2mat(cell(KRPC{'streamVelocityECEF'}()));
Quaternion= cell2mat(cell(KRPC{'streamQuaternion'}()));
AngularVelocity = cell2mat(cell(KRPC{'streamAngularVelocity'}()));
Latitude = double(KRPC{'streamLatitude'}());
Longitude = KRPC{'streamLongitude'}();

Height = KRPC{'streamHeight'}();
ControlPitch = KRPC{'streamControlPitch'}();
ControlRoll = KRPC{'streamControlRoll'}();
ControlYaw = KRPC{'streamControlYaw'}();

pitch = KRPC{'streampitch'}();
roll = KRPC{'streamroll'}();
yaw = KRPC{'streamyaw'}();
end