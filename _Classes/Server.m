classdef Server < Communicator
	properties
	end

	methods
		function obj = Server(controller, port)
			obj = obj@Communicator(controller);
			if nargin < 2 || isempty(port)
				port = 9999; % same default port as the client
			end

			obj.comm = tcpip('0.0.0.0', port, 'NetworkRole', 'server'); % accept any incoming connections

			disp('Waiting for connection...')
			fopen(obj.comm);

			while isempty(obj.id)
				try			
					obj.queryID(); % query until filled
				end
			end
			fprintf('Connected to %s\n', obj.id)
		end

		function queryID(obj)
			% To get the ID of the client, so we know what we're connected to, since the server accepts any connections
			obj.id = char(obj.receive())';
		end
	end
end