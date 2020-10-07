classdef Client < Communicator
	properties
	end

	methods
		function obj = Client(controller, address, id, port)
			obj = obj@Communicator(controller);
			if nargin < 2 || isempty(address)
				address = input('Input server address: ', 's');
            end
            
            if nargin < 3 || isempty(id)
				id = input('Input identifier: ', 's');
			end

			if nargin < 4 || isempty(port)
				port = 9999; % if there's no specific port in mind
			end
			obj.id = id;
			obj.comm = tcpip(address, port, 'NetworkRole', 'client');
			% try
				fopen(obj.comm);
			% catch ME
			% 	if strcmp(ME.identifier, 'instrument:fopen:opfailed')
   %                  error('Instantiate the server first, the ncome back and start the client.');
   %              end
			% end
			obj.identify()		
			fprintf('Connected!\n')	
		end

		function out = getID(obj)
			out = obj.id;
		end
		
		function identify(obj)
			% Identify yourself
			obj.send(obj.id);
		end
	end
end