import krpc
import time
def connect():
	conn = krpc.connect(
		name='My Example Program',
		address='127.0.0.1',
		rpc_port=50000, stream_port=50001)
	space_center = conn.space_center;
	vessel = space_center.active_vessel;
	# make stream
	streamTime = conn.add_stream(getattr,space_center,'ut');
	streamPositionECEF = conn.add_stream(vessel.position,vessel.orbit.body.reference_frame);
	streamVelocityECEF = conn.add_stream(vessel.velocity,vessel.orbit.body.reference_frame);
	#streamQuaternion = conn.add_stream(vessel.rotation,vessel.reference_frame);
	#streamAngularVelocity = conn.add_stream(vessel.angular_velocity,vessel.reference_frame);
	streamQuaternion = conn.add_stream(vessel.rotation,vessel.surface_reference_frame);
	streamAngularVelocity = conn.add_stream(vessel.angular_velocity,vessel.surface_reference_frame);
	
	flight_ENU = vessel.flight();
	streamLatitude = conn.add_stream(getattr,flight_ENU,'latitude');
	streamLongitude = conn.add_stream(getattr,flight_ENU,'longitude');
	streamHeight = conn.add_stream(getattr,flight_ENU,'surface_altitude');
	
	streampitch = conn.add_stream(getattr,flight_ENU,'pitch');
	streamyaw = conn.add_stream(getattr,flight_ENU,'heading');
	streamroll = conn.add_stream(getattr,flight_ENU,'roll');
	
	control = vessel.control;
	streamControlPitch = conn.add_stream(getattr,control,'pitch');
	streamControlRoll = conn.add_stream(getattr,control,'roll');
	streamControlYaw = conn.add_stream(getattr,control,'yaw');
	
	interfControl = control;# set it's throttle
	interfEngines = vessel.parts.engines;# set it's thrust_limit
	engine_tags = [i.part.tag for i in interfEngines];
	return {
		'conn':conn,
		't0':streamTime(),
		'space_center':space_center,
		'vessel':vessel,
		'streamTime':streamTime,
		'streamPositionECEF':streamPositionECEF,
		'streamVelocityECEF':streamVelocityECEF,
		'streamQuaternion':streamQuaternion,
		'streamAngularVelocity':streamAngularVelocity,
		'flight_ENU':flight_ENU,
		'streamLatitude':streamLatitude,
		'streamLongitude':streamLongitude,
		'streamHeight':streamHeight,
		'control':control,
		'streamControlPitch':streamControlPitch,
		'streamControlRoll':streamControlRoll,
		'streamControlYaw':streamControlYaw,
		'streampitch':streampitch,
		'streamyaw':streamyaw,
		'streamroll':streamroll,
		'interfControl':interfControl,
		'interfEngines':interfEngines,
		'engine_tags':engine_tags
	};
def disconnect(conn):
	conn.close();