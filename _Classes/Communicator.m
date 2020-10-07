classdef Communicator < handle
	properties
		id
		comm
		controller
	end

	methods
		function obj = Communicator(controller)
			obj.checkController(controller)
			obj.controller = controller;
		end

		function send(obj, data)
			fwrite(obj.comm, data);
		end

		function data = receive(obj)
			% try
				data = fread(obj.comm, obj.comm.BytesAvailable);
			% catch ME
			% 	if strcmp(ME.identifier, 'instrument:fread:invalidSIZEpos')
			% 		error('No data queued, nothing done.')
			% 	end
			% end
		end

		function check(obj)
			if obj.comm.BytesAvailable > 0
				obj.obey()
			end
		end

		function command(obj, command)
			idx = obj.controller.decode(command);
			obj.send(idx);
		end

		function obey(obj)
			idx = obj.receive();
			obj.controller.do(idx)
		end

		function checkController(obj, controller)
			if ~isa(controller, 'Controller')
				error('Please provide a proper controller.')
			end
		end
	end
end
