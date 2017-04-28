function s = HLFF_config_M(initial_config)
% HLFF_CONFIG_HF Configure monetary blocks of high-/low-fat food task
  if exist('initial_config', 'var')
    s = initial_config;
  else
    s = config();
  end

  s.game.block.name = 'Monetary';

  s.objects.lottery.stakes.fontSize = 24;
  s.objects.reference.fontSize = s.objects.lottery.stakes.fontSize;

  %% Lookup tables
  s.lookups.stakes.txt = {'$0', '$5', '$8', ...
    '$12', '$25'};
  s.lookups.stakes.img = {'nothing.png', 'nothing.png', 'nothing.png', ...
    'nothing.png', 'nothing.png'};
  % Fix images to path
  s.lookups.stakes.img = prependPath(s.lookups.stakes.img, s.device.imgPath);
end
