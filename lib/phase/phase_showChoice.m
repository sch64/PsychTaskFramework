function [ trialData ] = phase_showChoice(trialData, blockSettings, phaseSettings)
% PHASE_SHOWCHOICE Shows the choices defined in trialData and blockData to the
%   participant. This includes a lottery and a reference. If available, executes
%   action defined in phaseSettings.action; otherwise, waits for duration.

windowPtr = blockSettings.device.windowPtr;

% Draw the background
if isfield(blockSettings.game, 'bgrDrawFn') && ...
    isa(blockSettings.game.bgrDrawFn, 'function_handle')
  blockSettings.game.bgrDrawFn(blockSettings);
end

% Draw the lottery box
drawLotto(trialData, blockSettings);

% Draw the reference value
blockSettings.game.referenceDrawFn(blockSettings, trialData);

% Show all drawn objects and retrieve the timestamp of display
[~, ~, phaseSettings.startTimestamp, ~, ~] = Screen('flip', windowPtr);
trialData.choiceStartTime = datevec(now);
trialData.showChoiceStartTS = phaseSettings.startTimestamp;

%% Handle the display properties & book-keeping
if exist('phaseSettings', 'var') && isfield(phaseSettings, 'action') ...
    && isa(phaseSettings.action, 'function_handle')
  % Allow the execution of a actionFnHandle if passed
  trialData = phaseSettings.action(trialData, blockSettings, phaseSettings);
else
  % Deprecated: Display choice for blockSettings.game.durations.showChoice
  trialData = timeChoice(trialData, blockSettings);
end
end

% Old behavior -- let the function automagically find the duration to have
% Deprecated: remains for backwards compatibility
function trialData = timeChoice(trialData, blockSettings)
  % Extract to local variables now because struct field access costs time
  trialStart = trialData.choiceStartTime;
  trialDur = blockSettings.game.durations.showChoice;

  elapsedTime = etime(datevec(now), trialStart);
  while elapsedTime < trialDur
      elapsedTime = etime(datevec(now), trialStart);
  end
end
