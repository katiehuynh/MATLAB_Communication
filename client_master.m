%% IF YOU'RE HERE BEFORE GOING TO server_master.m, GO THERE FIRST
addpath('./Classes');
%% STEP 3: RUN THIS

controller = Controller; % instantiate the controller, which acts as a dictionary between the client and possible functions
% Choose 'test_functions.m'

c = Client(controller, '0.0.0.0', 1); % pass controller to client, the IP of the server, and the identifier (in case of multiple clients)


%% STEP 4: RUN THIS CHUNK
while true
    c.check(); % check for any info sent by the server
end


%% STEP 5: BACK TO server_master.m