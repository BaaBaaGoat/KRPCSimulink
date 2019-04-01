function KRPC_Wrapper_Init()
global KRPC;
global KRPC_t0;
KRPC = py.KRPC_Wrapper_py.connect();
KRPC_t0 = KRPC{'t0'};
end