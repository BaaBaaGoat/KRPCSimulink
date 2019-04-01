# KRPC Simulink Wrapper

- dependencies:
  - KRPC(tested V0.4.8)
    - default parameter(IP 127.0.0.1 port 50000 for RPC,and 50001 for streaming)
  - python(tested 3.6.7)
  - Matlab(>= 2018B)
- function:
  - read data from KSP
    - data read:
      - KSP time
      - vehicle
    - simulink time is synchrorized with KSP
  - set engine thrust in KSP
    - the aircraft in KSP must have 4 engines
    - the order of engine thrust data can be get by run "KRPC{'engine_tags'}" in matlab command window when simulink sim is started, after you set the tag of your engines
- demo:
  - aircraft:Quad.craft
  - start flight in KSP,ignite 4 engines and run the simulation,the drone will take off.
  - now only the inner PID loop was implemented so the drone can only keep attitude stable,can't keep a stable height and position.