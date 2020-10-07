% FOLLOW STEPS CAREFULLY
addpath('./_Classes');

%% STEP 1: RUN THIS CHUNK
controller = Controller; % instantiate the controller, which acts as a dictionary between the server and possible functions
% Choose 'test_functions.m'

s = Server(controller); % instantiate the server, will wait for a client to be made

%% STEP 2: GO TO client_master.m

% steps 3-5 in client_master.m

%% STEP 6: RUN THIS
function_idx = 1; % wrt to the order in test_functions.m
s.send(function_idx); % run that particular function

%% DONE