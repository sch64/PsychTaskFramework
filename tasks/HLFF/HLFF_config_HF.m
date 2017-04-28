function s = HLFF_config_HF(initial_config)
% HLFF_CONFIG_HF Configure high-fat blocks of high-/low-fat food task
  if exist('initial_config', 'var')
    s = initial_config;
  else
    s = config();
  end

  s.game.block.name = 'Food_HF';

  s.objects.lottery.stakes.fontSize = 24;
  s.objects.reference.fontSize = s.objects.lottery.stakes.fontSize;

  %% Lookup tables
  s.lookups.stakes.txt = {'No Oreos', '4 Oreos', '6 Oreos', ...
    '9 Oreos', '18 Oreos'};
  s.lookups.stakes.img = {'nothing.png', 'oreo1.jpeg', 'oreo2.jpeg', ...
    'oreo3.jpeg', 'oreo4.jpeg'};
  % Fix images to path
  s.lookups.stakes.img = prependPath(s.lookups.stakes.img, s.device.imgPath);
end
