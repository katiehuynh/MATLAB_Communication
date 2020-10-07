classdef Controller < handle
	properties
		module
	end

	methods
		function obj = Controller()
			disp('Choose your function module: ')
			module_fn = uigetfile('*.m');
			obj.module = evalin('caller', module_fn(1:end-2));
		end

		function idx = decode(obj, command)
			module_names = cellfun(@func2str, obj.module, 'UniformOutput', false);
			idx = find(contains(module_names, command)); % find the position in the module that corresponds to the function you want to run		
		end

		function do(obj, input)
			feval(obj.module{input})
		end
	end
end
