function KRPC_Wrapper_DeInit()
global KRPC;
KRPC{'conn'}.close();
KRPC = [];
end