close all
fileDir = fileparts(mfilename('fullpath'));

map = loadMapFromImage( [fileDir, '/../maps/simple_100x100.png'] );
map = flipud(1 + map);

start = [65, 82];
goal = [80, 15];

parameters.max_branch_length = 5;
parameters.debug_plot = true;
parameters.goal_fixation_probability = 0.05;

[~,~, solution] = rrt(map, goal, parameters, start);
